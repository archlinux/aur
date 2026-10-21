# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KingDasWinx
_gitname=Templum
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="An infinite canvas for your terminals and your AI coding agents."

pkgver=0.1.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
        "ICON-${pkgver}.svg::${_ghurlraw}/crates/templum/icons/icon.svg")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('99311e13725bcf0b7df27f47d20115b0a68616b850dc5744da814c1a5427303a'
            '44636def9e9ab73158a63fd2acaad2bee92fc6be8678a54076aa93168e2fef1d')
sha256sums_x86_64=('13755360cb18f1aaeb330ccc3c2590682cc7255e8b3520d7f7db0c8c8f7c5f93')
sha256sums_aarch64=('b2615ff08e5793fd196775595c64dd11ec08a556b55881fe444d6746f9e93c8b')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

prepare() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	cat << EOF > ./${_appname}.desktop
[Desktop Entry]
Type=Application
Name=${_appname^}
Comment=${pkgdesc//\./}
Exec=/usr/bin/${_appname}
Icon=${_appname}
Terminal=false
Categories=Development;
StartupWMClass=${_appname}
EOF

	mv ../ICON-${pkgver}.svg ./${_appname}.svg

	mv ../README-${pkgver}.md ./README.md
}

package() {
	cd "${srcdir}/${_appname}-${_CARCH}/" || exit

	install -Dm755 ${_appname} -t "${pkgdir}/usr/bin/"

	install -Dm644 ${_appname}.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

	install -Dm644 ${_appname}.desktop -t "${pkgdir}/usr/share/applications/"

	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
