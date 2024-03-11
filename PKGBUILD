# Maintainer: Xavier R.M. (sapphirus at azorium dot net)

_pkgname=pacwrap
pkgname=('pacwrap-git' 'pacwrap-dist-git')
pkgver=0.7.2.r17.7ef03e3
pkgrel=1
_pkgbase=$_pkgname
pkgdesc="Facilitates the creation, management, and execution of unprivileged Arch-based bubblewrap containers."
arch=('x86_64')
url="https://pacwrap.sapphirus.org/"
license=('GPLv3-only')
makedepends=('cargo' 'git' 'fakeroot' 'pacman' 'zstd' 'busybox' 'fakechroot')
source=("$_pkgname::git+https://github.com/pacwrap/pacwrap.git")
md5sums=('SKIP')
options=('!lto')

pkgver() {
    	cd $_pkgbase
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
	cd "${_pkgbase}" 	
  	cargo fetch --locked --target "$CARCH-unknown-linux-gnu" \
	&& ./dist/tools/prepare.sh release
}

build() {
  	cd "${_pkgbase}"
	PACWRAP_SCHEMA_BUILT=1 \
	cargo build --release --frozen \
	&& ./dist/tools/package.sh release
}

package_pacwrap-git() {
	provides=("${_pkgname}")
	conflicts=("${_pkgname}")
	depends=('bash' 'bubblewrap' 'gnupg' 'pacman' 'libseccomp' "${pkgname[1]}=$pkgver" 'zstd')
	optdepends=('xdg-dbus-proxy')

  	cd "${_pkgbase}"

	install -d "${pkgdir}/usr/share/${_pkgname}"	
	install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  	install -Dm 755 "dist/bin/${_pkgname}-key" "${pkgdir}/usr/bin/${_pkgname}-key"
	install -Dm 644 "dist/bin/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm 644 "dist/bin/${_pkgname}.yml.2" "${pkgdir}/usr/share/man/man2/${_pkgname}.yml.2"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

package_pacwrap-dist-git() {
	provides=("${_pkgname}-dist")
	conflicts=("${_pkgname}-dist")

  	cd "${_pkgbase}"

	install -dD 755 "${pkgdir}/usr/share/${_pkgname}/"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}-dist/LICENSE"
	install -Dm 644 "dist/bin/filesystem.tar.zst" "${pkgdir}/usr/share/${_pkgname}/filesystem.tar.zst"
	install -Dm 644 "dist/bin/filesystem.dat" "${pkgdir}/usr/share/${_pkgname}/filesystem.dat"

	cp -r "dist/runtime" "${pkgdir}/usr/share/${_pkgname}/"
}
