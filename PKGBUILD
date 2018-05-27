# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime
pkgver=0.2.5
pkgrel=1
provides=("kawanime")
conflicts=("kawanime")
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/KawAnime/archive/v${pkgver}.tar.gz")
sha256sums=('cccff85f54cdfcb8cda9f2c016e7bc87874f2162167c0006e12ca1c87d377c4c')

build() {
 cd "$srcdir/KawAnime-$pkgver"
 npm install
 npm run build
 npm run dist:linux
}

package() {
  cd "$srcdir/KawAnime-$pkgver/dist"
  ar x KawAnime_${pkgver}_amd64.deb
  tar -xf data.tar.xz
  mv usr "${pkgdir}"
  mv opt "${pkgdir}"
  mkdir -p "${pkgdir}"/usr/bin

  install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
  #!/usr/bin/bash
  /opt/KawAnime/kawanime

END
}
