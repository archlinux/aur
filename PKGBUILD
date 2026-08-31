# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=moneymanagerex
_gitname=moneymanagerex
_appname=mmex
pkgname=${_gitname}-bin
pkgdesc="MoneyManagerEx is an easy-to-use personal finance suite."

pkgver=1.9.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('Ubuntu.24.04.noble_amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-2.0-or-later')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('tar' 'patchelf')
depends=('glibc' 'libgcc' 'libstdc++' 'glib2' 'wxwidgets-gtk3' 'webkit2gtk-4.1' 'libpng' 'libtiff' 'libjpeg-turbo' 'cairo' 'zlib' 'libx11' 'wayland' 'fontconfig' 'zlib' 'libsm' 'gdk-pixbuf2' 'libwebp' 'libxkbcommon' 'pango' 'gtk3' 'pcre2' 'expat' 'fmt' 'lua53' 'curl')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}-${_barch[0]}.deb")
sha256sums=('64e583de625960a6049167d3e6d47e7cfb5f05f6bc548a3e68f7d373edacff96'
            'f86aeb5c80e9784a1b6dc04b5e2f5c0aac31b7d3ab9b842a2e813419e4abea93')
sha256sums_x86_64=('f410d50eeecb0a4b61578b048a2b3d501fcc69bac3eddd6a0a4b391f13332a34')


package() {
	cd "${pkgdir}/" || exit

	tar -xf "${srcdir}/data.tar.gz"

	patchelf --replace-needed 'liblua5.3.so.0' 'liblua5.3.so' "${pkgdir}/usr/bin/${_appname}"

	rm -rf "${pkgdir}/usr/include/fmt/" "${pkgdir}/usr/lib/cmake/fmt/" "${pkgdir}/usr/lib/pkgconfig/fmt.pc"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
