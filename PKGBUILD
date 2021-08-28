# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=11
_pkgname=${_projectname}${_major}
_pkgver=${_major}.4.12
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
sha256sums_x86_64=('bf5b4dff1c7569c8c5d58674c467d264621c484b23f82e9d17f9dee614fdfd4c'
                   '948e6377c3efc63429f3fa689566238ccb196abb8077dd984d3959c2b239b8be')
sha256sums_i686=('d21af1ba8edce2817956c9106d62158f6ad395821f154d4c7d8bb70151b8c351'
                 '593df3f688032fd035a7e49c6b34c3c801eef0cf47671d2437ce51ccafde8d69')
sha256sums_armv7h=('382514e9f4519a3550368f3cf8a27c33c28af9b1ae0b64fbe2c4b07ae7743765'
                   '0905b508f30a9ab4f5e6d166e3c7fb924da3cfe569a684ca6dcf5159beb8439d')
sha256sums_aarch64=('0d22c1edfd1cb5373f1dcf72472ed2bf6fcc0df63a859f8293473886f52b025f'
                    '886bdd7f6b85ed4ba9a1de0d50dd51fbdbe76b2d669e91683a9156f073b69a2c')

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
