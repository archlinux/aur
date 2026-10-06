# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=31.5.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('60869bd08050b2519bd39efe6c1805b7e0375387a0e61ececa78cb607d78dc80'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('733979ee65c9958da451fec22bda6b8ea4fd7976279bde5386b19069b62e7afe')
sha256sums_armv7h=('4a8e76d1a787ffc5d06a8b346bf3c7b7ddd38b89583f852954bd75085a81a4f4')
sha256sums_aarch64=('696bf884db57c3a95ec0c7f4e94ea0819d54a5c80c9bdaa46a57ac53178e6a75')
source=(
	"themes-${sha256sums[0]}.zip::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/themes.zip"
	"LICENSE-${sha256sums[1]}::https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/v${pkgver}/COPYING"
)
source_x86_64=("posh-linux-amd64-${sha256sums_x86_64}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-amd64")
source_armv7h=("posh-linux-arm-${sha256sums_armv7h}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm")
source_aarch64=("posh-linux-arm64-${sha256sums_aarch64}::https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v$pkgver/posh-linux-arm64")
noextract=("themes-${sha256sums[0]}.zip")

pkgver() {
	curl --silent -L "https://api.github.com/repos/JanDeDobbeleer/oh-my-posh/releases/latest" |
		sed -n 's/.*"tag_name": *"v\{0,1\}\([^"]*\)".*/\1/p'
}

package() {
	install -Dm 644 "${srcdir}/LICENSE-${sha256sums[1]}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	if [[ "$CARCH" = 'x86_64' ]]; then
		install -Dm 755 "${srcdir}/posh-linux-amd64-${sha256sums_x86_64}" "${pkgdir}/usr/bin/oh-my-posh"
	elif [[ "$CARCH" = 'armv7h' ]]; then
		install -Dm 755 "${srcdir}/posh-linux-arm-${sha256sums_armv7h}" "${pkgdir}/usr/bin/oh-my-posh"
	elif [[ "$CARCH" = 'aarch64' ]]; then
		install -Dm 755 "${srcdir}/posh-linux-arm64-${sha256sums_aarch64}" "${pkgdir}/usr/bin/oh-my-posh"
	fi

	mkdir -p "${pkgdir}/usr/share/oh-my-posh/themes"
	bsdtar -xf "${srcdir}/themes-${sha256sums[0]}.zip" -C "${pkgdir}/usr/share/oh-my-posh/themes"
	find "${pkgdir}/usr/share/oh-my-posh/themes/" -type f -exec chmod 644 {} +
}
