# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=22
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_dev=3
_pkgver="${_major}.0.0-beta.${_dev}"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies - binary version ${_major}"
arch=('x86_64' 'aarch64')
url=https://electronjs.org/
license=('MIT')
provides=("${_pkgname}=${pkgver}" "${_projectname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2'
         'snappy')
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
source_aarch64=(
	"${pkgname}-chromedriver-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-arm64.zip"
	"${pkgname}-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('3615b2927b21343c360fffba172474f9da5754d999b6eadf6202be0238161732'
                   '3db1b9dc6e59c9237f200652c60e65566f6605b30d895cd95d89a7d735cc0864')
sha256sums_aarch64=('f5f421139498d9172c1cfb1c60f42d98cdd268943772af4ad0c26c63464f13a3'
                    '6330e8519fae206c78bfc591283ba45c1903356142ffe3cf565ec8aff8fe73e4')

package() {
	install -dm755 "${pkgdir}/usr/lib/${_pkgname}/"
	find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "${pkgdir}/usr/lib/${_pkgname}/." {} +

	for _folder in 'locales' 'resources'; do
		cp -r --no-preserve=ownership --preserve=mode "${_folder}/" "${pkgdir}/usr/lib/${_pkgname}/${_folder}/"
	done

	chmod u+s "${pkgdir}/usr/lib/${_pkgname}/chrome-sandbox"

	install -dm755 "${pkgdir}/usr/bin"
	ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"

	for _license in 'LICENSE' 'LICENSES.chromium.html'; do
		install -Dm644 "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
	done
}
