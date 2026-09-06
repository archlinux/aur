# Maintainer: Sean Behan <codebam@riseup.net>
#
# The shell drawn by WPE WebKit, inside the compositor process.
#
# One of nine recipes under packaging/aur: three engines — see
# docs/shell-backends.md — each as this, a `-git` form following `main`, and a
# `-bin` form unpacking the release. Every one of them installs a binary called
# `viewport` and provides that name, so they conflict with each other: a machine
# takes one engine in one form.
#
# This is the only variant that has an engine inside the compositor, and the
# only one whose engine has to exist as a package: wpewebkit is in the Arch
# repositories with the WPE platform API enabled, so wpe-platform-2.0.pc is
# there and no WebKit is compiled here.

pkgname=viewport-wpe
pkgver=0.2.0
pkgrel=1
pkgdesc='Wayland compositor whose entire shell is a web page — the Smithay rewrite'
arch=('x86_64' 'aarch64')
url='https://github.com/codebam/viewport'
license=('GPL-3.0-or-later')

# The tag this package was cut from, and the whole of what makes it
# reproducible: a branch would move under it, and a PKGBUILD that follows a
# moving branch does not describe any particular package.
#
# A tag while there is one, a commit while there is not. Between releases this
# carries `_commit` and a `pkgver` of the git-describe form — the last release,
# how many commits past it, and which one — because naming a stale tag would be
# a lie about what was built. At a release the two say the same thing and the
# tag is the one anybody can check.
_tag=v0.2.0

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
  'wpewebkit'
  'glib2'
  'libxcb'
  'pipewire'
  # WebKit guesses the type of a file:// page from the shared MIME database,
  # because nothing else tells it. Without this every local page is treated as
  # an empty document: the load reports started, committed and finished, not
  # one script runs, and the desktop comes up with no bar and nothing laid out.
  # The bundled shell is loaded from file://, so this is a hard dependency —
  # and its absence looks like a compositor bug, not a missing package.
  'shared-mime-info'
)

optdepends=(
  'xorg-xwayland: X11 clients'
  'xdg-desktop-portal-gtk: the portal interfaces the compositor does not answer itself'
  # Vulkan is the renderer wherever a Vulkan device owns the display; without
  # one the compositor draws with OpenGL instead, so these decide which of the
  # two a machine gets rather than whether it starts at all.
  'vulkan-radeon: AMD hardware'
  'vulkan-intel: Intel hardware'
  'nvidia-utils: NVIDIA hardware, and hardware video decode with it'
  # In a virtual machine: Venus passes Vulkan through to the host's GPU, and
  # needs the host to offer it — QEMU wants
  # `-device virtio-gpu-gl-pci,venus=on,blob=on,hostmem=2G`. Without it the
  # only device that loads is lavapipe, which owns no DRM node, cannot drive a
  # display, and turns every shell-frame copy into a copy on the CPU.
  'vulkan-virtio: a virtual machine with 3D acceleration'
  'vulkan-swrast: software Vulkan, for tests rather than a session'
  # The compositor imports the multi-planar YUV a hardware decoder produces
  # (NV12, P010 and the rest), so a player can hand over the decoder's own
  # buffer with nothing converted in between. That only happens if the player
  # can decode in hardware in the first place, which is what these provide.
  # Without one, video still plays — the player converts each frame itself,
  # which is the cost the import path exists to avoid.
  'libva-mesa-driver: hardware video decode on AMD and Intel, for zero-copy video'
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

provides=("viewport=$pkgver")
conflicts=('viewport' 'viewport-webkitgtk' 'viewport-chromium')
options=('!lto')

source=("git+https://github.com/codebam/viewport.git#tag=$_tag")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/viewport"
  # A git dependency (the smithay fork, for the tearing-control patch) has to
  # be fetched here rather than during build(), so that build() is the only
  # step that has to work offline.
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/viewport"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # --features wpe is not the default, and without it there is no shell at all:
  # grey where the wallpaper and the bar should be, and nothing in the log to
  # say why.
  cargo build --frozen --release -p viewport --features wpe
}

package() {
  cd "$srcdir/viewport"

  install -Dm755 target/release/viewport "$pkgdir/usr/bin/viewport"

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
Comment=Wayland compositor with a WPE WebKit shell
Exec=viewport
Type=Application
EOF
}
