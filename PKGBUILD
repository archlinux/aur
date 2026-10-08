# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=31.6.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('b37008ce5d2a9f561770ba0fe1554c14355ddfb60ab672187a29d0212742d597'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('c6ff2e90bd6c6750d18b43d734cc45127a942346fb4d41d482ed9eace8ac4cd6')
sha256sums_armv7h=('3f152ca1039474a9027e114b26d845eb30ecd7cf91f7e124ebaddb11b12c1ab1')
sha256sums_aarch64=('39e65d329349c4d52590abe88e04064e8e59feb3617ee6f22c84eb13bae7500f')
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
