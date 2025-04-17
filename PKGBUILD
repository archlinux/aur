# Maintainer: Treadful <mail at treadful dot dev>
_base_pkgname="mollysocket"
pkgname="${_base_pkgname}-bin"
pkgver=1.6.0
pkgrel=1
pkgdesc="Service linking Signal notifications and UnifiedPush."
arch=('x86_64' 'armv7h' 'arm64')
url="https://github.com/mollyim/mollysocket"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'openssl' 'sqlite')
provides=("${_base_pkgname}=${pkgver}")
conflicts=("${_base_pkgname}=${pkgver}")
backup=(
	"etc/${_base_pkgname}/conf.toml"
	"usr/lib/systemd/system/${_base_pkgname}.service"
	"usr/lib/systemd/system/${_base_pkgname}-vapid.service"
)
source=(
	"conf.toml"
	"${_base_pkgname}.sysusers"
	"${_base_pkgname}.tmpfiles"
	# NOTE: service files improved since latest release tag.
	# TODO: move these to release tag after next release
	"https://raw.githubusercontent.com/mollyim/mollysocket/aaedd5b8afc2c08233d7a768694bd72eba4480b4/mollysocket.service"
	"https://raw.githubusercontent.com/mollyim/mollysocket/aaedd5b8afc2c08233d7a768694bd72eba4480b4/mollysocket-vapid.service")
source_x86_64=(
	"${pkgname}-${pkgver}::https://github.com/mollyim/mollysocket/releases/download/${pkgver}/${_base_pkgname}-linux_amd64")
source_armv7h=(
	"${pkgname}-${pkgver}::https://github.com/mollyim/mollysocket/releases/download/${pkgver}/${_base_pkgname}-linux_arm_v7")
source_arm64=(
	"${pkgname}-${pkgver}::https://github.com/mollyim/mollysocket/releases/download/${pkgver}/${_base_pkgname}-linux_arm64 ")
noextract=()
sha256sums=(
	'75dc63e3072d89e1d3ba41926a7d0a686dcf81ac80c76eeb5451239ed058fb38'
	'7d1d8a3102c6264c136cb22dbc5cafaaf5fc8db3757a5b3edef57c5a1b96149a'
	'3e4d6157af3fa36253cd4a7df3614f8b785cc87a93416b2c1172598d30af2c1d'
	'5579dab8879a856dc02450502ac9b246d869142e200c613688163a3d8888d5ce'
	'4405930c9827de0806bf0c652c3413bc6457de50cd7b6870c1f44b587d5480ae')
sha256sums_x86_64=(
	'9045f76729db5defee0652d9be4a474526d8fae47e5b1785b44cb84cdc5b57a6')
sha256sums_armv7h=(
	'e724c0a30c1de2bd74f5e065f88e87973c0c40a683a596e24da83ca3d067dc5c')
sha256sums_arm64=(
	'dfccec9802baaa80059018a7e90ff07f6e086c1ad45e05c54f718e428eb47d42')
validpgpkeys=()

package() {
	# Systemd files
	install -dm755 \
		"${pkgdir}/usr/lib/systemd/system" \
		"${pkgdir}/usr/lib/sysusers.d" \
		"${pkgdir}/usr/lib/tmpfiles.d"
	install -Dm644 "${srcdir}/${_base_pkgname}.sysusers" \
		"${pkgdir}/usr/lib/sysusers.d/${_base_pkgname}.conf"
	install -Dm644 "${srcdir}/${_base_pkgname}.tmpfiles" \
		"${pkgdir}/usr/lib/tmpfiles.d/${_base_pkgname}.conf"
	install -Dm644 mollysocket.service \
		"$pkgdir/usr/lib/systemd/system/${_base_pkgname}.service"
	install -Dm644 mollysocket-vapid.service \
		"$pkgdir/usr/lib/systemd/system/${_base_pkgname}-vapid.service"


	# Mollysocket config and bin
	install -Dm644 conf.toml "$pkgdir/etc/${_base_pkgname}/conf.toml"
	install -Dm755 "${pkgname}-${pkgver}" \
		"$pkgdir/usr/bin/ms"
}

