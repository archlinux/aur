# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=linuxwave
pkgname=$_pkgname-git
pkgver=0.1.1.r0.rga6000ac
pkgrel=1
pkgdesc="Generate music from the entropy of Linux"
arch=('any')
url="https://github.com/orhun/linuxwave"
license=('MIT')
makedepends=('git' 'zig')
conflicts=($_pkgname)
provides=($_pkgname)
source=("git+$url.git"
        "git+https://github.com/Hejsil/zig-clap.git#commit=749c43f1f846adc950a5920ed61b40cbc3ec2c54")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/g'
}

prepare() {
  cd zig-clap
  cp -r * ../$_pkgname/libs/zig-clap
}

build() {
  cd $_pkgname
  zig build -Drelease-safe
}

package() {
  cd $_pkgname
  gzip -f man/$_pkgname.1
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 man/$_pkgname.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 zig-out/bin/$_pkgname -t "$pkgdir/usr/bin"
}
