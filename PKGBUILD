# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Linux port & fixes by Ondřej Hošek (RavuAlHemio) and @contributors (https://github.com/RavuAlHemio/hllib)

pkgname=hlextract
pkgver=2.4.6
pkgrel=1
pkgdesc="Extract Tool and Lib for open Half-Life and other games package formats"
arch=('x86_64')
url='https://nemstools.github.io/pages/Miscellaneous-HLLib.html'
license=('GPL' 'LGPL')
depends=('gcc-libs')
makedepends=('git')
provides=('hlextract'
          'hllib'
          )
source=("hllib-${pkgver}.zip::http://nemstools.github.io/files/hllib${pkgver//./}.zip"
        "hllib-${pkgver}-r1.patch"
        )
sha256sums=('ed12bee31ec867a92e3daf4c52653ea2afb78c4ce69ca01a6f1588068ae5a1e9'
            'c239792ebe829d802f472b91747b4bb44aa8562a705eb18edf03adb47392a925'
            )
noextract=("hllib-${pkgver}.zip")

prepare() {
  mkdir -p build
  cd build
  bsdtar -xf "${srcdir}/hllib-${pkgver}.zip"

  patch -p1 -i "${srcdir}/hllib-${pkgver}-r1.patch"

  # Damm DOS
  find . -type f -exec perl -pi -e 's/\r\n?/\n/g' "{}" \;
}

build() {
  make -C build/HLLib
  make -C build/HLExtract
}

package() {
  make -C build/HLLib PREFIX="${pkgdir}/usr" install
  make -C build/HLExtract PREFIX="${pkgdir}/usr" install
  install -Dm644 build/Readme.txt "${pkgdir}/usr/share/doc/${pkgname}/Readme.txt"
}
