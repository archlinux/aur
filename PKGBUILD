# Maintainer: Heine Pedersen <heinep at gmail dot com>
# Contributor: Thomas Matysik <thomas at matysik dot co dot nz>

pkgname=hptwebgui
pkgver=2.3.1
pkgrel=1

pkgdesc="WebGUI for HighPoint RocketRaid 2xxx/3xxx/4xxx RAID Controllers"
arch=('i686' 'x86_64')
url="http://www.highpoint-tech.com"
license=('custom')
makedepends=('rpmextract' 'tar' 'sed')
provides=('hptwebgui')
conflicts=('hpt-cli')

_realname=RAID_Manage_Linux
_pkgrel_y=14
_pkgrel_m=10
_pkgrel_d=20
_pkgname=${_realname}_v${pkgver}_${_pkgrel_y}_${_pkgrel_m}_${_pkgrel_d}
if [ "$CARCH" = "x86_64" ]; then
    _webguiname=hptsvr-https-${pkgver}-${_pkgrel_y}.${_pkgrel_m}${_pkgrel_d}.x86_64
else
    _webguiname=hptsvr-https-${pkgver}-${_pkgrel_y}.${_pkgrel_m}${_pkgrel_d}.i386
fi

install=hptwebgui.install
source=(http://www.highpoint-tech.com/BIOS_Driver/HRM/Linux/${_pkgname}.tgz
	hptwebgui.service)

md5sums=('24139d8bcf3c439f7a476f3b9e629991'
         '00c19d865b93cd635fbea78b32af7787')

package() {
    cd ${srcdir}
    sed -n -e '1,/^exit 0$/!p' ${_realname}_${pkgver}_${_pkgrel_y}_${_pkgrel_m}_${_pkgrel_d}.bin > ${_pkgname}.tar.gz
    tar -xvzf ${_pkgname}.tar.gz

	rpmextract.sh readline6/${_webguiname}.rpm
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 -d "${pkgdir}/usr/share/hpt"
	install -m755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m755 "${srcdir}/usr/bin/hptsvr" "${pkgdir}/usr/bin/"
	install -m644 "${srcdir}/hptwebgui.service" "${pkgdir}/usr/lib/systemd/system/"
	cp -R "${srcdir}/usr/share/hpt/"* "${pkgdir}/usr/share/hpt"
}
