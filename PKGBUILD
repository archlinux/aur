# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# based on aur electron8-bin: Tom Vincent <http://tlvince.com/contact/>

_projectname=electron
_major=18
_pkgname="${_projectname}"
pkgname="${_pkgname}-bin"
_pkgver="${_major}.0.2"
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
sha256sums_x86_64=('5d551b755d027db79d1c15709b31aa8f64998d40124d046940f2c97c7cc30da9'
                   'bacb8c00cbbc0d77b2af0f8811fef589c70f9d0e5f39adbe14f7dba569237572')
sha256sums_i686=('a676612c7578f53cd7596fe3de58724b8a886609b4986e0397ac0459a1a3dd14'
                 'f17647c17785f7ddea395f3eb302f67772bb3a553c1b7d31b55ef79a0318bfb6')
sha256sums_armv7h=('b6e354e43b6a5a1621da7ba32a7c6a0265e82721efef4c9e85b3174b73b5efa6'
                   '7fc252b7f62b6731ec02ce2d00a8687c8485d538a724c02d47f937adfd96a30a')
sha256sums_aarch64=('56ecddde4606bbae5758adca313a9860ec4645f4de2acb1896547b07a4c5d115'
                    '657d291af8777eaf58fc03176723c089b6e0f93c0d28763a24f1e16f20579481')

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
