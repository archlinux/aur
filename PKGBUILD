# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=14
_pkgname=${_projectname}${_major}
_beta=18
_pkgver=${_major}.0.0-beta.${_beta}
pkgver="${_pkgver/-/.}"
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
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${_pkgver}"
source_x86_64=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-x86_64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-x64.zip"
	"${pkgname}-${pkgver}-${pkgrel}-x86_64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-x64.zip"
)
source_i686=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-i686.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-ia32.zip"
	"${pkgname}-${pkgver}-${pkgrel}-i686.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-ia32.zip"
)
source_armv7h=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-armv7h.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-armv7l.zip"
	"${pkgname}-${pkgver}-${pkgrel}-armv7h.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-armv7l.zip"
)
source_aarch64=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-arm64.zip"
	"${pkgname}-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('f42ab5ee9b45f3ac111e55be18e7ccf30d02006eab66f10d1548470e0730b9bc'
                   '26c00bf62776e70a4b45f37d29467736ac78c29a5c28d57d7152befec0f3b9a8')
sha256sums_i686=('cbebbe537179d3e1424e53f4ef444cceb244772282f8d257e8dc4b89379036d6'
                 '78456f224da5eaa15fb29e178a3dc868b0b37532a73bc49fef89dd3e1fd7bd88')
sha256sums_armv7h=('3543b9d91eef05830fd6b60dba31556af8ab8d5a9f7f17837cbe13d686ad19ca'
                   'a8e069a738f518f168c1ce09e055069a8ac81e668201cfb5d5977ac254618923')
sha256sums_aarch64=('6efc5b8caaa9b3df707d882e74b7af49e8b8d02b3aa5fdce2d7737c38461adea'
                    'eb6bfde9e7aa5df1c5ba2c25cd3f5e9f97edf4aea9bb1680033cfdab2704807d')

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
