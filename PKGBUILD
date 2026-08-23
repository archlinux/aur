# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=picot-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Local Codex-style desktop GUI for the Pi coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/shixin-guo/picot"
license=('MIT')
depends=(
    'cairo'
    'dbus'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gcc-libs'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
# Upstream renamed the project pi-studio -> picot; this package supersedes
# pi-studio-bin. replaces= migrates existing installs on -Syu.
provides=('picot' 'pi-studio')
replaces=('pi-studio-bin')
conflicts=('picot' 'pi-studio-bin')
options=('!strip' '!debug')

_relurl="${url}/releases/download/v${pkgver}"

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_relurl}/Picot_${pkgver}_amd64.deb")
sha256sums_x86_64=('80adaab6b1cf4cad68f6a7b5d4d380d8b5ef835248f484956b0a9aa3753de635')
sha256sums_aarch64=('8ef0a2f048e51d39f5224b5036eeb36eb6eae47dbb24bb4ccdb874f0e04c6fca')
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_relurl}/Picot_${pkgver}_arm64.deb")

prepare() {
    mkdir -p "${srcdir}/data"
    cd "${srcdir}/data"
    ar x "${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb"
    tar xzf data.tar.gz
}

package() {
    cd "${srcdir}/data"

    install -Dm755 usr/bin/picot "${pkgdir}/usr/bin/picot"

    install -d "${pkgdir}/usr/lib/Picot"
    cp -a usr/lib/Picot/. "${pkgdir}/usr/lib/Picot/"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/picot.png \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/picot.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/picot.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/picot.png"
    if [[ -d usr/share/icons/hicolor/256x256@2 ]]; then
        install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/picot.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/picot.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/picot.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Picot
Comment=Local Codex-style desktop GUI for the Pi coding agent
Exec=picot
Icon=picot
Terminal=false
Categories=Development;
StartupWMClass=picot
EOF

    # Upstream declares MIT in package.json but ships no LICENSE file
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
}
