# Maintainer: Sean Behan <codebam@riseup.net>
#
# The shell drawn by WebKitGTK, in a process of its own as an ordinary Wayland
# client of this compositor. Nothing here builds an engine: `webkitgtk-6.0` is
# a package.
#
# The development version: this one follows `main` rather than a tag, so what
# it builds is whatever was pushed. `viewport-webkitgtk` is the same recipe cut
# from the last release, and `viewport-webkitgtk-bin` is that release already
# built — a system takes one of the three, and one engine.
#
# `pkgver()` reports the last tag, how many commits past it the checkout is,
# and which commit — `0.1.5.r12.gdeadbee` — so an installed snapshot sorts
# above the release it came after and says on sight what it is.

pkgname=viewport-webkitgtk-git
pkgver=0.1.8.r167.gff59517
pkgrel=1
pkgdesc='Wayland compositor whose shell is a web page — WebKitGTK, out of process (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/codebam/viewport'
license=('GPL-3.0-or-later')

depends=(
  'wayland'
  'libxkbcommon'
  'libdrm'
  'libinput'
  'seatd'
  'systemd-libs'
  'mesa'
  'libglvnd'
  'vulkan-icd-loader'
  'pipewire'
  'libxcb'
  'webkitgtk-6.0'
  'gtk4'
  # WebKit guesses the type of a file:// page from the shared MIME database.
  # Without it the bundled shell loads "successfully" and draws nothing.
  'shared-mime-info'
)

optdepends=(
  'xorg-xwayland: X11 clients'
  'xdg-desktop-portal-gtk: the portal interfaces the compositor does not answer itself'
  # Vulkan is the renderer wherever a Vulkan device owns the display; without
  # one the compositor draws with OpenGL instead, so these are what decide
  # which of the two a machine gets rather than whether it starts at all.
  'vulkan-radeon: AMD hardware'
  'vulkan-intel: Intel hardware'
  'nvidia-utils: NVIDIA hardware, and hardware video decode with it'
  # In a virtual machine: Venus passes Vulkan through to the host's GPU, and
  # needs the host to offer it — QEMU wants
  # `-device virtio-gpu-gl-pci,venus=on,blob=on,hostmem=2G`. Without it the
  # only device that loads is lavapipe, which owns no DRM node, cannot drive
  # a display, and turns every shell-frame copy into a copy on the CPU.
  'vulkan-virtio: a virtual machine with 3D acceleration'
  'vulkan-swrast: software Vulkan, for tests rather than a session'
  'libva-mesa-driver: hardware video decode, for zero-copy video'
  # The bar's icons are Material Design glyphs from a Nerd Font patch, and the
  # family names in data/shell/shell.css are the ones fontconfig reports:
  # "FiraCode Nerd Font" first, "Symbols Nerd Font" as the fallback that
  # carries the glyphs without the monospace face. With neither installed the
  # bar still lays out and every icon in it is a replacement box.
  'ttf-firacode-nerd: the icons in the bar, and the font the shell names first'
  'ttf-nerd-fonts-symbols: the icons in the bar, without the patched monospace family'
)

makedepends=(
  # cargo comes with it: Arch has no separate cargo package, and naming
  # one fails dependency resolution before a line is compiled.
  'rust'
  'git'
  'pkgconf'
  'clang'
  'vulkan-headers'
  'wayland-protocols'

)

provides=("viewport=$pkgver" "viewport-webkitgtk=$pkgver")
conflicts=('viewport'
           'viewport-webkitgtk'
           'viewport-wpe'
           'viewport-chromium')
options=('!lto')

source=("viewport::git+https://github.com/codebam/viewport.git")
sha256sums=('SKIP')

# The version, read off the checkout rather than written here: the last tag,
# the distance from it, and the commit.
#
# makepkg runs this after fetching and rewrites the `pkgver=` above with what
# it returns, so the number in the recipe is whatever the last person to build
# it saw — one commit behind by construction, which is what every VCS package
# in the AUR carries. It is a marker, not a claim: what gets installed is
# always what `main` says at build time.
pkgver() {
  cd "$srcdir/viewport"
  git describe --long --tags --abbrev=7 \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/viewport"
  # A git dependency (the smithay fork, for the tearing-control patch) has to
  # be fetched here rather than during build(), so build() is the only step
  # that has to work offline.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/viewport"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p viewport -p viewport-shell-gtk
}

package() {
  cd "$srcdir/viewport"

  # Which engine this package installed, said outright. The binary picks a
  # default of its own and cannot know which shell program is beside it, so a
  # wrapper names it. `${VIEWPORT_SHELL_BACKEND:-}` first, so `--shell-backend`
  # and the config file still win.
  install -Dm755 target/release/viewport "$pkgdir/usr/lib/viewport/viewport"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/viewport" <<'EOF'
#!/bin/sh
export VIEWPORT_SHELL_BACKEND="${VIEWPORT_SHELL_BACKEND:-webkitgtk}"
# And where the shell is. The compositor finds its own assets at
# `<prefix>/share/viewport`, taken from the directory two above the binary —
# which works for /usr/bin/viewport and does not for the wrapped layout here:
# /usr/lib/viewport/viewport gives /usr/lib/share/viewport, nothing is there,
# and it falls back to `$PWD/data/shell`. A login shell starts in $HOME, so
# that is a black screen with a working cursor and one line in the log:
#
#   the shell page failed to load from file:///home/you/data/shell/index.html
#
# Set only when unset, so --url and the config file still win.
export VIEWPORT_SHELL_URL="${VIEWPORT_SHELL_URL:-file:///usr/share/viewport/shell/index.html}"
exec /usr/lib/viewport/viewport "$@"
EOF
  install -Dm755 target/release/viewport-shell-gtk \
    "$pkgdir/usr/lib/viewport/viewport-shell-gtk"

  # The shell itself, and the page it falls back to. Without them an installed
  # compositor has nothing to load: the default URL resolves beside the binary,
  # and a session started from a login shell has no source tree under it.
  install -dm755 "$pkgdir/usr/share/viewport"
  cp -r data/shell "$pkgdir/usr/share/viewport/shell"
  install -Dm644 data/fallback.html "$pkgdir/usr/share/viewport/fallback.html"
  install -Dm644 data/config.example.json \
    "$pkgdir/usr/share/viewport/config.example.json"

  # How xdg-desktop-portal learns this backend exists. Without the file the
  # frontend does not know the name "viewport" refers to anything, so a config
  # naming it matches nothing and the request goes elsewhere.
  install -Dm644 data/portal-share/xdg-desktop-portal/portals/viewport.portal \
    "$pkgdir/usr/share/xdg-desktop-portal/portals/viewport.portal"

  # The session target the compositor starts on launch. Without it
  # graphical-session.target stays inactive, and xdg-desktop-portal — which
  # holds Requisite=graphical-session.target — refuses to start at all, taking
  # the Settings interface and every application's dark theme with it.
  install -Dm644 data/systemd/user/viewport-session.target \
    "$pkgdir/usr/lib/systemd/user/viewport-session.target"

  install -Dm644 docs/viewport.1 "$pkgdir/usr/share/man/man1/viewport.1"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true

  install -Dm644 /dev/stdin "$pkgdir/usr/share/wayland-sessions/viewport.desktop" <<'EOF'
[Desktop Entry]
Name=Viewport
Comment=Wayland compositor with a WebKitGTK shell
Exec=viewport
Type=Application
EOF
}
