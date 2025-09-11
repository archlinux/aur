# Maintainer: Eric Deng <dev at ericd dot me>
# Maintainer: Xuanwo <github at xuanwo dot io>
# Maintainer: Benjamin von Polheim <hi at benvp dot co>

pkgname=tana
pkgver=1.0.44
pkgrel=1
pkgdesc="The Everything OS. The all-in-one workspace"
arch=('x86_64')
url="https://tana.inc"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'mesa' 'libxcb')
optdepends=('alsa-lib' 'gnome-keyring' 'pulseaudio')
options=('!strip')
install=${pkgname}.install
source_x86_64=(
	"https://github.com/tanainc/tana-desktop-releases/releases/download/v${pkgver}/Tana-linux-x64-${pkgver}.zip"
	"tana.desktop"
	"tana.png")
sha512sums_x86_64=('a1539c9dc5b2ff345e1d165bb4a3e4879733b22129bf05f1eaa1f7e1fd139129aee6237e30da54bf7eddb0b8f333f379053de601cde8907194adea8a785ffcdd'
                   'aba951628007b1c1fb004732e78295689b4d95d189b935f428a6195197a665776057a71358437fcb89af415bc39b2a8d332ab75569e0e5cc1ce6b5b0c4f95107'
                   'fd59c24253b0b7981524f50f8e3882aed59f4d3d9c1e8b99067cb706de5d7224a9f13407b1af1a90c91138cbe49484c553243793d7832f9d1ed3d78062a4d8e1')

_gen_script() {
	cat <<'EOF' >"${pkgname}.sh"
#!/usr/bin/env sh
set -e

APPDIR="/opt/tana"
_ELECTRON="${APPDIR}/Tana"

_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/tana-flags.conf"
if [ -r "$_FLAGS_FILE" ]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

if [[ $EUID -ne 0 ]] || [[ $ELECTRON_RUN_AS_NODE ]]; then
    exec ${_ELECTRON} $_USER_FLAGS "$@"
else
    exec ${_ELECTRON} --no-sandbox $_USER_FLAGS "$@"
fi
EOF
}

prepare() {
	_gen_script
}

package() {
	install -dm755 "${pkgdir}/opt/${pkgname}"
	cp -r ${srcdir}/Tana-linux-x64/* "${pkgdir}/opt/${pkgname}/"
	mkdir -p "${pkgdir}/usr/bin"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/tana"

	install -Dm644 "${srcdir}/tana.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/tana.png" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "${srcdir}/Tana-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
