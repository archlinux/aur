# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KingDasWinx
_gitname=Templum
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="An infinite canvas for your terminals and your AI coding agents."

pkgver=0.2.0
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
sha256sums=('9118d0d9f4ee3ea582fb3d2091f59c24de0a9bf9eadec28087d0c009c44167b9'
            '44636def9e9ab73158a63fd2acaad2bee92fc6be8678a54076aa93168e2fef1d')
sha256sums_x86_64=('a3c684e685008643f5bed511d6f86be2cd6ed9c4cb79a7881599b08923976e2f')
sha256sums_aarch64=('7c6e67ed5de36059e16878ff8961d96be0041cfe110d652cbfecb3e76a7ac59e')


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
