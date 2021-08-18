# Maintainer: tinywrkb <tinywrkb@gmail.com>
pkgname=stringsext
pkgdesc='Find multi-byte-encoded strings in binary data'
pkgver=2.3.3
pkgrel=1
arch=('x86_64')
url='https://blog.getreu.net/projects/stringsext/'
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'pandoc' 'rust')
_commit=6796189e59e43e6d26e239dc38b4a4f59f9e3b93
source=("git+https://gitlab.com/getreu/stringsext.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd stringsext
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd stringsext
}

build(){
  cd stringsext
  cargo build --release --locked

  pushd doc
  # only generate the man page
  sed -i '/docbook52pdf/d;/md2docbook2html/d' make--{index,stringsext--manpage}
  ./make--all
}

check(){
  cd stringsext
  cargo test --release --locked
}

package() {
  cd stringsext
  install -Dm755 -t "$pkgdir"/usr/bin/ target/release/stringsext
  install -Dm644 -t "$pkgdir"/usr/share/licenses/stringsext/ LICENSE*
  install -Dm644 -t "$pkgdir"/usr/share/man/man1/ doc/build/man/man1/*
}

