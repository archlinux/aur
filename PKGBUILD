# Maintainer: Jim Pryor <profjim@jimpryor.net>
# Warning: The chicken-* egg PKGBUILDS in AUR are auto-generated.
#          Please report errors you notice so that I can tweak the generation script.

pkgname=chicken-mailbox
pkgver=2.1.5
pkgrel=1
pkgdesc="Chicken Scheme Egg: Thread-safe queues with timeout"
arch=('i686' 'x86_64')
url="http://chicken.wiki.br/eggref/4/mailbox"
license=('BSD')
depends=('chicken>=4.5.0' 'chicken-setup-helper' 'chicken-check-errors>=1.12.0' 'chicken-condition-utils>=1.0.0' )
options=(docs !libtool !emptydirs)
install="chicken.install"
source=("$pkgname-$pkgver.chunked::http://chicken.kitten-technologies.co.uk/henrietta.cgi?name=mailbox&version=$pkgver"
		"$pkgname-$pkgver.html::http://wiki.call-cc.org/eggref/4/mailbox.html")
md5sums=('bf9d49709ed80243533ee32d7594b892'
         '371a0f2ce408110fac5cc9086d1ba7f1')

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
