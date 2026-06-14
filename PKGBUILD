# Maintainer: jrdn <r7Iq7R1c@protonmail.com>

pkgname=openlinkhub-git
_upstreamname=OpenLinkHub
_binlocation=/usr/bin/"${pkgname%-*}"
_applocation=/var/lib/"${pkgname%-*}"
pkgver=0.8.8.r0.g6205308
pkgrel=1
pkgdesc="Open source Linux interface for iCUE LINK Hub and other Corsair AIOs, Hubs. [Latest Commit - source]"
arch=('x86_64')
url="https://github.com/jurkovic-nikola/OpenLinkHub"
license=('GPL3')
groups=()
depends=('systemd' 'i2c-tools' 'libpipewire')
makedepends=('go>=1.25.0' 'git' 'base-devel' 'systemd' 'libpipewire')
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
            'baabb14a12a0be730665f216aa04453f31b0d1efe4b4dfc234ed1f26670b8a71'
            '8c9f747bc6484290cb97b40e5904dc02cce2672e59e0f6ad720a1cd6a7b9d900'
            '858fd197e13a6bc2756e090f622adcac0d02d20007c366d0dff93258898e256e'
            '70c1d136ed639a84c6aca077df51ff857c32df8db5d74cc7df48f463708bdd0b')
			
pkgver() {
	cd "${pkgname%-*}"
	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

_upstreamver() {
	if git describe --tags --abbrev=0 >/dev/null 2>&1; then
		git describe --tags --abbrev=0 | sed 's/^v//'
	else
		printf '0'
	fi
}

build() {
	cd "${pkgname%-*}"

	local upstreamver
	upstreamver="$(_upstreamver)"

	CGO_CFLAGS_ALLOW='-fno-strict-overflow' go build -ldflags="-X OpenLinkHub/src/version.Version=${upstreamver}" .
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
