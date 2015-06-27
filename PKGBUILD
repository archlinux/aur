# Maintainer: Matt Warner <mattwarner2@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Limao Luo <luolimao@gmail.com>

pkgname=spideroak
_PkgName=SpiderOak
pkgver=5.2.0
pkgrel=1
pkgdesc="Secure file backup, sync and sharing client"
arch=('i686' 'x86_64')
url="https://spideroak.com/"
license=('custom')
depends=()
makedepends=('desktop-file-utils')
provides=(${pkgname})
conflicts=(${pkgname}-beta)
options=('!strip')
install=${pkgname}.install
source=(terms.txt)
sha256sums=('4819c8d923ab19e552e877b87adf1d45aca6adcb5dffcb238d7819501e6e6737')
if [ "$CARCH" == x86_64 ]; then
        source+=("${_PkgName}-${pkgver}-1.x86_64.rpm::https://spideroak.com/getbuild?platform=fedora&arch=x86_64")
        sha256sums+=('ca927d3a9b411307346e21db144b873767e36b064c6bff1b2a43a960c06dcda2')
elif [ "$CARCH" == i686 ]; then
        source+=("${_PkgName}-${pkgver}-1.i386.rpm::https://spideroak.com/getbuild?platform=fedora&arch=i386")
        sha256sums+=('0ed9f8298bd9d36aafc53fdee0a5fea5b2c6bfc7f68dcbd79b44246ee36e4ec6')
fi

package() {
    # install config file
    install -Dm644 ${srcdir}/etc/dbus-1/system.d/${_PkgName}.dbus.conf ${pkgdir}/etc/dbus-1/system.d/${pkgname}.dbus.conf

    # install app in /opt
    install -dm755 ${pkgdir}/opt/
    cp -r ${srcdir}/opt/* ${pkgdir}/opt/

    # install start script file
    install -Dm755 ${srcdir}/usr/bin/${_PkgName} ${pkgdir}/usr/bin/${_PkgName}

    # install desktop and pixmap files
    install -Dm644 ${srcdir}/usr/share/applications/${_PkgName}.desktop ${pkgdir}/usr/share/applications/${_PkgName}.desktop
    install -Dm644 ${srcdir}/usr/share/pixmaps/${_PkgName}.png ${pkgdir}/usr/share/pixmaps/${_PkgName}.png

    # fix desktop file
    sed -i \
	-e "/Encoding=UTF-8/d" \
	-e "/^Name=/s: Backup::" \
	-e "/^Comment=/s:${_PkgName} ::" \
	-e "/^Categories=/s:${_PkgName};::" \
	-e "/^Icon=/s:=.*$:=${_PkgName}:" \
	-e "/^Exec=/s:=.*$:=${_PkgName}:" \
	${pkgdir}/usr/share/applications/${_PkgName}.desktop

    # install man page
    install -Dm644 ${srcdir}/usr/share/man/man1/${_PkgName}.1.gz ${pkgdir}/usr/share/man/man1/${_PkgName}.1.gz

    # install custom license file
    install -Dm644 terms.txt ${pkgdir}/usr/share/licenses/${pkgname}/terms.txt
}
