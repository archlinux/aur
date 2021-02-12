# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetcontrolserver-bin
pkgver=3.2.2
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
md5sums_armv7h=('09b1e1d1996de9efcff424e9a6754118')
md5sums_aarch64=('e94c3fa1dcc2ea08a47ec90b9b596246')
sha1sums_armv7h=('792997bdc4bd510fe981296f24b890c3e8c8eeb0')
sha1sums_aarch64=('6b1bb4297f153ff3be6c65df8a1168694b94a5a0')
sha256sums_armv7h=('e06923d2e3ed5de8c33a86ddac38596b78d802fff81772dc2886a4127a5f9085')
sha256sums_aarch64=('cb646067d60d3f5bc0224fd2e83f264f7a6684548d13bfe3efc372a70d87c986')
sha512sums_armv7h=('d911f68c0ed2627f3d4f37a21324f656ff65af838db280114e7a8b4c77bea0235b6f62313ac90ab3a09c6a1240897feecfed6ee7cf6691741e363a984e20f76e')
sha512sums_aarch64=('d4ef62cab78e37d7511f4c8d5b9f2809c2da6d3fe36079d3788a09308b85482fd798be5b45a0924bf94265e8afe1ef31fbfe83fb0e0342fb42845b1c8099cfba')

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
