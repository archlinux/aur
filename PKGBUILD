# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=1.5.3
pkgrel=1
_commit=5be4091987a98e3870d89d630eb87be6d9bafd27
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'gulp' 'python2')
depends=('gtk2' 'gconf' 'libnotify')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("${pkgver}-${pkgrel}.tar.gz::https://github.com/Microsoft/vscode/archive/${_commit}.tar.gz"
        "${pkgname}.desktop"
        'product_json.patch')
sha1sums=('05d493941339c3e8f7255d62e17d083405660f72'
          '9c4176c4d99103736df6746ca174b5026bd57e6b'
          'ba8febe936932080610d899fdb57294fc2f9f614')

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
    cd "${srcdir}/vscode-${_commit}"

    _npm_ver=$(pacman -Q npm | cut -d' ' -f2)
    if [[ "${_npm_ver%-*}" == "3.10.8" ]]; then
        echo "npm 3.10.8 is known to have a bug which prevents the successful build of vscode"
        echo "Please downgrade to 3.10.7 or wait for a fixed version."
        echo "Refer to https://github.com/npm/npm/issues/14042 for details."
        exit 1
    fi

    patch -p1 -i "${srcdir}/product_json.patch"
    _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/$_commit/" -e "s/@DATE@/$_datestamp/" \
        -i product.json
}

build() {
    cd "${srcdir}/vscode-${_commit}"

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
