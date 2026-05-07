# Maintainer: Eduardo J. Becker <147226263+TanF12@users.noreply.github.com>
pkgname=stellarfiles-git
_pkgname=stellarfiles
pkgver=v0.4.1.r0.gf34136a
pkgrel=1
pkgdesc="A minimalist, fast native Linux file manager built for the Cosmic Desktop Environment."
arch=('x86_64')
url="https://github.com/TanF12/stellarfiles"
license=('AGPL-3.0-only')

depends=('gcc-libs' 'glibc' 'ffmpeg')
makedepends=('git' 'cargo' 'rust' 'clang' 'pkgconf')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+https://github.com/TanF12/stellarfiles.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "0.3.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  
  cargo build --frozen --release
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  
  sed -i 's|Exec=.*|Exec=stellarfiles %U|' org.freedesktop.impl.portal.desktop.stellarfiles.desktop
  install -Dm644 "org.freedesktop.impl.portal.desktop.stellarfiles.desktop" "$pkgdir/usr/share/applications/org.freedesktop.impl.portal.desktop.stellarfiles.desktop"
  
  sed -i 's|Exec=.*|Exec=/usr/bin/stellarfiles|' org.freedesktop.impl.portal.desktop.stellarfiles.service
  install -Dm644 "org.freedesktop.impl.portal.desktop.stellarfiles.service" \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.stellarfiles.service"
  install -Dm644 "stellarfiles.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/stellarfiles.portal"
  
  if [ -f "LICENSE" ]; then
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
