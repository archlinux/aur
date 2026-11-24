# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-lite-bin
_pkgname=Bettbox
pkgver=1.20.0
pkgrel=1
pkgdesc="A cross-platform network traffic routing and DNS debugging tool, deeply built on the powerful Mihomo core. (Lite build: no EasyTier/Tailscale/ZeroTier/fake-TCP/gVisor)"
arch=('x86_64' 'aarch64')
url="https://github.com/appshubcc/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=(
	'bettbox' 'bettbox-bin' 'bettbox-compatible' 'bettbox-compatible-bin'
	'bettbox-compatible-pre' 'bettbox-compatible-pre-bin' 'bettbox-lite'
	'bettbox-lite-compatible' 'bettbox-lite-compatible-bin'
	'bettbox-lite-compatible-pre' 'bettbox-lite-compatible-pre-bin'
	'bettbox-lite-pre' 'bettbox-lite-pre-bin' 'bettbox-pre' 'bettbox-pre-bin'
)
provides=("${pkgname%-lite-bin}=${pkgver}")
depends=(
	'gtk3'
	'libayatana-appindicator'
	'libayatana-indicator'
	'libkeybinder3'
)
optdepends=('polkit: for TUN authorization')
options=('!debug')
source=("restart-bettbox.hook" "bettbox.install")
# Upstream names its debs by Debian architecture (amd64/arm64); the lite build
# ships as the unsuffixed deb (the standard one carries -standard). Both the
# cache name and the URL are
# spelled out per architecture. ${arch} cannot be used here: makepkg binds it
# to the *host* architecture while expanding per-arch arrays, so both entries
# would get the same cache name. The cache name carries the full pkgname: every
# package in a CI run shares one SRCDEST, and a name collision there would make
# makepkg reject the other package's cached file on its hash check.
source_x86_64=(
    "${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)
source_aarch64=(
    "${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb"
)
sha256sums=('03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
sha256sums_x86_64=('a4c6b235021f074c28d32fb3f382f7c703c32232d1c839b38df7be41c1a0b2bf')
sha256sums_aarch64=('229fbda47b8868f63a6f3377380c868bb62c72a6b0200db429de52d9b4ebaff9')
install=bettbox.install

prepare() {
	bsdtar -xf "${srcdir}/data."*
	sed -i -e "
		s/Exec=${_pkgname}/Exec=${pkgname%-lite-bin}/g
		s/Icon=${_pkgname}/Icon=${pkgname%-lite-bin}/g
	" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}

package() {
	install -Dm755 -d "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname%-lite-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-lite-bin}"
	install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-lite-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-lite-bin}/"
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-lite-bin}.desktop"
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-lite-bin}.png"
	install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-lite-bin}.png"

	install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

	# Polkit rule for resolvectl command; the upstream deb carries it at
	# usr/share/polkit-1/rules.d/, so the package ships that exact file.
	install -Dm644 "${srcdir}/usr/share/polkit-1/rules.d/90-bettbox.rules" \
		"${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"
}
