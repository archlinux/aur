# Maintainer: Simon Arlott <arch@sa.me.uk>
pkgname=dtee
pkgver=1.1.0
pkgrel=1
pkgdesc="Run a program with standard output and standard error copied to files"
arch=('x86_64')
url="https://dtee.readthedocs.io/"
license=('GPL3')
depends=('boost-libs' 'libboost_program_options.so' 'libboost_filesystem.so')
makedepends=('boost' 'meson' 'ninja' 'python-sphinx')
checkdepends=('bash' 'coreutils' 'diffutils' 'findutils')
options=('zipman' 'lto')
source=("https://dtee.bin.uuid.uk/source/${pkgname}-${pkgver}.tar.gz"
	"https://dtee.bin.uuid.uk/source/${pkgname}-${pkgver}.tar.gz.asc")
noextract=()
sha256sums=('7ed65431e51493fbdb16e6d1d89cd852d4d265e69b1414c42ed23e6852e6b51f'
            'SKIP')
validpgpkeys=('47849A12DAF9BD2AF5505FBB4FF886F318206BD9')

build() {
	cd "$pkgname-$pkgver"
	rm -rf build/arch
	GIT_DIR="${srcdir}/.git" meson --prefix /usr --buildtype=plain build/arch --unity on
	GIT_DIR="${srcdir}/.git" ninja -C build/arch
}

check() {
	cd "$pkgname-$pkgver"
	GIT_DIR="${srcdir}/.git" ninja -C build/arch test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" GIT_DIR="${srcdir}/.git" ninja -C build/arch install
	ln -sf dtee "${pkgdir}/usr/bin/cronty"
	ln -sf dtee.1 "${pkgdir}/usr/share/man/man1/cronty.1"
}
