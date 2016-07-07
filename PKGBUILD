# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=1.3.0
pkgrel=1
_commit=e724f269ded347b49fcf1657fc576399354e6703
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'gulp' 'python2')
depends=('gtk2' 'gconf' 'libnotify')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("${pkgver}-${pkgrel}.tar.gz::https://github.com/Microsoft/vscode/archive/${pkgver}.tar.gz"
        "${pkgname}.desktop"
        'product_json.patch')
sha1sums=('14cea8243f9dd032dda149aec01ebca29721685c'
          '9c4176c4d99103736df6746ca174b5026bd57e6b'
          '64b60edf3a1876e42e6c5a27d2b777cd578dccca')

case "$CARCH" in
    i686)
        _vscode_arch=ia32
        ;;
    x86_64)
        _vscode_arch=x64
        ;;
    *)
        # Needed for mksrcinfo
        _vscode_arch=DUMMY
        ;;
esac

prepare() {
    cd "${srcdir}/vscode-${pkgver}"

    patch -p1 -i "${srcdir}/product_json.patch"
    _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/$_commit/" -e "s/@DATE@/$_datestamp/" \
        -i product.json
}

build() {
    cd "${srcdir}/vscode-${pkgver}"

    ./scripts/npm.sh install

    # The default memory limit is too low for current versions of node to
    # successfully build vscode.  This will set it to 2GB -- change it if
    # this number still doesn't work for your system.
    node --max_old_space_size=2048 /usr/bin/gulp vscode-linux-${_vscode_arch}
}

package() {
    install -m 0755 -d "${pkgdir}/opt/VSCode-OSS"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/opt/VSCode-OSS"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    ln -s '/opt/VSCode-OSS/code-oss' "${pkgdir}/usr/bin/${pkgname}"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
