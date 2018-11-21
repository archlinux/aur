# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=battlestar
pkgver=0.6.1
pkgrel=1
pkgdesc='Programming language for creating tiny executables'
arch=('x86_64')
url='https://github.com/xyproto/battlestar'
license=('MIT')
makedepends=('go-pie' 'git')
depends=('yasm' 'gcc')
optdepends=('elfkickers: for smaller executables'
            'dosbox: for running 16-bit programs'
            'qemu-arch-extra: for running bootable kernels'
            'nasm: for ndisasm and com2bts')
source=("git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd $pkgname/src
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o battlestarc .
  make -C ..
}

package() {
  cd "$pkgname"

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

# vim: ts=2 sw=2 et
