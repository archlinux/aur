# Maintainer: Tmplt <tmplt@dragons.rocks>
pkgname=katriawm
pkgver=17.10
pkgrel=3
pkgdesc="A non-reparenting, dynamic window manager for X11 with decorations"
arch=("i686" "x86_64")
url="https://github.com/vain/${pkgname}"
license=("MIT")
makedepends=("git" "pkg-config")
depends=("libx11" "libxft" "libxrandr")
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("b2ab81a39292159accbc8d49f5afb4de8a670bb36e278e2162e2eb44ce57275e")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  # Read custom config headers from $XDG_CONFIG_HOME/katria{wm,bi}-config.h

  config=${XDG_CONFIG_HOME:-~/.config/}

  if [[ -f "${config}/katriawm-config.h" ]]; then
      msg "Using custom config.h for katriawm(1)"
      cp -f "${config}/katriawm-config.h" core/config.h
  fi

  if [[ -f "${config}/katriabi-config.h" ]]; then
      msg "Using custom config.h for katriabi(1)"
      cp -f "${config}/katriabi-config.h" barinfo/config.h
  fi
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"
  make DESTDIR=${pkgdir} PREFIX=/usr MANPREFIX=/usr/share/man install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
