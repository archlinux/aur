# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=vscode-bin
pkgdesc='Visual Studio Code for Linux'
pkgver=0.10.1
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('custom')
makedepends=()
depends=('gtk2' 'gconf')

_src_base="https://az764295.vo.msecnd.net/public/${pkgver}"
source_i686=("${_src_base}/VSCode-linux32.zip"
             'vscode.desktop')
source_x86_64=("${_src_base}/VSCode-linux64.zip"
               'vscode.desktop')
sha1sums_i686=('793403a073b5a484e906a191ff5d4957e69911d3'
               '71efff6181d2bba05376ce7401801671e6a58752')
sha1sums_x86_64=('65693e3991fa15efc20a7e2d749b40d582f88022'
                 '71efff6181d2bba05376ce7401801671e6a58752')

package() {
    _dirname=INVALID
    if [ "$CARCH" = "i686" ]; then
        _dirname=VSCode-linux-ia32
    elif [ "$CARCH" = "x86_64" ]; then
        _dirname=VSCode-linux-x64
    fi

    install -m 0755 -d "${pkgdir}/opt/VSCode"
    cp -r "${srcdir}/${_dirname}"/* "${pkgdir}/opt/VSCode"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    ln -s /opt/VSCode/Code "${pkgdir}/usr/bin/vscode"

    # Add .desktop file
    install -D -m644 "${srcdir}/vscode.desktop" \
            "${pkgdir}/usr/share/applications/vscode.desktop"

    # Install license file
    install -D -m644 "${srcdir}/${_dirname}/resources/app/license.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
