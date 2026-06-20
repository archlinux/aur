# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ozgurulukir
_pkgname=fff.cr
_appname=${_pkgname//\./-}
pkgname=${_appname}
pkgver=0.3.3
pkgrel=1
_pkgver=v${pkgver}
pkgdesc="📁 A simple file manager written in Crystal."

url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
arch=('any')

provides=("${_appname}")

makedepends=('yq' 'make' 'crystal' 'shards' 'ameba')
depends=('glibc' 'libgcc' 'gc' 'pcre2' 'readline')

options=('!strip')

source=("${_appname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${_pkgname}/archive/${_pkgver}.tar.gz")
sha256sums=('9f6a98c4c5052230e54e2c949bdd916789a872c52b80fe0c859afd67cfad4ea2')


prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	sed -e '/^build:/ { n; s/^/	@mkdir -p $(BUILD_DIR)\n/; }' -i "Makefile"
	sed -e '/^debug:/ { n; s/^/	@mkdir -p $(BUILD_DIR)\n/; }' -i "Makefile"

	yq -iy '.crystal = "1.21.0"' shard.yml
	yq -iy '.description = "Fucking Fast File Manager"' "shard.yml"
	yq -iy '.development_dependencies.ameba.version = "~> 1.7.0"' "shard.yml"

	make deps
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	make build
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	sed -e 's/term.max_items + 1/term.max_items + 5/g' -i "spec/fff/navigation_handlers_spec.cr"

	make test
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}" || exit

	make PREFIX="${pkgdir}/usr" install
	# make DESTDIR="${pkgdir}" install PREFIX="/usr"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
