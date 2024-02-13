# Maintainer: Xavier R.M. (sapphirus at azorium dot net)

pkgname=('pacwrap' 'pacwrap-dist')
pkgver=0.7.2
pkgrel=1
pkgdesc="Facilitates the creation, management, and execution of Arch-baesd unprivileged bubblewrap containers."
arch=('x86_64')
url="https://pacwrap.sapphirus.org/"
license=('GPLv3-only')
makedepends=('cargo' 'git' 'fakeroot' 'pacman' 'zstd' 'busybox' 'fakechroot')
source=("${pkgname}-${pkgver}.tar.zst::https://github.com/pacwrap/pacwrap/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha512sums=('eea9177b2d7065915a6e0dd911881242f9690509e710a66eb3114cf9459668c839f983580d87f7d4e161006ca06df1b3572769ccdf52430f84061a20e94302e4')
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
