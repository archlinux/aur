# Maintainer: kedap <dxhqezk@hi2.in>

pkgname=apmpkg-git-dev
_pkgname=apmpkg
pkgver=61.4727c20
pkgrel=1
pkgdesc="Un administrador de paquetes universal para linux como modelo: PKGBUILD de la rama develop"
arch=('x86_64')
url="https://github.com/Kedap/apmpkg"
license=('Apache')
depends=('git' 'python-pip' 'python2-pip' 'curl' 'fakeroot' 'ruby-bundler' 'rsync')
makedepends=('cargo')
conflicts=('apmpkg-git')
source=("git+https://github.com/kedap/${_pkgname}")
sha256sums=('SKIP')

pkgver(){
    cd "$_pkgname"
    git checkout -b develop
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$_pkgname"
	cargo build --release --locked
}

check() {
	cd "$_pkgname"
	cargo test --release --locked
}

package() {
	cd "$_pkgname"
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	mkdir -p ${pkgdir}/etc/apmpkg/iiabc
	cp -r src/iiabc/ ${pkgdir}/etc/apmpkg/
	mkdir -p ${pkgdir}/etc/apmpkg/paquetes
  install -Dm 644 "${pkgname}.1" -t ${pkgdir}/usr/share/man/man1
}
