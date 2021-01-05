# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Control server application for Duet 3 series"
arch=('armv7h' 'aarch64')
url="https://github.com/Duet3D/DuetSoftwareFramework.git"
license=('GPL3')
provides=("duetcontrolserver=${pkgver}")
conflicts=("duetcontrolserver")
depends=(
	"duetsoftwareframework>=${pkgver}"
	"duetruntime>=${pkgver}"
	'linux>=4.8'
)
options=(!strip staticlibs)
install="${pkgname}.install"
backup=('opt/dsf/conf/config.json')
source_armv7h=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetcontrolserver_${pkgver}_armhf.deb")
source_aarch64=("https://pkg.duet3d.com/dists/stable/armv7/binary-arm64/duetcontrolserver_${pkgver}_arm64.deb")
md5sums_armv7h=('d8adeeb610a041426d4b6f12d97c82f1')
md5sums_aarch64=('0f8c76de4593fad96c28a58d47126020')
sha1sums_armv7h=('7f2d66d8f87cb4229cf23a93687b887207c4e6f6')
sha1sums_aarch64=('40e450214b957563b52eeba87c3f4b35c55fe292')
sha256sums_armv7h=('5ee3d3eeb05f9a563810cbf7eb2b551dcddea1c1003a5bff01966c419c0571b2')
sha256sums_aarch64=('24d7b98c9e99160def1185b0659af4b6f3e36e52ee4dc6b76445e2e344ce60a8')
sha512sums_armv7h=('16fd9864847974000145f57a1e750744f77c44515cf23ce481d995d66bbe9f15e37c4564b9c91d50deebb003eebc4e5c1f2ebe320078be9d5790d4ff65cacd75')
sha512sums_aarch64=('2d00ef230181cf02340465dddfaa04bc080dd083025691ecffb13bf51f79049e783e422c5fa279d2234a67654230b7560f9ddfb194c0b07fd7e475b94e317788')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -Dm 644 "${srcdir}/usr/lib/sysusers.d/duetcontrolserver.conf" "${pkgdir}/usr/lib/sysusers.d/duetcontrolserver.conf"
	install -Dm 644 "${srcdir}/usr/lib/tmpfiles.d/duetcontrolserver.conf" "${pkgdir}/usr/lib/tmpfiles.d/duetcontrolserver.conf"
	install -Dm 644 "${srcdir}/etc/udev/rules.d/99-dsf-gpio.rules" "${pkgdir}/etc/udev/rules.d/99-dsf-gpio.rules"

	# DuetControlServer
	install -dm 755 "${pkgdir}"/{opt/dsf/bin,usr/bin,usr/lib/systemd/system}
	install -dm 755 -o dsf -g dsf "${pkgdir}/opt/dsf/conf"
	install -dm 755 -o dsf -g dsf "${pkgdir}/opt/dsf/plugins"
	install "${srcdir}/opt/dsf/bin/"* "${pkgdir}/opt/dsf/bin"
	install -m 644 -o dsf -g dsf "${srcdir}/opt/dsf/conf/"* "${pkgdir}/opt/dsf/conf"

	# systemd unit file
	install "${srcdir}/usr/lib/systemd/system/"* "${pkgdir}/usr/lib/systemd/system"

	# Link to /usr/bin
	ln -s "/opt/dsf/bin/DuetControlServer" "${pkgdir}/usr/bin/"
}
