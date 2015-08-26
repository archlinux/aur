pkgname=chicken-coops-utils
pkgver=1.0.0
pkgrel=1
pkgdesc="Chicken Scheme Egg: coops-utils"
arch=('x86_64')
url="http://wiki.call-cc.org/eggref/4/coops-utils"
license=('BSD')
depends=('chicken-check-errors' 'chicken-coops')
options=(docs !libtool !emptydirs)
install="chicken.install"
md5sums=('0c56e22842e869c7a5e35138a56176ae'
         'f438031ad187fada132b789446d9ea03')

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
