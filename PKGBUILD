# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>
# Based on extra/electron* by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>

_projectname=electron
_major=27
_pkgname="${_projectname}${_major}"
pkgname="${_pkgname}"-bin
_subver="3.3"
_pkgver="${_major}.${_subver}"
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="Build cross platform desktop apps with web technologies — prebuilt"
arch=(x86_64 aarch64)
url='https://electronjs.org'
license=(MIT custom)
depends=(c-ares
         alsa-lib
         gtk3
         libevent
         libffi
         nss)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
provides=("${_pkgname}=${pkgver}" "${_projectname}=${pkgver}")
conflicts=("${_pkgname}")
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${_pkgver}"
source_x86_64=(
	"${pkgname}-chromedriver-${pkgver}-x86_64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-x64.zip"
	"${pkgname}-${pkgver}-x86_64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-x64.zip"
)
source_aarch64=(
	"${pkgname}-chromedriver-${pkgver}-aarch64.zip::${_releaseurl}/chromedriver-v${_pkgver}-linux-arm64.zip"
	"${pkgname}-${pkgver}-aarch64.zip::${_releaseurl}/${_projectname}-v${_pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('fbc24cb86b354f81604dd932a12e76925721cb1e85c4a08931c4c01092ace148'
                   '7685e896601b5611dea2aac243425e0fbe3244d7d5c3480aa8e1e3ebd03ea30f')
sha256sums_aarch64=('1c5c35797178defab18fd8489aa1fe2c1ac9ee497319d8c1079b8319e108aca2'
                    '58427422b92e83e2f8036781bfd01a659a0a6e8092c568e50a3c6e0a54db68bc')

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
