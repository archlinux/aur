# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

# Based on aur/electron8-bin by Tom Vincent <http://tlvince.com/contact>

# Based on extra/electron28 by
# Caleb Maclennan <caleb@alerque.com>
# loqs <bugs-archlinux@entropy-collector.net>
# kxxt <rsworktech@outlook.com>

# https://releases.electronjs.org/

_pkgver=28.3.3
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
sha256sums_x86_64=('5272607001d4294d536e5ebdc6a10555557bd81b905bebe89b128e2c3ec106a5'
                   '20f6be493cbd6c9924206e744b1c490af1f97f4735451b9dc19f0d305366d546')
sha256sums_armv7h=('5ea3a62da4e0c44de8a498eaca963849daffe8e96128fb9d9d52ca254e6072bc'
                   '384d8b43f52b5350a438031ad12980418fc244b4b0aecfa5f7dcc3d6f103ebed')
sha256sums_aarch64=('c9d8092bb21198fc90eba452233871d81d1b549c3505e4fbd505eca61ce2c294'
                    'f77107266581a6b9880757876518df1c4bf6eeff5c193bb5de0a8f6c9902bd1f')
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
