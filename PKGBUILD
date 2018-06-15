# Maintainer: Tmplt <tmplt@dragons.rocks>
pkgname=katriawm
pkgver=18.05
pkgrel=1
pkgdesc="A non-reparenting, dynamic window manager for X11 with decorations"
arch=("i686" "x86_64")
url="https://github.com/vain/${pkgname}"
license=("MIT")
makedepends=("git" "pkg-config")
depends=("libx11" "libxft" "libxrandr")
source=("https://github.com/vain/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("6e8e3831d3b7a5807fd3c1ba44e4a1b41bbb1388fa003189391d8fd0d1297782")

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
