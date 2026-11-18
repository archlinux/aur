# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-lite-compatible-bin
_pkgname=Bettbox
pkgver=1.19.8
pkgrel=1
pkgdesc="A cross-platform network traffic routing and DNS debugging tool, deeply built on the powerful Mihomo core. (Lite build: no EasyTier/Tailscale/ZeroTier/fake-TCP/gVisor; Build with GOAMD64=v1)"
arch=('x86_64')
url="https://github.com/appshubcc/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=(
	'bettbox' 'bettbox-bin' 'bettbox-compatible' 'bettbox-compatible-bin'
	'bettbox-compatible-pre' 'bettbox-compatible-pre-bin' 'bettbox-lite'
	'bettbox-lite-bin' 'bettbox-lite-compatible' 'bettbox-lite-compatible-pre'
	'bettbox-lite-compatible-pre-bin' 'bettbox-lite-pre'
	'bettbox-lite-pre-bin' 'bettbox-pre' 'bettbox-pre-bin'
)
provides=("${pkgname%-lite-compatible-bin}=${pkgver}")
depends=(
	'gtk3'
	'libayatana-appindicator'
	'libayatana-indicator'
	'libkeybinder3'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook" "bettbox.install")
# Upstream names its debs by Debian architecture (amd64/arm64) and marks the
# lite variant with a -lite suffix, so both the cache name and the URL are
# spelled out per architecture. ${arch} cannot be used here: makepkg binds it
# to the *host* architecture while expanding per-arch arrays, so both entries
# would get the same cache name. The cache name carries the full pkgname: every
# package in a CI run shares one SRCDEST, and a name collision there would make
# makepkg reject the other package's cached file on its hash check.
source_x86_64=(
    "${pkgname}-${pkgver}-${arch}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64-compatible-lite.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
sha256sums_x86_64=('cb962c303944723e118dd7b3a9b299f22db2cb9bae105be37372fa38b8a8ac90')
install=bettbox.install

prepare() {
	bsdtar -xf "${srcdir}/data."*
	sed -i -e "
		s/Exec=${_pkgname}/Exec=${pkgname%-lite-compatible-bin}/g
		s/Icon=${_pkgname}/Icon=${pkgname%-lite-compatible-bin}/g
	" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
	install -Dm755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname%-lite-compatible-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-lite-compatible-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-lite-compatible-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-lite-compatible-bin}/"
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-lite-compatible-bin}.desktop"
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-lite-compatible-bin}.png"
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-lite-compatible-bin}.png"

	install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

	# Polkit rule for resolvectl command; the upstream deb carries it at
	# usr/share/polkit-1/rules.d/, so the package ships that exact file.
	install -Dm644 "${srcdir}/usr/share/polkit-1/rules.d/90-bettbox.rules" \
		"${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"
}
