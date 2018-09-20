# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Nikos Kouremenos <nkourAATTfreemail.gr>

pkgname=londonlaw-git
_pkgname=${pkgname%-git}
pkgver=0.3.0_pre2.r1.g35d419f
pkgrel=4
pkgdesc="Clone of the famous Scotland Yard board game with network support."
arch=('any')
url="https://github.com/anyc/londonlaw"
license=('GPL2')
changelog=.CHANGELOG
depends=('python2' 'hicolor-icon-theme')
makedepends=('git' 'python2-twisted' 'wxpython' 'python2-zope-interface')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/anyc/londonlaw.git"
		"${_pkgname}.desktop")
sha512sums=('SKIP'
            '15f537cdca41dd72a37574151fba5df9cf70b02f849e72c3ffab65453ab69562209c7053454e9c065bbb657cf6c4fd982ef27edb124a6be91c690dfdfec8e9da')

pkgver()
{
	cd "${srcdir}/${_pkgname}" || exit
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
	cd "${srcdir}" || exit
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	
	cd "${_pkgname}" || exit
	python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
	
	# https://lists.archlinux.org/pipermail/aur-general/2011-November/016777.html
	mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -dpr --no-preserve=ownership "doc/." "${pkgdir}/usr/share/doc/${_pkgname}"
	
	install -Dm644 "${_pkgname}/guiclient/images/playericon0.jpg" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${_pkgname}.jpg"
}
