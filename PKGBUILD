# Maintainer: queue <queueRAM <at> gmail.com>

_pkgname=efs2tar
pkgname=$_pkgname-git
pkgdesc="Convert SGI EFS-formatted filesystem images to tarballs"
pkgver=20181027.4db1b0f
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/sophaskins/efs2tar"
license=('BSD')
depends=('glibc')
makedepends=('git' 'go-pie' 'golang-github-davecgh-go-spew')
source=("git+https://github.com/sophaskins/efs2tar.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare(){
  mkdir -p gopath/src/github.com/sophaskins
  ln -rTsf $_pkgname gopath/src/github.com/sophaskins/$_pkgname
}

build() {
  export GOPATH="$srcdir/gopath:/usr/share/gocode"
  cd gopath/src/github.com/sophaskins/$_pkgname
  go install \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -v ./...
}

package() {
  install -Dm755 gopath/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 $srcdir/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

