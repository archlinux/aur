# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=battlestar
pkgver=0.7.0
pkgrel=2
pkgdesc='Programming language for creating tiny executables'
arch=(x86_64)
url='https://github.com/xyproto/battlestar'
license=(BSD)
makedepends=(git go)
depends=(gcc yasm)
optdepends=('elfkickers: for smaller executables'
            'dosbox: for running 16-bit programs'
            'nasm: for ndisasm and com2bts'
            'qemu-arch-extra: for running bootable kernels')
source=("git+$url#commit=deb78a26b141531abe6cdc5cd980691e3a41ec46")
b2sums=('SKIP')

build() {
  cd $pkgname/cmd/battlestarc
  go build -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\"" -mod=vendor -trimpath -v
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r samples "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples64 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples32 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r samples16 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r helloworld "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 TUTORIAL.md "$pkgdir/usr/share/doc/$pkgname/TUTORIAL.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
