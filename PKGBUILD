# Maintainer: mahe29 <mahe@quantentunnel.de>

pkgname=seh-utn
pkgver=4.0.7
pkgrel=1
pkgdesc='SEH Technology UTN service/daemon, kernel module (DKMS) and clitool'
url="https://www.seh-technology.com/"
arch=(x86_64)
license=(custom)
depends=('dkms' 'linux-headers')
makedepends=('patch')
_verwatch=("${url}services/downloads/download-deviceserver/utnserver-pro.html" 'SEH UTN Manager Version \([0-9\.]*\) for DEB based Linux 64-bit.*' 't')
source=("${url}fileadmin/user/downloads/deviceserver/tools/sehutnmanager-deb_linux_64bit-$pkgver.zip")
sha256sums=('a2a4cc897ace4eaa52411176b0352da2ee771501311dae945bc3c29ca1e0bb51')
backup=("etc/xdg/SEH Computertechnik GmbH/SEH UTN Manager.conf" "etc/xdg/SEH Computertechnik GmbH/SEH UTN Service.conf")

prepare() {
ar p "${srcdir}/sehutnmanager-deb_linux_64bit-${pkgver}/seh-utn-driver_${pkgver}-1dkms_all.deb" 'data.tar.xz' | tar --directory ${srcdir} --no-same-owner -Jxf - 
ar p "${srcdir}/sehutnmanager-deb_linux_64bit-${pkgver}/seh-utn-service_${pkgver}-1_amd64.deb" 'data.tar.xz' | tar --directory ${srcdir} --no-same-owner -Jxf -
ar p "${srcdir}/sehutnmanager-deb_linux_64bit-${pkgver}/seh-utn-clitool_${pkgver}-1_amd64.deb" 'data.tar.xz' | tar --directory ${srcdir} --no-same-owner -Jxf -
chmod u+x ${srcdir}/usr/src/seh-utn-driver-${pkgver}/
mv "${srcdir}/usr/sbin/utnservice" "${srcdir}/usr/bin/"
rmdir "${srcdir}/usr/sbin/"
#rename systemd service file to match package name and delete some obsolete lines from it that are not needed in arch
mv "${srcdir}/lib/systemd/system/seh_vhcd.service" "${srcdir}/lib/systemd/system/seh-utn.service"
sed -i "/\/etc\/init.d\//d" "${srcdir}/lib/systemd/system/seh-utn.service"
sed -i "/^#Exec/d" "${srcdir}/lib/systemd/system/seh-utn.service"
sed -i "/\/bin\/echo /d" "${srcdir}/lib/systemd/system/seh-utn.service"
sed -i "/\/bin\/chmod/d" "${srcdir}/lib/systemd/system/seh-utn.service"
sed -i "s/\/usr\/libexec/\/usr\/lib/g" "${srcdir}/usr/bin/utnm"
sed -i "s/\/usr\/libexec/\/usr\/lib/g" "${srcdir}/usr/bin/utnservice"
cd ${srcdir}
patch -p0 < ../seh-dkms-patch.diff
}

package() {
install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/lib/systemd/system/"*.service
mkdir -p "${pkgdir}/usr/share"
cp -a "${srcdir}/usr/share/doc" "${pkgdir}/usr/share/doc"
cp -a "${srcdir}/usr/share/man" "${pkgdir}/usr/share/man"
install -Dm755 -t "${pkgdir}/usr/bin" ${srcdir}/usr/bin/*
cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
cp -a "${srcdir}/usr/libexec/SEH" "${pkgdir}/usr/lib/"
mkdir -p "${srcdir}/etc/xdg/SEH Computertechnik GmbH"
touch "${srcdir}/etc/xdg/SEH Computertechnik GmbH/SEH UTN Service.conf"
touch "${srcdir}/etc/xdg/SEH Computertechnik GmbH/SEH UTN Manager.conf"
install -Dm664 -t "${pkgdir}/etc/xdg/SEH Computertechnik GmbH" "${srcdir}/etc/xdg/SEH Computertechnik GmbH/"*
install -Dm644 -t "${pkgdir}/usr/src/seh-utn-driver-${pkgver}" ${srcdir}/usr/src/seh-utn-driver-${pkgver}/*
}

