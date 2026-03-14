# Maintainer: Lucas Santos <hello@lsantos.dev>
#
# NOTE: This file is heavily commented on purpose.
# I tend to forget how PKGBUILDs work between packages, so I document
# everything here to future-proof myself. If you're reading this and
# you already know what you're doing, feel free to ignore the comments.

# The package name. The -git suffix is an AUR convention meaning this package
# tracks the live git repo instead of a versioned release tarball.
pkgname=walt-git

# Placeholder set here, but pkgver() below overwrites this at build time
# using `git describe`. It needs to exist as a variable for makepkg to parse
# the file before any functions run.
pkgver=0.9.1.r0.g63c2efb

# Increment this when the PKGBUILD itself changes but the upstream source
# hasn't. Reset to 1 whenever pkgver changes.
pkgrel=1

# Short description shown by pacman and AUR helpers.
pkgdesc="A fast terminal wallpaper picker for Hyprland with in-place previews, keyboard-first navigation, and auto-rotation"

# Architectures this package supports. 'any' would mean architecture-independent
# (scripts, fonts, etc.). Since we compile a Rust binary we list explicitly.
arch=('x86_64' 'aarch64')

# Upstream URL shown on the AUR page.
url="https://github.com/gitfudge0/walt"

# SPDX license identifier. Declared MIT in the upstream README.
license=('MIT')

# Hard runtime dependencies — pacman will refuse to install without these.
# hyprpaper: the wallpaper daemon walt talks to for switching backgrounds.
# xdg-desktop-portal: base portal package required by the rfd file-picker
#   crate at runtime on Wayland (used by `walt gui`).
depends=('hyprpaper' 'xdg-desktop-portal')

# Optional runtime dependencies. pacman won't pull these in automatically,
# but will list them with a hint after installation. The user needs exactly
# one portal backend for the GUI file picker to work — which one depends
# on their compositor/DE. The install script also checks for this.
optdepends=(
  'xdg-desktop-portal-hyprland: file picker support on Hyprland'
  'xdg-desktop-portal-wlr: file picker support on wlroots compositors'
  'xdg-desktop-portal-kde: file picker support on KDE Plasma'
  'xdg-desktop-portal-gnome: file picker support on GNOME'
  'xdg-desktop-portal-gtk: file picker support (generic GTK fallback)'
)

# Build-time only dependencies — removed after the package is built.
# rustup: used instead of the `rust` package because the repo's dependencies
#   require a newer rustc than what Arch ships in `extra/rust`. rustup lets
#   us pull in the latest stable toolchain at build time.
# git: needed to clone the source and for pkgver() to run `git describe`.
# gendesk: generates the .desktop file for the GUI launcher entry.
makedepends=('rustup' 'git' 'gendesk')

# Points to the .install script that pacman runs after installation.
# This is where post-install messages and runtime checks live.
install="${pkgname}.install"

# Tells AUR helpers that this package satisfies the `walt` dependency,
# so other packages that depend on `walt` will accept this -git variant.
provides=('walt')

# Prevents installing alongside a stable `walt` package to avoid two
# competing binaries at /usr/bin/walt.
conflicts=('walt')

# !debug suppresses creation of a separate debug symbol package.
# The binary's embedded source paths are already cleaned up via
# --remap-path-prefix in build(), so there's nothing useful to split out.
options=('!debug')

# The source array. The `pkgname::` prefix is an alias — makepkg clones
# the repo into $srcdir/walt-git/ instead of the default folder name.
# git+ tells makepkg this is a VCS source (no checksum needed).
source=("${pkgname}::git+https://github.com/gitfudge0/walt.git")

# SKIP is correct for git sources — there's no static archive to checksum.
# The clone itself is verified by git's object integrity checks.
sha256sums=('SKIP')

# Runs after the source is fetched to determine the real package version.
# `git describe --long --tags` produces e.g. "v0.7.0-1-gabcdef1".
# The sed transforms that into AUR-friendly "0.7.0.r1.gabcdef1":
#   s/^v//        — strip the leading 'v'
#   s/([^-]*-g)/r\1/ — insert 'r' before the commit count+hash segment
#   s/-/./g       — replace all remaining dashes with dots
pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Runs before build(). We generate the .desktop file here rather than in
# build() because it doesn't depend on the compiled binary.
# -f: overwrite any existing .desktop file
# -n: don't prompt interactively
# --terminal=false: this is a GUI app, don't open in a terminal
# --icon: use a standard freedesktop icon name (no custom icon in the repo)
prepare() {
  gendesk -f -n \
    --pkgname "walt" \
    --name "Walt Wallpaper Picker" \
    --pkgdesc "${pkgdesc}" \
    --exec "walt gui" \
    --categories "Graphics;Utility;" \
    --terminal=false \
    --icon "preferences-desktop-wallpaper"
}

build() {
  cd "${srcdir}/${pkgname}"

  # Install the latest stable Rust toolchain via rustup. We need this because
  # the repo's dependencies (eframe, egui, darling) require rustc >= 1.88,
  # but Arch's `extra/rust` package currently ships an older version.
  # --profile minimal skips docs and other extras to keep the download small.
  rustup toolchain install stable --profile minimal
  rustup default stable

  # The Arch build environment sets RUSTUP_TOOLCHAIN to pin an older version.
  # Unset it so our `rustup default stable` above actually takes effect.
  unset RUSTUP_TOOLCHAIN

  # Remap the $srcdir prefix embedded in the compiled binary back to a
  # generic /build path. Without this, makepkg warns that the package
  # "contains reference to $srcdir", which would expose the local build
  # path in the distributed binary.
  export RUSTFLAGS+=" --remap-path-prefix=${srcdir}=/build"

  # --release: optimised build (matches the upstream install.sh behaviour)
  # --locked: respect the committed Cargo.lock for reproducible dependency versions
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${pkgname}"

  # Install the compiled binary.
  # -D: create parent directories as needed
  # -m755: executable permissions (rwxr-xr-x)
  install -Dm755 target/release/walt "${pkgdir}/usr/bin/walt"

  # Install the generated .desktop file so the GUI picker (`walt gui`)
  # appears in application launchers (Rofi, Wofi, etc.).
  # -m644: read-only for everyone, no execute bit needed for data files
  install -Dm644 "${srcdir}/walt.desktop" "${pkgdir}/usr/share/applications/walt.desktop"
}
