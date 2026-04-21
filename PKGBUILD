# Maintainer: 	EpicTux123 <EpicTux123@proton.me>
# Contributor: 	Stelios Tsampas <loathingkernel@gmail.com>
# Contributor:	Jaja <jaja@mailbox.org>
# Contributor:	floriplum <floriplum@mailbox.org>
# Contributor:	barfin (a.k.a. RogueGirl) <barfin@protonmail.com>
# Contributor:	various people submitting to the 'chaotic-aur' repository

#shellcheck disable=SC2034,SC2154

pkgname=proton-ge-custom
url='https://github.com/GloriousEggroll/proton-ge-custom'

pkgver=GE_Proton10_34
pkgrel=5
epoch=1

_pkgver=${pkgver//_/-}
_srcdir=${_pkgver}

source=(
	"${_pkgver}.tar.gz::${url}/releases/download/${_pkgver}/${_pkgver}.tar.gz"
	0001-build-make-compatible-with-system-wide-install.patch
	proton-ge-custom.conf
)
sha512sums=('9fd0b2cfbd501c0b5c892239c392c7283a029b5e5d5a77d3f85b0ce190d555456241a18eebca16b53f094b403499201c13550a3f0b9b365e1a5eb5737cbb7303'
            'cc5b0770abd984bddd0819fc7eae7d4ae55d91ae4fffc9f1d6643367cc4484c8854162ac6bfb1c78b70eb99e8be2554c15f907baa9ee2642c2791c1874a8f07b'
            'ac2bd634838ffe6b90f2637e229013f0993fc1013271dbeefd216dc262a8bb79e4a5ce15a75cbfcb0c3b521d32f4ebe1ed25a6b066b99cc327b60bd6d7212e6f')

pkgdesc='Proton from Valve Software with extra patches from GloriousEggroll'
arch=('x86_64')
license=('BSD-3-Clause')
provides=('proton')
conflicts=('proton-ge-custom-bin' 'proton-ge-custom-git')
options=(!strip emptydirs)

# Dependencies are (mostly) the same as the "steam" package
depends=(
	bash
	coreutils
	curl
	dbus
	desktop-file-utils
	diffutils
	freetype2
	gdk-pixbuf2
	glibc
	hicolor-icon-theme
	libgcc
	libxcrypt
	libxcrypt-compat
	libxkbcommon-x11
	lsb-release
	lsof
	nss
	python
	ttf-font
	usbutils
	vulkan-driver
	vulkan-icd-loader
	xdg-user-dirs
	xorg-xrandr
	xz
	zenity
)
depends_x86_64=(
	lib32-alsa-plugins
	lib32-fontconfig
	lib32-gcc-libs
	lib32-glibc
	lib32-libgl
	lib32-libgpg-error
	lib32-libnm
	lib32-libva
	lib32-libx11
	lib32-libxcrypt
	lib32-libxcrypt-compat
	lib32-libxinerama
	lib32-libxss
	lib32-nss
	lib32-pipewire
	lib32-systemd
	lib32-vulkan-driver
	lib32-vulkan-icd-loader
)
optdepends=(
	'steam: the Steam client'
	'umu-launcher: to use Proton-GE outside of Steam'
)
depends+=(NTSYNC-MODULE)

build() {
	# Automagically keep "Proton-GE" selected
	sed -i -r 's|"GE-Proton.*"|"Proton-GE"|' "${_srcdir}/compatibilitytool.vdf"

	# Prevent lock file from being created, since Proton-GE in /usr is not writable
	patch -N "${_srcdir}/proton" "${srcdir}/0001-build-make-compatible-with-system-wide-install.patch"
}

_protondir=usr/share/steam/compatibilitytools.d/${pkgname}
_licensedir=usr/share/licenses/${pkgname}

package() {
	# Create paths
	mkdir -p "${pkgdir}/${_protondir}/"
	mkdir -p "${pkgdir}/${_licensedir}/"
	mkdir -p "${pkgdir}/usr/lib/modules-load.d/"
	# Licenses
	mv "${_srcdir}/LICENSE" "${pkgdir}/${_licensedir}/"
	mv "${_srcdir}/LICENSE.OFL" "${pkgdir}/${_licensedir}/"
	mv "${_srcdir}/PATENTS.AV1" "${pkgdir}/${_licensedir}/"
	# NTSync module
	install -m 0644 "${srcdir}/${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
	# Main files
	mv "${_srcdir}"/* "${pkgdir}/${_protondir}"
}
