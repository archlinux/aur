# Maintainer='Azat Khuzhin <a3at.mail@gmail.com>'

pkgname=popt-deb
pkgver=1.18
_patchver=${pkgver}-3
pkgrel=1
pkgdesc='popt with debian patches (mostly to avoid double free)'
arch=(x86_64)
url="https://github.com/rpm-software-management/popt"
license=(custom)
provides=(popt)
conflicts=(popt)
options=('staticlibs')
source=("https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-${pkgver}.tar.gz"
        "https://deb.debian.org/debian/pool/main/p/popt/popt_${_patchver}.debian.tar.xz")
sha256sums=('5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1'
            '6bb1de379eb2bf0a3a9e25ce26a4dd111878699c35116fa4d45d4814280f0bc9')

prepare() {
  cd "popt-${pkgver}"
  for patch in ../debian/patches/*.patch; do
    patch -p1 < $patch
  done
}

build() {
  cd "popt-${pkgver}"
  # Avoid stripping issue
  CFLAGS+=" -ffat-lto-objects" ./configure --prefix=/usr --enable-static
  make
}

package() {
  cd "popt-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
