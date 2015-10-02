# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor in comments: Misc <https://aur.archlinux.org/account/misc/>

pkgname=opsu-git
pkgver=0.12.1.r0.g7245673
pkgrel=1
pkgdesc="An open source osu!-client written in Java."
arch=('any')
url="https://itdelatrisu.github.io/opsu/"
license=('GPL3')
changelog=.CHANGELOG
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'java-web-start' 'gradle' 'gendesk' 'git')
provides=('opsu-git')
conflicts=('opsu-git')
source=(${pkgname}::git://github.com/itdelatrisu/opsu.git
        opsu-git.sh )
sha512sums=('SKIP'
            '4c8b89b4f273a076620c98058623a0e8c0ab875f191cb65f126e9a0134e0b072ed27ac8a03928225db1b5b9e832935b4efca0db1d7a02b0c8b96ec87748398f3')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --pkgname "${pkgname}" --pkgdesc "$pkgdesc" --name "opsu!-git" --exec "${pkgname}" --categories "Game"

	# update .CHANGELOG
	git -C "${srcdir}/${pkgname}" log --graph -10 > "${startdir}/.CHANGELOG"
}

build()
{
	cd "${srcdir}/${pkgname}"
	gradle jar -PXDG=true
}

package()
{
	# cut pkgver
	_pkgver=$(git -C "${srcdir}/${pkgname}" describe --tags | sed 's/-.*//')
	_pkgname=opsu

	install -Dm644 "${srcdir}/${pkgname}/build/libs/${_pkgname}-${_pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm644 "${srcdir}/${pkgname}/res/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
