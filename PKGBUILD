# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>

# Based on extra/electron20 by
# Bruno Pagani <archange@archlinux.org>
# Caleb Maclennan <caleb@alerque.com>

# https://releases.electronjs.org/

_pkgver=20.3.12
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
sha256sums_x86_64=('03a2eda2689b172172da226ab6c92f26b2ea2a774429fae5a7b892ff43a43329'
                   '3d21d14e528980327a328f6bab3195ed7bfa1cab97ab7d3dbb023e657f663244')
sha256sums_armv7h=('cd1f4d473e9d23584307bf34fce1dcd55ca478406ad4050dfc8d9fe7a300d2cc'
                   '3319634fe22a8938e5bbabd5b7158ac5691df359aec5f6959bf0ad9fcc0d2af0')
sha256sums_aarch64=('203d0e35b468781f2cb89c2e83a11fcba56f1547740ea131f19401f6fc966973'
                    'fb25d52f9416bb626fc9e2b02f06d032653cfa1d96918dd13643bbd3ffcb4529')
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
