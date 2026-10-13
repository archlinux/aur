# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=31.8.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('4b490895d890bf25a58a29467f97cb95b7ad4b100d9c2f29aa6fa96865326ec7'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('c0e1c088d2b366a60e5f4047a5eb02cf6f10b03989191bbc564d733aafba307f')
sha256sums_armv7h=('0545ad95bff1502c9f598f1caf4bc247afb06b4f895d5260db81c4a1529d2a75')
sha256sums_aarch64=('c7ee6d1075b625a4f151bf177defbaed55995b2fcd98e410c7990d2394c3fd80')
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
