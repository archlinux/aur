# Maintainer: Xavier R.M. (sapphirus at azorium dot net)

pkgname=('pacwrap' 'pacwrap-dist')
pkgver=0.7.1
pkgrel=1
pkgdesc="Facilitates the creation, management, and execution of unprivileged Arch-based bubblewrap containers."
arch=('x86_64')
url="https://pacwrap.sapphirus.org/"
license=('GPLv3-only')
makedepends=('cargo' 'git' 'fakeroot' 'pacman' 'zstd' 'busybox' 'fakechroot')
source=("${pkgname}-${pkgver}.tar.zst::https://github.com/pacwrap/pacwrap/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha512sums=('936e66bb38ab5eab79c6678071ef472ba8135937c5a223271165934b19803410f7876991c428bd7a4a32b77f666380edc37f1d703b1961c5028ef270154d8169')
options=('!lto')

prepare() {
  	cd "${srcdir}"
  	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	./dist/tools/schema.sh release
}

build() {
  	cd "${srcdir}"
	PACWRAP_SCHEMA_BUILT=1 \
	cargo build --release --frozen
	./dist/tools/runtime.sh release
	./target/release/pacwrap --help=all --format=man > ./pacwrap.1
	./target/release/pacwrap --help=pacwrap.yml --format=man > ./pacwrap.yml.2
}

package_pacwrap() {
	provides=('pacwrap')
	depends=('bash' 'bubblewrap' 'gnupg' 'pacman' 'libseccomp' "pacwrap-dist=$pkgver" 'zstd')
	optdepends=('xdg-dbus-proxy')

	install -d "${pkgdir}/usr/share/pacwrap"	
	install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
   	install -Dm 755 "bin/${pkgname}-common" "${pkgdir}/usr/bin/${pkgname}-common"
   	install -Dm 755 "bin/${pkgname}-utils" "${pkgdir}/usr/bin/${pkgname}-utils"
	install -Dm 644 "pacwrap.1" "${pkgdir}/usr/share/man/man1/pacwrap.1"
	install -Dm 644 "pacwrap.yml.2" "${pkgdir}/usr/share/man/man2/pacwrap.yml.2"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_pacwrap-dist() {
	provides=('pacwrap-dist')

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/pacwrap" 	
	
	cd dist
	cp -r "filesystem.tar.zst" "${pkgdir}/usr/share/pacwrap"
	cp -r "filesystem.dat" "${pkgdir}/usr/share/pacwrap"	
	cp -r "runtime" "${pkgdir}/usr/share/pacwrap"
}
