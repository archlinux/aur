# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>

# Based on extra/electron26 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/

_pkgver=26.6.10
pkgrel=2
pkgver="${_pkgver/-/.}"
_major_ver=${pkgver%%.*}
_projectname=electron
_pkgname="${_projectname}${_major_ver}"
pkgname="${_pkgname}"-bin
pkgdesc='Build cross platform desktop apps with web technologies'
pkgdesc+=' — binary'
arch=(x86_64 armv7h aarch64)
url='https://electronjs.org'
license=(MIT BSD-3-Clause)
depends=(
    alsa-lib # libasound.so.2
    gcc-libs # libgcc_s.so
    glibc # libc.so libm.so
    gtk3 libgtk-3.so
    nss # libnss3.so
)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${_pkgver}"
source_aarch64=(
	"${_releaseurl}/chromedriver-v${_pkgver}-linux-arm64.zip"
	"${_releaseurl}/${_projectname}-v${_pkgver}-linux-arm64.zip"
)
source_armv7h=(
	"${_releaseurl}/chromedriver-v${_pkgver}-linux-armv7l.zip"
	"${_releaseurl}/${_projectname}-v${_pkgver}-linux-armv7l.zip"
)
source_x86_64=(
	"${_releaseurl}/chromedriver-v${_pkgver}-linux-x64.zip"
	"${_releaseurl}/${_projectname}-v${_pkgver}-linux-x64.zip"
)
sha256sums_x86_64=('06a9b7dec82b048a848b3eabe533df371055c89b1acfe43eda5f940ca8090a29'
                   '9a2ac0fcca0e0007859328b1df8e53f7ab1bc3d2946afee48c157a8a9ba36757')
sha256sums_armv7h=('ec006f1a7ba2243ba7d4cb1bf2cba6584fab90941436793cf7a4e1655f4c0ca2'
                   'f6fb96c37fa0b4061998441ebf3d8edee1076b6ef33d2f6fe16e07dcdb4c638a')
sha256sums_aarch64=('978ddf45f3e319f628e35981fff9d569a164867afe2155b521b0d86a832de863'
                    '1f235d36a9f3729b8e8da83b5819f42c7083aa7725bd4cf2cb9460e0b70c4f17')
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
