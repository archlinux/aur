# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=kawanime
pkgver=0.4.1
pkgrel=2
provides=("kawanime")
conflicts=("kawanime")
pkgdesc="Desktop app for anime fans"
arch=('x86_64')
url="https://github.com/Kylart/KawAnime"
license=('MIT')
depends=('dbus' 'glib2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('npm' 'python' 'nodejs')
#dpkg is not actually needed, it's just to avoid a build failure
source=("https://github.com/Kylart/KawAnime/archive/v${pkgver}.tar.gz")
sha256sums=('d929f1e06875445a5974e7296fe56394ac4b838f47717c932c21b877a0dc3aa9')

build() {
 cd "$srcdir/KawAnime-$pkgver"
 export VUE_APP_ANILIST_CLIENT_ID=2025
 npm install
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
