# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=18
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_pkgver="${_major}.3.5"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies - binary version ${_major}"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
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
sha256sums_x86_64=('2adb2bd6157b849a14376111f2ad3cd866c9b0fdf45eba7e5cf36da978d719a1'
                   'ccfecf24deba3fb0db7f1425bcbe7db7f2397b5b251f360bae8cb26f4ab98bf4')
sha256sums_i686=('09f1034a3acdcf83d0c57972c699dede644c901cb2a2179ae5ebc827176b067f'
                 'f75a954ffc9401d314c67f693eaefb1449deb62b2ce54226dc24ea89591d8504')
sha256sums_armv7h=('ec3c80096fe40610d7beffc8637a289372358eb35481bf77522551cc1fefe6d6'
                   'c5be50e3affcee453ec14cfdf81f27087f2dde7fbc240aa380e8b9ac20b9f8d7')
sha256sums_aarch64=('12d9c0f3fb7d2f7eced4e5f38ab8e6eb315b020d25525da73ed2318ebbf023b0'
                    '97eb799c5ef38ef5cf7b1f58314777184a261fb4aece50c90e7d891087ca8469')

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
