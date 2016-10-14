# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=1.6.1
pkgrel=1
_commit=9e4e44c19e393803e2b05fe2323cf4ed7e36880e
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'gulp' 'python2')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'nss' 'alsa-lib')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("${pkgver}-${pkgrel}.tar.gz::https://github.com/Microsoft/vscode/archive/${_commit}.tar.gz"
        "${pkgname}.desktop"
        'product_json.patch'
        'old-gulp-sourcemaps.patch')
sha1sums=('d2b827fbc7aa8b54343f6cda452fb74142e1993a'
          '9c4176c4d99103736df6746ca174b5026bd57e6b'
          'ba8febe936932080610d899fdb57294fc2f9f614'
          'e614e05c4b591bbc2514c944bf43330d69102542')

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

    # 1.8.0 is pulled in by default, which is currently broken upstream
    patch -p1 -i "${srcdir}/old-gulp-sourcemaps.patch"
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
