# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub-bin
_upstreamname=OpenLinkHub
_binlocation=/usr/bin/"${pkgname%-*}"
_applocation=/var/lib/"${pkgname%-*}"
pkgver=0.7.2
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs. [Current Binary Release - amd64/x86_64]"
arch=('x86_64')
url="https://github.com/jurkovic-nikola/OpenLinkHub"
license=('GPL3')
groups=()
depends=('systemd' 'i2c-tools')
makedepends=('systemd' 'tar') 
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=(
	"etc/udev/rules.d/99-openlinkhub.rules"
	)
options=()
install="${pkgname%-*}".install
source=(
	"https://github.com/jurkovic-nikola/${_upstreamname}/releases/download/${pkgver}/${_upstreamname}_${pkgver}_amd64.tar.gz"
	"${pkgname%-*}".install
	"${pkgname%-*}".sysusers
	"${pkgname%-*}".service
	"${pkgname%-*}".tmpfiles
)
noextract=("${_upstreamname}_${pkgver}_amd64.tar.gz")
sha256sums=('6f2739b4f64a791ed4cfdb4012a900121d1e5695ffb117b72ce3834e4af15183'
            '0820bcc60c77bd23178f4766f92f01dae2a75ae704ad6ac40ecf598a55002d36'
            '8c9f747bc6484290cb97b40e5904dc02cce2672e59e0f6ad720a1cd6a7b9d900'
            '858fd197e13a6bc2756e090f622adcac0d02d20007c366d0dff93258898e256e'
            '70c1d136ed639a84c6aca077df51ff857c32df8db5d74cc7df48f463708bdd0b')

prepare() {
	mkdir -p "${pkgname%-*}"
	tar -xzf "${_upstreamname}_${pkgver}_amd64.tar.gz" -C "${pkgname%-*}" --strip-components=1
}

package() {
	install -bDm 644 "${pkgname%-*}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-*}.service"
	install -bDm 644 "${pkgname%-*}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-*}.conf"
	install -bDm 644 "${pkgname%-*}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-*}.conf"
	install -bd -m 755 "${pkgdir}$_applocation/"{database,static,web,api}
	cp -r "${pkgname%-*}"/database/* "${pkgdir}"$_applocation/database/
	cp -r "${pkgname%-*}"/static/* "${pkgdir}"$_applocation/static/
	cp -r "${pkgname%-*}"/web/* "${pkgdir}"$_applocation/web/

	install -bDm 644 "${pkgname%-*}/99-${pkgname%-*}.rules" "$pkgdir/etc/udev/rules.d/99-${pkgname%-*}.rules"
	install -Dm 755 "${pkgname%-*}/$_upstreamname" "$pkgdir$_binlocation"
}
