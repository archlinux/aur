# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Paul Dino Jones "ZitZ" <Raptorman18@gmail.com>

pkgname=openjazz
pkgver=20190106
pkgrel=1
pkgdesc="A free, open-source version of the classic Jazz Jackrabbit™ games"
arch=('i686' 'x86_64')
url="http://alister.eu/jazz/oj/"
license=('GPL')
depends=('zlib' 'sdl' 'libmodplug')
makedepends=('perl-podlators')
install=openjazz.install
source=("https://github.com/AlisterT/openjazz/releases/download/$pkgver/openjazz-$pkgver.tar.xz"
        "https://github.com/AlisterT/openjazz/raw/$pkgver/unix/OpenJazz.6.pod")
sha256sums=('91341adcc4908db12aad6b82d2fb0125429a26585f65d7eb32d403656313eaab'
            '60c382efd5ba101dfcc9a216ed1f19e3cec4183f338445e14fc1446e17898a70')

prepare() {
  # look in home directory for data files
  sed 's|"/."|"/.openjazz/"|' -i $pkgname-$pkgver/src/main.cpp

  # generate manual page
  pod2man -c "OpenJazz Manual" -n OpenJazz -r "OpenJazz $pkgver" OpenJazz.6.pod OpenJazz.6
}

build() {
  cd $pkgname-$pkgver
  export CPPFLAGS="$CPPFLAGS -DDATAPATH=\\\"/usr/share/openjazz/\\\" -DHOMEDIR"
  ./configure --prefix=/usr
  make
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
  # install manual page
  install -Dm644 OpenJazz.6 "$pkgdir"/usr/share/man/man6/OpenJazz.6
}
