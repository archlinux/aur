# Maintainer: JuanJo Ciarlante <jjo@users.noreply.github.com>
#
# VCS PKGBUILD for the COSMIC panel applet. Tracks `main`.
pkgname=cosmic-applet-colortemp-git
_pkgname=drm-colortemp
_appletname=cosmic-applet-colortemp
pkgver=2.0.1.r0.g0000000
pkgrel=1
pkgdesc="COSMIC panel applet for drm-colortemp: one-click screen color temperature (git)"
arch=('x86_64')
url="https://github.com/jjo/drm-colortemp"
license=('Apache-2.0')
# kbd provides chvt/fgconsole, used by the root helper; sudo authorizes it.
# libcosmic/winit dlopen() libwayland-client and libxkbcommon; the applet renders
# with tiny-skia/softbuffer (software), so no Vulkan or GL runtime is needed.
depends=('drm-colortemp' 'gcc-libs' 'libxkbcommon' 'wayland' 'sudo' 'kbd'
         'ttf-font' 'hicolor-icon-theme')
# winit's X11 backend is also dlopen()ed; unused under COSMIC (Wayland).
optdepends=('libx11: X11 backend fallback'
            'libxcb: X11 backend fallback'
            'libxi: X11 backend fallback')
makedepends=('rust' 'cargo' 'git')
provides=("$_appletname=$pkgver")
conflicts=("$_appletname")
backup=('etc/sudoers.d/drm-colortemp-applet')
source=("$_pkgname::git+https://github.com/jjo/drm-colortemp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname/applet"
  export CARGO_HOME="$srcdir/.cargo"
  # libcosmic is a pinned git dependency; cargo fetch resolves it here so the
  # build itself can run --frozen.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname/applet"
  export CARGO_HOME="$srcdir/.cargo"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname/applet"

  install -Dm755 target/release/cosmic-applet-colortemp \
    "$pkgdir/usr/bin/cosmic-applet-colortemp"

  # Root helper performing the chvt dance; the only privileged component.
  install -Dm755 helper/drm-colortemp-apply "$pkgdir/usr/bin/drm-colortemp-apply"

  install -Dm644 data/io.github.jjo.CosmicAppletColortemp.desktop \
    "$pkgdir/usr/share/applications/io.github.jjo.CosmicAppletColortemp.desktop"
  install -Dm644 data/icons/io.github.jjo.CosmicAppletColortemp-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.jjo.CosmicAppletColortemp-symbolic.svg"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$_appletname/README.md"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$_appletname/LICENSE"

  # Upstream sources default to the source-install prefix.
  sed -i 's|/usr/local/bin|/usr/bin|g' \
    "$pkgdir/usr/share/applications/io.github.jjo.CosmicAppletColortemp.desktop"

  # A package cannot know which user runs the panel, so grant the three exact
  # helper commands to the wheel group instead of a username.
  install -d "$pkgdir/etc/sudoers.d"
  sed -e 's|@PRINCIPAL@|%wheel|g' -e 's|@BINDIR@|/usr/bin|g' \
    data/drm-colortemp-applet.sudoers.in \
    > "$pkgdir/etc/sudoers.d/drm-colortemp-applet"
  chmod 0440 "$pkgdir/etc/sudoers.d/drm-colortemp-applet"
  visudo -cf "$pkgdir/etc/sudoers.d/drm-colortemp-applet" >/dev/null
}
