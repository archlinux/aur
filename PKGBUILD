# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=reviu-dev
_gitname=reviu
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Keyboard-first desktop Git client in Rust + GPUI"

pkgver=0.18.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('FSL-1.1-ALv2')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

makedepends=('patchelf')
depends=('glibc' 'libgcc' 'glib2' 'libxcb' 'gtk3' 'gdk-pixbuf2' 'xdotool' 'libxkbcommon-x11' 'libxkbcommon')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('cb8c2f95f9b855234e18d2322812a7466a4f5830e807ca4019e4a8b3301101ae'
            '4dceb15afbd70286259a0c40c6d4b323e259cb79d6d3feda44609c455e84793e')
sha256sums_x86_64=('a9925940c5b3a608c7101450d4ae4847c27ab3698ffd2f813a3f5037f7688128')
sha256sums_aarch64=('43d65404f72ac482cc4c462114e99316beeb44eb7891f071c602bd9d756afdb8')


prepare() {
	cd "${srcdir}/${_appname^}-${pkgver}-linux-${CARCH}/" || exit

	patchelf --replace-needed "libxdo.so.3" "libxdo.so.4" "./bin/${_appname}"
}

package() {
	cd "${srcdir}/${_appname^}-${pkgver}-linux-${CARCH}/" || exit

	install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm755 /dev/stdin "${pkgdir}/usr/share/applications/${_appname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=${_appname^}
Comment=Keyboard-first Git client
Exec=/usr/bin/${_appname} %U
Icon=${_appname}
Terminal=false
Categories=Development;VersionControl;
MimeType=x-scheme-handler/${_appname};
StartupWMClass=${_appname^}
EOF

	install -Dm644 "share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_appname}.png"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
