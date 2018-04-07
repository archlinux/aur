# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Stéphane Graber <stgraber AT ubuntu DOT com>

pkgname=distrobuilder
pkgver=228.70f3864
pkgrel=1
pkgdesc="System container image builder for LXC and LXD"
arch=('x86_64')
url="https://github.com/lxc/distrobuilder"
license=('APACHE')
depends=('lxc')
makedepends=('gcc-go' 'git')
source=(git://github.com/lxc/distrobuilder.git)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo "$(git rev-list --count HEAD).$(git describe --always)"
}

prepare() {
  [[ -d .gopath ]] || mkdir .gopath 
  export GOPATH="${srcdir}/.gopath"
  export PATH="${GOPATH}/bin:${PATH}"
}

build() {
  cd "$pkgname"
  go get -v -x github.com/lxc/distrobuilder/distrobuilder
}

package() {
  cd "$pkgname"
  _examples="$GOPATH/src/github.com/lxc/$pkgname/doc/examples"

  install -Dm755 "$GOPATH/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname"
  install -d "$pkgdir/var/cache/$pkgname"

  for i in alpine archlinux centos debian fedora ubuntu; do
    install -m644 "$_examples/$i" "$pkgdir/usr/share/$pkgname/$i"
  done
}
