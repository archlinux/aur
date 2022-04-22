# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=18
_pkgname="${_projectname}"
pkgname="${_pkgname}-bin"
_pkgver="${_major}.1.0"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='Build cross platform desktop apps with web technologies'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://electronjs.org/'
license=('MIT' 'custom')
provides=("${_pkgname}=${pkgver}" "${_projectname}${_major}=${pkgver}")
conflicts=("${_pkgname}" "${_projectname}${_major}-bin")
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
sha256sums_x86_64=('37f20a888349fe737b94496574f5c29a03e0b49fb105f6f9926c2410e0c2e08c'
                   '7f95069d58e6843e6ae2b8f02619d4dcef7db4c35bd6e90b903268d83b939fba')
sha256sums_i686=('ab0654612850f258650a52047e2d9a166718b6f2f610a58b7c2c4a37b725bc05'
                 'e952d06b3828695636de522e3af8140543ecbe02d7351dd002b0ffb9e2a09705')
sha256sums_armv7h=('5743dddf3e512dc89a47987a89313b0c39e2cb8ff140b5960eb45c89113843e1'
                   'c2296f3f68938aab4cef07b747d2dd28973625b6717163b9c51fbcf1509fd8ff')
sha256sums_aarch64=('e6473fc6cad3aa270f81a60d2637e87fba1ad3771f6f2934c479c8bea14bb3d6'
                    '13bd4998d0d86ccf4cb87d11f9581d5a6063b4585fc4828e130054527dfb9179')

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
