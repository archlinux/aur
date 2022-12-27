# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjoxide-git
pkgver=r441.ea89720
pkgrel=1
pkgdesc='Project Oxide LatticeSemi 28nm Nexus FPGA Bitstream Database'
arch=('i686' 'x86_64')
url='https://github.com/gatecat/prjoxide'
license=('ISC')
depends=()
makedepends=('cargo' 'git' 'capnproto' 'capnproto-java')
provides=('prjoxide')
conflicts=('prjoxide')
source=('database::git+https://github.com/gatecat/prjoxide-db.git'
        'oxide::git+https://github.com/gatecat/prjoxide.git'
	'fpga-interchange-schema::git+https://github.com/SymbiFlow/fpga-interchange-schema.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/oxide"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/oxide"
  git submodule init
  git config submodule.database.url "$srcdir/database"
  git config submodule.3rdparty/fpga-interchange-schema.url "$srcdir/fpga-interchange-schema"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/oxide/libprjoxide/prjoxide"
  cargo build --release --all-features --target-dir=target
}

package() {
  cd "$srcdir/oxide/libprjoxide/prjoxide"
  install -Dm755 "target/release/prjoxide" "$pkgdir/usr/bin/prjoxide"
}
