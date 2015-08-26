# Maintainer: Tom Willemse <tom@ryuslash.org>

_gitname='mowedline'

pkgname=mowedline
pkgver=0.2.8
pkgrel=1
pkgdesc="an X status bar program"
depends=('chicken' 'chicken-coops' 'chicken-dbus>=0.92'
         'chicken-filepath' 'chicken-imperative-command-line-a>=0.4'
         'chicken-list-utils' 'chicken-mailbox' 'chicken-matchable'
         'chicken-miscmacros' 'chicken-xft' 'chicken-xlib'
         'chicken-xtypes' 'chicken-coops-utils' 'chicken-xlib-utils')
conflicts=('mowedline')
provides=('mowedline')
arch=('x86_64')
url='http://retroj.net/mowedline'
license=('GPL3')
install='chicken.install'
md5sums=('e5964503fc3202f9f3978176eb4a6efe'
         'fbb161cb902a5ea3d77d8268e2c22a87')

# template start; name=chicken-module; version=2;
_name=${pkgname#chicken-}

source=("${pkgname}-${pkgver}.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=${_name}&version=${pkgver}"
        "${pkgname}-${pkgver}.html::http://wiki.call-cc.org/eggref/4/${_name}.html")

build() {
	# unchunk the blob that was downloaded from henrietta
	cd "$srcdir"
	mkdir -p "${_name}-${pkgver}"
	cat "${pkgname}-${pkgver}.chunked" | while :; do
		while read -r bar ver endbar fname len; do
			[[ -n "$ver" ]] && break
		done
		[[ "$endbar" = "|#" ]] || fname="$ver" len="$endbar"
		[[ -z "$fname" ]] && break
		fname="${fname:1:${#fname}-2}" # delete quotes around fname
		if [[ "${fname: -1}" == / ]]; then
			mkdir -p "${_name}-${pkgver}/${fname}"
		elif [[ "$len" -eq 0 ]]; then
			touch "${_name}-${pkgver}/${fname}"
		else
			dd iflag=fullblock of="${_name}-${pkgver}/${fname}" ibs="$len" count=1 2>/dev/null
		fi
	done
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	cp "../${pkgname}-${pkgver}.html" "${_name}.html"


	mkdir -p "${pkgdir}/usr/lib/chicken/5" "${pkgdir}/usr/share/chicken/${_name}"

	chicken-install -p "${pkgdir}/usr"

		install -Dm644 "${_name}.html" "${pkgdir}/usr/share/doc/${pkgname}/${_name}.html"
}
# template end;
