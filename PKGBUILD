# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Linux port fixes by Ondřej Hošek (RavuAlHemio) https://github.com/RavuAlHemio

pkgname=hlextract
pkgver=2.4.5
pkgrel=4
pkgdesc="Extract Tool and Lib for open Half-Life and other games package formats"
arch=('i686' 'x86_64')
url='http://nemesis.thewavelength.net/index.php?c=108'
license=('GPL' 'LGPL')
provides=('hlextract' 'hllib')
makedepends=('git')
source=("http://nemesis.thewavelength.net/files/files/hllib${pkgver/./}.zip"
        "hllib-${pkgver}v2.patch")
sha1sums=('2b2b9900e7cc412c6d36224d469c9a6b0477011f'
          'SKIP')
noextract=("hllib${pkgver/./}.zip")

prepare() {
  mkdir -p build
  cd build
  bsdtar -xf "../hllib${pkgver/./}.zip"
  # Damm DOS
  find -type f -exec perl -pi -e 's/\r\n?/\n/g' "{}" \;

  patch -p0 -i "../hllib-${pkgver}v2.patch"

  sed 's|-fs $(PREFIX)/lib/|-fs |g' -i HLLib/Makefile
}

build() {
  make -C build/HLLib PREFIX=/usr
  make -C build/HLExtract PREFIX=/usr
}

package() {
  make -C build/HLLib PREFIX="${pkgdir}/usr" install
  make -C build/HLExtract PREFIX="${pkgdir}/usr" install
  install -Dm644 build/Readme.txt "${pkgdir}/usr/share/doc/${pkgname}/Readme.txt"
}
