# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>
# Contributor in comments: Misc <https://aur.archlinux.org/account/misc/>
# Contributor in comments: SajeOne <https://aur.archlinux.org/account/SajeOne/>
# Contributor in email: tpenguinltg <https://aur.archlinux.org/account/tpenguinltg/>

pkgname=opsu-git
_pkgname=opsu
pkgver=0.15.0.r0.g0507374
pkgrel=1
pkgdesc="An open source osu!-client written in Java."
arch=('any')
url="https://itdelatrisu.github.io/opsu/"
license=('GPL3')
changelog=.CHANGELOG
install=opsu-git.install
depends=('java-runtime' 'bash' 'xorg-xrandr')
optdepends=('ffmpeg: Background video playback')
makedepends=('java-environment' 'java-web-start' 'gradle' 'gendesk' 'git')
provides=('opsu')
conflicts=('opsu')
source=(${pkgname}::git://github.com/itdelatrisu/opsu.git
        opsu.sh )
sha512sums=('SKIP'
            '4b065052fef55e1860a51dfa5af080930b1001e4c82cd8b3b0383bd68b239d382d788408235a7cb4fb4a1d04123a6049188a2e2c2d0e5fd08a3deb69da25fc2d')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --pkgname "${_pkgname}" --pkgdesc "$pkgdesc" --name "opsu!" --exec "${_pkgname}" --categories "Game"

	# update .CHANGELOG
	git -C "${srcdir}/${pkgname}" log --graph -10 > "${startdir}/.CHANGELOG"
}

build()
{
	cd "${srcdir}/${pkgname}"
	gradle jar -PXDG=true -PexcludeFFmpeg
}

package()
{
	# cut pkgver
	_pkgver=$(git -C "${srcdir}/${pkgname}" describe --tags | sed 's/-.*//')

	install -Dm644 "${srcdir}/${pkgname}/build/libs/${_pkgname}-${_pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
	install -Dm644 "${srcdir}/${pkgname}/res/logo.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}
