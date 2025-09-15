# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub-git
_upstreamname=OpenLinkHub
_binlocation=/usr/bin/"${pkgname%-*}"
_applocation=/var/lib/"${pkgname%-*}"
pkgver=0.6.4.r9.g3967f3a
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs. [Latest Commit - source]"
arch=('x86_64')
url="https://github.com/jurkovic-nikola/OpenLinkHub"
license=('GPL3')
groups=()
depends=('systemd' 'i2c-tools')
makedepends=('go' 'git' 'base-devel' 'systemd') 
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
replaces=()
backup=(
	"etc/udev/rules.d/99-openlinkhub.rules"
	)
options=()
install="${pkgname%-*}".install
source=(
	"${pkgname%-*}::git+https://github.com/jurkovic-nikola/${_upstreamname}.git#branch=main"
	"${pkgname%-*}".install
	"${pkgname%-*}".sysusers
	"${pkgname%-*}".service
	"${pkgname%-*}".tmpfiles
)
noextract=()
sha256sums=('SKIP'
            '0820bcc60c77bd23178f4766f92f01dae2a75ae704ad6ac40ecf598a55002d36'
            '8c9f747bc6484290cb97b40e5904dc02cce2672e59e0f6ad720a1cd6a7b9d900'
            'dab02810b18e9d9bc7a20a84394998e492c61a464973be8f49d08a724a94ff09'
            '70c1d136ed639a84c6aca077df51ff857c32df8db5d74cc7df48f463708bdd0b')
			
pkgver() {
	cd "${pkgname%-*}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}	


build() {
	cd "${pkgname%-*}"
	go build .
}

package() {
	install -bDm 644 "${pkgname%-*}.service" "$pkgdir/usr/lib/systemd/system/${pkgname%-*}.service"
	install -bDm 644 "${pkgname%-*}.sysusers" "$pkgdir/usr/lib/sysusers.d/${pkgname%-*}.conf"

	install -bDm 644 "${pkgname%-*}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname%-*}.conf"
	install -bd -m 755 "${pkgdir}$_applocation/"{database,static,web,api}
	cp -r "${pkgname%-*}"/database/* "${pkgdir}"$_applocation/database/
	cp -r "${pkgname%-*}"/static/* "${pkgdir}"$_applocation/static/
	cp -r "${pkgname%-*}"/web/* "${pkgdir}"$_applocation/web/
	cp -r "${pkgname%-*}"/api/* "${pkgdir}"$_applocation/api/

	install -bDm 644 "${pkgname%-*}/99-${pkgname%-*}.rules" "$pkgdir/etc/udev/rules.d/99-${pkgname%-*}.rules"
	install -Dm 755 "${pkgname%-*}/$_upstreamname" "$pkgdir$_binlocation"
}
