# Maintainer: Zach Callear <zach@callear.org>
# Contributor: Mark Quinn <mmq.arch@dekinai.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=imgmin
pkgname=$_pkgname-git
pkgver=1.1.r6.gea2b77c
pkgrel=1
pkgdesc="Automated lossy JPEG optimization"
arch=('i686' 'x86_64')
url="https://github.com/rflynn/imgmin"
license=('MIT')
depends=('imagemagick')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  sed -i 's/\(MAGICK_CONFIG.*\?xargs\)/\1|sed "s\/-fopenmp\\s\/\/g"/' src/apache2/Makefile.am
  autoreconf -fi
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
