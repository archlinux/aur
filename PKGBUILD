# Maintainer: Kai Michaelis <seu@panopticon.re>
pkgname=panopticon-git
pkgver=0.16.0.1555
pkgrel=1
pkgdesc="A libre cross platform disassembler"
arch=('x86_64' 'i686')
url="https://panopticon.re/"
license=('GPL3')
groups=('devel')
depends=(
	'qt5-svg>=5.4'
    'qt5-quickcontrols>=5.4'
	'qt5-graphicaleffects>=5.4')
makedepends=(
    'cargo'
    'git>=1'
    'cmake>=2.8.9')
provides=('panopticon')
conflicts=('panopticon')
source=($pkgname::git+https://github.com/das-labor/panopticon.git)
md5sums=('SKIP')

pkgver() {
    cd "$pkgname/qt"
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
    cd "$pkgname/qt"
    cargo build --release
}

package() {
	cd "$pkgname"
	install -d -m755 "$pkgdir/usr/bin"
	install -D -s -m555 "$srcdir/$pkgname/target/release/panopticon" "$pkgdir/usr/bin/panopticon-qt"
	install -m755 -d "$pkgdir/usr/share/panopticon/qml"
	cp -R "qml/"* "$pkgdir/usr/share/panopticon/qml"
	chown -R root:root "$pkgdir/usr/share/panopticon/qml"
}
