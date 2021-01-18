# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjoxide-git
pkgver=r265.450bf02
pkgrel=1
pkgdesc='Project Oxide LatticeSemi 28nm Nexus FPGA Bitstream Database'
arch=('i686' 'x86_64')
url='https://github.com/daveshah1/prjoxide'
license=('unknown')
depends=()
makedepends=('cargo')
provides=('prjoxide')
conflicts=('prjoxide')
source=('database::git+https://github.com/daveshah1/prjoxide-db.git'
        'oxide::git+https://github.com/daveshah1/prjoxide.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/oxide"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/oxide"
  git submodule init
  git config submodule.database.url "$srcdir/database"
  git submodule update
}

build() {
  cd "$srcdir/oxide/libprjoxide/prjoxide"
  cargo build --release --all-features --target-dir=target
}

package() {
  cd "$srcdir/oxide/libprjoxide/prjoxide"
  install -Dm755 "target/release/prjoxide" "$pkgdir/usr/bin/prjoxide"
}
