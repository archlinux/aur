# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=matchbox
pkgver=0.7.0
pkgrel=1
pkgdesc="Network boot and provision Container Linux clusters"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
url="https://coreos.com/matchbox/docs/latest/"
license=('Apache')
makedepends=('go' 'git')
_goname=github.com/coreos/$pkgname
_commit=08f4e9908b167fba608e60169ec6a803df9db37f # 0.7.0
source=("git+https://$_goname.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  mkdir -p $srcdir/src/github.com/coreos
  ln -sf $srcdir/$pkgname $srcdir/src/github.com/coreos

  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  GOPATH="$srcdir" make bin/matchbox
}

package() {
  cd $pkgname
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  objcopy --remove-section .note.go.buildid "$pkgdir/usr/bin/$pkgname"
  install -Dm544 contrib/systemd/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
