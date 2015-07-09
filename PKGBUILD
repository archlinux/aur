# Maintainer: Tom Willemse <tom@ryuslash.org>

pkgname=chicken-imperative-command-line-a
pkgver=0.4
pkgrel=1
pkgdesc="Chicken Scheme Egg: A simple, imperative-style command-line parser."
arch=('x86_64')
url='http://wiki.call-cc.org/eggref/4/imperative-command-line-a'
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-miscmacros')
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("${pkgname}-${pkgver}.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=imperative-command-line-a&version=${pkgver}"
        "${pkgname}-${pkgver}.html::http://wiki.call-cc.org/eggref/4/imperative-command-line-a.html")
md5sums=('7932a503dadd4e6bb56aa8398be6f53e'
         '10bfa8ae3f7d23df8f600574d4475d83')

# template start; name=chicken-module; version=1;
_name=${pkgname#chicken-}

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
