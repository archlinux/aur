# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=regency-solitaire-hib
_appname=$(echo ${pkgname} | sed -e 's/-hib//')
pkgver=117b
pkgrel=1
pkgdesc="Experience romantic Regency England in this sumptuous solitaire game. (Humble Bundle)"
arch=('i686' 'x86_64')
url="https://www.humblebundle.com/store/regency-solitaire"
license=('custom')
groups=('games')
depends=('glu')
i686_depends=('gcc-libs')
x86_64_depends=('gcc-libs-multilib')
optdepends=('gendesk: generate menu icons')
provides=("${_appname}")
conflicts=("${_appname}")
source=("hib://RegencySolitaireV${pkgver}_1472495785.tar.gz"
	"local://${_appname}")
md5sums=('15e8377d2cac99a52407cb399bd1ee7c'
         'fb382d5d733bf8ab346f6145fd15a623')
PKGEXT=.pkg.tar

prepare() {
	cd ${srcdir}
	
	if which gendesk &>/dev/null; then
		gendesk -f -n --pkgname="${pkgname}" \
			--pkgdesc="${pkgdesc}" \
			--name="Regency Solitaire" \
			--exec="/usr/bin/${_appname}" \
			--categories="Application;Game;"
	else
		warning "gendesk not found!"
		warning "Menu icons not generated!"
	fi

	msg2 "Generating license..."
	sed -n '/(c)/,$ p' \
		./RegencySolitaireV${pkgver}/data/text/gametext.txt > LICENSE
}

package() {
	mkdir -p "${pkgdir}/opt/${pkgname}"

	cp -R "${srcdir}/RegencySolitaireV${pkgver}/." \
	       "${pkgdir}/opt/${pkgname}/"

	install -Dm755 "${srcdir}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
	install -Dm755 "${srcdir}/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	# Package doesn't include an icon, so let's make one.
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
	ln -s "/opt/${pkgname}/data/graphics/DialogImages/Bella Frame.png" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
