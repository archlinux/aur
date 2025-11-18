# Maintainer: taotieren <admin@taotieren.com>

pkgname=rkdeveloptool-gui
pkgver=1.0.0
pkgrel=6
pkgdesc="RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
arch=($CARCH)
url="https://github.com/gahingwoo/RKDevelopTool-GUI"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
    # AUR
    rkdeveloptool
)
makedepends=(
    git
    python-pyqt6
    nuitka
)
optdepends=(
)
backup=()
options=('!strip' '!debug' '!lto')
install=
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.png"
)
sha256sums=('87f2433138ef98ef578cc3de5e57f42ecc8fa06f6919e1ea94aa2aa669aa356a'
            '91619e46e6adff808ed8a3061be5226589ed07ddf9ecd8df33e1a99f5ac563c4')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    git cherry-pick -n 76fd39a206c18888c20774f665e5a8490ea5f771
    python -m nuitka --standalone --onefile --follow-imports \
        --enable-plugin=pyqt6 \
        --include-data-file=./i18n.py=i18n.py \
        --linux-onefile-icon=${srcdir}/${pkgname}.png \
        --output-filename=rkdeveloptool-gui \
        --output-dir=dist \
        rkdevtoolgui.py
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm755 "dist/${pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname}
Comment=${pkgdesc}
GenericName=${pkgdesc}
Exec=${pkgname}
StartupNotify=false
Terminal=false
Type=Application
Categories=Utility;
Icon=${pkgname}.png
EOF
    install -vDm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
