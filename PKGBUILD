# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=12
_pkgname=${_projectname}${_major}
pkgver=${_major}.0.12
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
sha256sums_x86_64=('ddfcddbffe8247d17878073933243d587b14870d3cee357fe430fe935a1eadc8'
                   '98e7cc5dd3f161c37cbbd9aef90d55c51531a4bad8221a9d1f92e78014758054')
sha256sums_i686=('b7dda7c31b00bb130f912b9e8a3766508f6880a8813223ebe12e2adcb598a5ca'
                 '2a06936fa13929342ebb7521d2e3e8b4a7a08ac1d757c0521a047b4cf0a979fc')
sha256sums_armv7h=('8bd9ddc1d578614adeef509aa6f3e4d07e87a3ebb853087bd8818f963fe360fc'
                   'c0a2c13d99a1152aa6252fd8237207a6f395b70d0890eba5b7209a03beb9a6ec')
sha256sums_aarch64=('b9ffca207573a2edee6003c2b1a60ba64b53322105339020199db6e6b30d9b89'
                    'a92e2eaebab75b93eda0bc523ba9262a32db95c7546c095fee93d39a304521a0')

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
