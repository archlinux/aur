# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=11
_pkgname=${_projectname}${_major}
pkgver=${_major}.4.9
pkgname=${_pkgname}-bin
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies - version ${_major} - binary version"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url=https://electronjs.org/
license=('MIT')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libnghttp2' 'libxslt' 'minizip' 'nss' 're2' 'snappy')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'pipewire: WebRTC desktop sharing under Wayland'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${pkgver}"
source_x86_64=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-x86_64.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-x64.zip"
	"${pkgname}-${pkgver}-${pkgrel}-x86_64.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-x64.zip"
)
source_i686=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-i686.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-ia32.zip"
	"${pkgname}-${pkgver}-${pkgrel}-i686.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-ia32.zip"
)
source_armv7h=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-armv7h.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-armv7l.zip"
	"${pkgname}-${pkgver}-${pkgrel}-armv7h.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-armv7l.zip"
)
source_aarch64=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-arm64.zip"
	"${pkgname}-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('3830e6398e4ee29f18c036f5e06217030dfebfc7c6c9f988f0e9fb3620d1e8f8'
                   'c18ed2e16e60ca1eddd01ab2e4fff2bbfd9f197ab17b7577155f05687297d7be')
sha256sums_i686=('95148d3e415717de9e79876b311d050d57c97d243d74560cbb340a69ab9b6b36'
                 'ef9125268e03f2f1d13c2b2505ba2529af88a8397cad640bd35116caae7ab296')
sha256sums_armv7h=('d217f7b568d376876719c1aeb751948c6a52447897e1a6429d7da8c7be857a71'
                   'b43c00f4a0b4cf8affa09cedff93066d23d57a6148af383a8fc9f6d25b63d449')
sha256sums_aarch64=('e5549af361928eac79cf54e5e15b85b4de13f3ac8adb273d77d53bc2b2602a1e'
                    '3df038538056fc4a918afe07138052b1f53648c411add47c3a18abe8a30e6f71')

package() {
	install -dm755 "${pkgdir}/usr/lib/${_pkgname}/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "${pkgdir}/usr/lib/${_pkgname}/." {} +

	for _folder in 'locales' 'resources' 'swiftshader'; do
		cp -r --no-preserve=ownership --preserve=mode "${_folder}/" "${pkgdir}/usr/lib/${_pkgname}/${_folder}/"
	done

	chmod u+s "${pkgdir}/usr/lib/${_pkgname}/chrome-sandbox"

	install -dm755 "${pkgdir}/usr/bin"
	ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
	done
}
