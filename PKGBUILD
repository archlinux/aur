# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname='oh-my-posh'
pkgname="${_pkgname}-bin"
pkgver=33.2.0
pkgrel=1
pkgdesc="A prompt theme engine for any shell."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('c6ebd84e5b74eca8fb27aabb03d768922589b81bcf1a8d87a84f3a74cbbd498e'
            'a5308c4e51268229a039ec4ec9a251a4cdb89d9380383e6e13aeba64a74f19ad')
sha256sums_x86_64=('85c3ae3f5cb74db0b1df55b3797b8a19f4cc64bc2da961a3e0e649bb4035d89f')
sha256sums_armv7h=('300285fa6b4fefe51ff6d7d1df0ed9b2271d4a295022d30d57e65b67f24e4012')
sha256sums_aarch64=('6c59a56bf8fc451febdf32568487aa49e1dbc85264ce5b4592ad762451e0b4cd')
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
