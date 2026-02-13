# Maintainer: Elppans <elppansmk@*>
# shellcheck disable=all

pkgname=pacod
pkgver=1.0.0
pkgrel=1
arch=('any')
license=('MIT')
depends=('pacman' 'expac')
provides=('pacod')
conflicts=('pacod')
pkgdesc="List optional dependencies (optdepends) of pacman packages and groups"
url="https://github.com/elppans/${pkgname}"
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

# Automatically detect and use the correct install file
if [ -e "${pkgname}.install" ]; then
	install=${pkgname}.install
elif [ -e "pkgbuild.install" ]; then
	install=pkgbuild.install
fi

prepare() {
	cd "${srcdir}/${pkgname}"
	# Add any preparation steps here, if needed
	# For example: patch -p1 < "${srcdir}/patch-file.patch"
}

package() {
	cd "${srcdir}/${pkgname}"

	# Determine the correct source directory
	if [ -d "${pkgname}" ]; then
		srcdir="${srcdir}/${pkgname}/${pkgname}"
	else
		srcdir="${srcdir}/${pkgname}"
	fi

	# Install files
	local dirs=("usr")
	for dir in "${dirs[@]}"; do
		if [ -d "${srcdir}/${dir}" ]; then
			cp -a "${srcdir}/${dir}" "${pkgdir}/"
		fi
	done

	# Install license file if present
	if [ -f "LICENSE" ]; then
		install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	fi

	# Install documentation if present
	if [ -f "README.md" ]; then
		install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	fi
}
