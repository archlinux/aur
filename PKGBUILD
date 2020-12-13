# Maintainer: BrainDamage

pkgname=hkd-git
pkgver=r109.dfa7976
pkgrel=1
pkgdesc='hkd allows to define system-wide hotkeys independent from the graphical session'
arch=('x86_64')
url="https://git.alemauri.eu/alema/hkd"
license=('MIT')
makedepends+=('git')
source=('git+https://git.alemauri.eu/alema/hkd')
sha512sums=('SKIP')


# strip the -git suffix from name
_basename="${pkgname%-git}"

# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

pkgver() {
	cd "${srcdir}/${_basename}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}

build() {
  cd "${srcdir}/${_basename}"
  make
}

package() {
	cd "${srcdir}/${_basename}"
	make PREFIX='/usr' INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
	install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
	install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_basename}/README.md"
	install -Dvm644 config.template "${pkgdir}/usr/share/doc/${_basename}/config.template"
}
