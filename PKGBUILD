# Maintainer: Till Faelligen <tfaelligen at gmail dot com>
pkgname='matrix-conduit-git'
_pkgname='conduit'
pkgver=0.1.0.525.gabe9122
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://conduit.rs'
pkgdesc='A Matrix homeserver written in Rust'
license=('Apache')
depends=('openssl')
makedepends=('rust' 'cargo' 'git')
provides=('conduit')
source=(
  "$_pkgname::git+https://gitlab.com/famedly/conduit"
  "conduit-archlinux::git+https://github.com/S7evinK/conduit-archlinux"
)
install=install-script.install
backup=('etc/conduit/config')
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd $_pkgname/
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build(){
  cd "$_pkgname"
  env CARGO_INCREMENTAL=1 cargo build --release --locked
}

package() {
  cd $_pkgname
  install -D -m755 "target/release/conduit" "$pkgdir/usr/bin/conduit"
  cd ../conduit-archlinux
  install -D -m0644 conduit-sysusers.conf "$pkgdir"/usr/lib/sysusers.d/conduit.conf
  install -D -m0644 conduit.service "$pkgdir"/usr/lib/systemd/system/conduit.service
  install -D -m0644 conduit-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/conduit.conf
  install -D -m0644 conduit.env "$pkgdir"/etc/conduit/config
  cd ../conduit
  install -D -m0644 conduit-example.toml "$pkgdir"/etc/conduit/config.toml

}
