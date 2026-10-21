# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=KingDasWinx
_gitname=Templum
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="An infinite canvas for your terminals and your AI coding agents."

pkgver=0.1.4
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
sha256sums=('853c6ef3e3f091222ed9b3d65b622aab25c5db1479ad0b11f8a2b64c5ca71cb9'
            '44636def9e9ab73158a63fd2acaad2bee92fc6be8678a54076aa93168e2fef1d')
sha256sums_x86_64=('45ccc511e98124c183e1dc91203d9eb43857791d6fe84044564720e22ddf85fb')
sha256sums_aarch64=('dc152310bca9992e257c125a7e25846e18d80cd2e8278c84d7b975392adc1dc5')


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
