# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=matchbox
pkgver=0.7.0
pkgrel=3
pkgdesc="Network boot and provision Container Linux clusters"
arch=("x86_64" "i686" "arm" "armv6h" "armv7h" "aarch64")
url="https://coreos.com/matchbox/docs/latest/"
license=('Apache')
makedepends=('go' 'git')
_goname=github.com/coreos/$pkgname
_commit=08f4e9908b167fba608e60169ec6a803df9db37f # 0.7.0
source=("git+https://$_goname.git#commit=$_commit"
        "matchbox.sysusers"
        "matchbox.tmpfiles")
sha256sums=('SKIP'
            'b5a40ff91c6b14fcfc6261a64a1221bc2dd20403ab5727fa8c3719fe4e3a36ea'
            'd3fc3cd0261959e76c692a5511f7fbb0f297c62e9a2664eb0e9735cb17adc455')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  mkdir -p $srcdir/src/github.com/coreos
  ln -sf $srcdir/$pkgname $srcdir/src/github.com/coreos
}

build() {
  cd $pkgname
  GOPATH="$srcdir" make bin/matchbox
}

package() {
  cd $pkgname
  install -Dm755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
  objcopy --remove-section .note.go.buildid "$pkgdir/usr/bin/$pkgname"
  install -Dm644 contrib/systemd/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $srcdir/matchbox.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 $srcdir/matchbox.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -dm755 "$pkgdir/etc/matchbox"
}
