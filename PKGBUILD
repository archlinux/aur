# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>

# Based on extra/electron29 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/

pkgver=29.4.2
pkgrel=2
_major_ver=${pkgver%%.*}
_projectname=electron
_pkgname="${_projectname}${_major_ver}"
pkgname="${_pkgname}"-bin
pkgdesc='Build cross platform desktop apps with web technologies — binary'
arch=(x86_64 armv7h aarch64)
url='https://electronjs.org'
license=(MIT BSD-3-Clause)
depends=(c-ares
         gcc-libs # libgcc_s.so
         glibc # libc.so libm.so
         gtk3 libgtk-3.so
         libevent
         libffi libffi.so
         libpulse libpulse.so
         nss # libnss3.so
         zlib libz.so)
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'pipewire: WebRTC desktop sharing under Wayland'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${pkgver}"
source_aarch64=(
	"${_releaseurl}/chromedriver-v${pkgver}-linux-arm64.zip"
	"${_releaseurl}/${_projectname}-v${pkgver}-linux-arm64.zip"
)
source_armv7h=(
	"${_releaseurl}/chromedriver-v${pkgver}-linux-armv7l.zip"
	"${_releaseurl}/${_projectname}-v${pkgver}-linux-armv7l.zip"
)
source_x86_64=(
	"${_releaseurl}/chromedriver-v${pkgver}-linux-x64.zip"
	"${_releaseurl}/${_projectname}-v${pkgver}-linux-x64.zip"
)
sha256sums_x86_64=('e612ae9910bfd004ced13cdef0dda9e49d699c69ac18f04900b1129b98d41b23'
                   'eb07a8137fde970450242c51e0c2f8ef6556f377a21c357584aa2632ee9e1d3f')
sha256sums_armv7h=('e7bc85b47ec47f282a6d198f33c656618f9011366f47bb04fd31cef331691c8b'
                   'a75e2487ea1a1b292fbc160618167c204f161c602780f2b997b75d6ef5bbe539')
sha256sums_aarch64=('b501dac3cd694a879a82f65d6a15047ff417c3b5d70107ee38973f4d16477ea1'
                    'a5c2bc148d3f6c3ee2bd15289243a1b75093afde3753d0aa1125d2cb621f5b59')
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
