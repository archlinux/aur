# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='sile'
pkgdesc='Modern typesetting system inspired by TeX'
pkgver='0.9.0'
pkgrel='2'
arch='any'
url='http://www.sile-typesetter.org/'
license='custom'
source=("https://github.com/simoncozens/sile/archive/v${pkgver}.tar.gz")
sha512sums=('2752ba3f08e814fede187e90b3c0ea559c682fabef085affc6afe0077b0c85195484b6dfe722040321f75f33dc01a876d15c5b7e37e6ca485ee1901b30e04195')
depends=('lua51-lpeg'
         'lua51-lgi'
         'lua51-stdlib'
         'lua51-expat'
         'lua51-inspect'
         'lua51-epnf'
         'lua51-repl'
         'lua51-cassowary'
         'pango')

prepare () {
	cd "${pkgname}-${pkgver}"
	cat > sile.sh <<-EOF
	#! /bin/sh
	export SILE_PATH=/usr/lib/sile
	exec /usr/bin/lua5.1 /usr/lib/sile/sile "\$@"
	EOF
}

package () {
	cd "${pkgname}-${pkgver}"

	# Program. This is taken from the "install.lua" script
	install -m755 -d "${pkgdir}/usr/lib/sile"
	cp -ar classes core packages languages sile \
		"${pkgdir}/usr/lib/sile"
	install -Dm755 sile.sh "${pkgdir}/usr/bin/sile"

	# Documentation and examples
	for file in README.md ROADMAP documentation/sile.pdf ; do
		install -Dm644 "${file}" \
			"${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
	cp -ar examples "${pkgdir}/usr/share/doc/${pkgname}/"

	# License
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
