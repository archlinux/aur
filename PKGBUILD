
# Maintainer: Anish Bhatt <anish [at] gatech [dot] edu>
pkgname=wine-browser-installer
pkgver=1
pkgrel=6
epoch=
pkgdesc="Browser installer for wine-silverlight, shared between netflix-desktop and pipelight"
arch=('any')
url="https://launchpad.net/netflix-desktop"
license=('LGPL2.1' 'MIT')
depends=('ttf-ms-fonts' 'wget')

_pkname=netflix-desktop
optdepends=()
#install=
#changelog=
source=(https://launchpad.net/${_pkname}/trunk/0.8.5/+download/${_pkname}.tar.gz)
#noextract=()
md5sums=('139aa89ce9536ff860445ec67777f81a')

prepare() {
	pushd "${srcdir}/${_pkname}"
	pushd "${pkgname}"
	sed -i 's|wine-browser-installer|wine-silverlight|g' hw-accel-default
	sed -i 's|wine-browser-installer|wine-silverlight|g' gizmos
	sed -i "5 a\# Use [ -t 0 ] only when running manually from command line" hw-accel-default
	#sed -i '8s|^|#|g' hw-accel-default
	#sed -i '10,12s|^|#|g' hw-accel-default
	sed -i '5s|/var/lib/wine-browser-installer|$HOME/.netflix-desktop|g' install-dependency
	sed -i '6s|browser-installer|silverlight|g' install-dependency
	popd
	pushd debian
	sed -i '4s|^|WINEARCH=win32 |g' wine-silverlight4-installer.install-script
	sed -i '6s|^|WINEARCH=win32 |g' wine-silverlight4-installer.install-script
	sed -i '6s|@@PACKAGE@@|SilverlightSetup|g' wine-silverlight4-installer.install-script

	sed -i '4s|^|WINEARCH=win32 |g' wine-silverlight5.1-installer.install-script
	sed -i '6s|^|WINEARCH=win32 |g' wine-silverlight5.1-installer.install-script
	sed -i '6s|@@PACKAGE@@|wine-silverlight5.1-installer|g' wine-silverlight5.1-installer.install-script

        sed -i '4s|^|WINEARCH=win32 |g' wine-silverlight5.0-installer.install-script
        sed -i '6s|^|WINEARCH=win32 |g' wine-silverlight5.0-installer.install-script
        sed -i '6s|@@PACKAGE@@|wine-silverlight5.0-installer|g' wine-silverlight5.0-installer.install-script
}

package() {
	pushd ${srcdir}/${_pkname}
	pushd ${pkgname}
	install -dm755 ${pkgdir}/usr/share/wine-silverlight

	install -Dm755 gizmos "${pkgdir}"/usr/share/wine-silverlight/.
	install -Dm755 hw-accel-default "${pkgdir}"/usr/share/wine-silverlight/.
	install -Dm755 install-dependency "${pkgdir}"/usr/share/wine-silverlight/.
	popd
	pushd debian
	install -Dm755 wine-silverlight4-installer.install-script "${pkgdir}"/usr/share/wine-silverlight/.
	install -Dm755 wine-silverlight5.1-installer.install-script "${pkgdir}"/usr/share/wine-silverlight/.
	install -Dm755 wine-silverlight5.0-installer.install-script "${pkgdir}"/usr/share/wine-silverlight/.
	popd
        # Install MIT license
        install -Dm644 "debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/Copyright.txt"
	popd
}
