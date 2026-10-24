# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=runyte
_gitname=runyte
_edition=desktop
_appname=${_gitname}
_appid="com.${_appname}.${_appname^}"
_alias=runed
pkgname=${_appname}-bin
pkgdesc="An editor-first, agent-ready terminal workspace for software development"

pkgver=0.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MPL-2.0')

provides=("${_appname}" "${_alias}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'hicolor-icon-theme')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_edition}-${_gitversion}-${_barch[0]}.tar.xz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.txz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_edition}-${_gitversion}-${_barch[1]}.tar.xz")
sha256sums_x86_64=('5ea2687c79d0baf4be7002586373fe04eee1e396918d96403ee01f5a1e0364d3')
sha256sums_aarch64=('bceaa9836afc9e2a99274690b4cf2bcf902f346a57071b90524d52c5fd1d0216')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

package() {
	cd "${srcdir}/${_appname}-${_edition}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	ln -sf "/usr/bin/${_appname}" "${pkgdir}/usr/bin/${_alias}"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_appid}.desktop" <<EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=${_appname^}
Comment=Modal Text Editor
Exec=/usr/bin/${_appname} --window --editor %F
Icon=${_appid}
Terminal=false
Categories=Development;TextEditor;
MimeType=text/plain;
StartupWMClass=${_appid}
EOF

	install -Dm644 "contrib/packaging/icons/${_appid}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_appid}.svg"
	for size in 16 32 64 128 256 512 1024; do
		install -Dm644 "contrib/packaging/icons/${_appname}-${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_appid}.png"
	done

	install -Dm644 "config.example.yaml" "${pkgdir}/usr/share/doc/${pkgname}/config/config.example.yaml"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/user-guide.md" "${pkgdir}/usr/share/doc/${pkgname}/USER-GUIDE.md"

	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
