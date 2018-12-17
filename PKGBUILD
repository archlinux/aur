# Maintainer: Michael Picht <michael dot picht at ussenterprise dot de>

pkgorg=github.com/mipimipi
pkgname=smsync-git
_pkgname=smsync
pkgver=3.0.2.r3.g3f7ed92
pkgrel=1
pkgdesc="smsync (Smart Music Sync) keeps huge music collections in sync and is takes care of conversions between different file formats. It's an easy-to-use command line application"
arch=('x86_64' 'i686')
url="https://$pkgorg/$_pkgname/"
license=('GPL3')
depends=('ffmpeg')
makedepends=('go-pie' 'dep')
source=("git://$pkgorg/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/$pkgorg
  ln -rTsf $_pkgname gopath/src/$pkgorg/$_pkgname
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$pkgorg/$_pkgname
  dep ensure
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$pkgorg/$_pkgname
  make VERSION=$pkgver
}

package() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$pkgorg/$_pkgname
  make DESTDIR="$pkgdir" install
}
