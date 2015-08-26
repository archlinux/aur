pkgname=chicken-xlib-utils
pkgver=0.4.2
pkgrel=1
pkgdesc="Chicken Scheme Egg: utils for xlib programming"
arch=('x86_64')
url="http://wiki.call-cc.org/eggref/4/xlib-utils"
license=('BSD')
depends=('chicken-foreigners' 'chicken-matchable' 'chicken-xlib')
options=(docs !libtool !emptydirs)
install='chicken.install'
md5sums=('7a5be1688b39bf53302f81d8c06f3cff')

# template start; name=chicken-module; version=2;
_name=${pkgname#chicken-}

source=("${pkgname}-${pkgver}.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=${_name}&version=${pkgver}")

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

	mkdir -p "${pkgdir}/usr/lib/chicken/5" "${pkgdir}/usr/share/chicken/${_name}"

	chicken-install -p "${pkgdir}/usr"
}
# template end;
