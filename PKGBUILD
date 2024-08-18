# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>

# Based on extra/electron29 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/

_pkgver=29.4.6
pkgrel=1
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
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
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
sha256sums_x86_64=('1c2b450b99929b49269a56db2dc60920f027ec92ae01a4620fa3f64473539caa'
                   '2346338e2ffa12276f5b3bc6d63ff357c39f42d260ad45f19471ef7bbf18a389')
sha256sums_armv7h=('2c639a32c9436f135ef69db9640dcf4489b2dea30e865a0f63a87bb92d9ccf88'
                   '9007e44a5cb5b7645455e7895d2039d3264cab2eb0ecf8dbb4295344d392ca74')
sha256sums_aarch64=('232c375e4789b887a7f8712a64ac5849cf41904808b9aa00f6f6fbbf6621105d'
                    '14d5b54ef561cea2ca28c55a877bc1a1a3e360ca2f9e69ab3aa719054eca8552')
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
