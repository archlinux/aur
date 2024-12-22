# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-comtool-git
pkgver=3.4.1.r13.g2a958d8
pkgrel=3
epoch=
pkgdesc="A cross platform serial debug tools written by python"
arch=('any')
url="https://github.com/Neutree/COMTool"
license=('LGPL-3.0-or-later')
groups=()
depends=('python'
    'python-pyqt5'
    'python-pyserial'
    'python-requests'
    'python-babel'
    'python-qtawesome'
    'python-paramiko'
    'python-pillow'
    'python-pyte'
    'python-pyperclip'
    'python-coloredlogs'
    'python-numpy'
    'python-qtpy'
    'python-wcwidth'
    'python-pyqtgraph')
makedepends=('python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git')
checkdepends=()
optdepends=()
provides=('COMTool' 'comtool')
conflicts=('comtool' 'python-comtool')
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("${pkgname}::git+${url}.git"
    $pkgname.install)
noextract=()
sha256sums=('SKIP'
            '45b92e9788ac186a4fa2bad728fe7956b2afb52c4f4b01481ddd2b26ed47bdc3')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -rf "${pkgdir}/usr/LICENSE"
    rm -rf "${pkgdir}/usr/README.MD"
    install -Dm0644 "${srcdir}/${pkgname}/COMTool/assets/logo.png" "${pkgdir}/usr/share/pixmaps/comtool.png"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.neutree.comtool.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=ComTool
Comment=comtool serial communication debug tool
Exec=comtool %U
Icon=comtool.png
Categories=Development;
Terminal=false
StartupNotify=true
MimeType=application/x-executable;
EOF
}
