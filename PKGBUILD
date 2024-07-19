# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>

# Based on extra/electron29 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/

_pkgver=29.4.5
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
sha256sums_x86_64=('4b305c3b0ce7b67316143162ba78bf217a95aa255c0cc847b2553551b0296790'
                   'b81bac1ffa3b0d82837d05212e988854ca9db0350c571857e0851f34443a5ecd')
sha256sums_armv7h=('128b6312f8677da8e133fc7878c7a476bd80f89d7002968e5f3d5946979c33a9'
                   '1f8681870ffda20a4f45afffd850619a55e711b3f6a033a5ac4a659540f7b339')
sha256sums_aarch64=('5bef9d44e32b853c31a11140c46304cfe2ba821e403beb55f14b9aa875ae1488'
                    'b27d87b8d0da41cab3c683ac7fa71af84492fe5f9bcd5970da0c73901d18c5f8')
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
