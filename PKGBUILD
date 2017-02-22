# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=gitsync
pkgname=$_pkgname-git
pkgver=20170221.r37.e2f08a5
pkgrel=1
pkgdesc='Git repository syncronisation daemon'
url='https://github.com/raybejjani/gitsync'
license=('BSD')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('glibc')
makedepends=('git' 'go' 'make' 'python2')
source=("git://github.com/raybejjani/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' "$_pkgname/build-util/make_code_fs.py"
}

build() {
  cd $_pkgname
  export GOPATH="$srcdir/$_pkgname"
  go get -tags='makebuild' github.com/raybejjani/gitsync/gitsyncd
  make all
}

package() {
  install -Dm755 $_pkgname/bin/${_pkgname}d "${pkgdir}/usr/bin/${_pkgname}d"
  install -Dm644 $_pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
