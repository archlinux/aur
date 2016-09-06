# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=visual-studio-code-git
pkgdesc='Visual Studio Code for Linux, Open Source version from git'
pkgver=1.1.0.insider.r4276.g2a215cc
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'gulp' 'python2')
depends=('gtk2' 'gconf')
conflicts=('vscode-oss' 'visual-studio-code-oss')
provides=('vscode-oss' 'visual-studio-code-oss')

source=("git+https://github.com/Microsoft/vscode"
        "${pkgname}.desktop"
        'product_json.patch')
sha1sums=('SKIP'
          'a42e461ed586ef0fd31ff911ad662135f4f602aa'
          '34758e925f36cabe6167198c9bd11c12b07b2052')

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

pkgver() {
    cd "${srcdir}/vscode"
    git describe --tags --match '?.*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/vscode"

    patch -p1 -i "${srcdir}/product_json.patch"
    local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
    local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/${_commit}/g" -e "s/@DATE@/${_datestamp}/" \
        -i product.json
}

build() {
    cd "${srcdir}/vscode"

    ./scripts/npm.sh install

    # The default memory limit is too low on some systems. This will set it
    # to 2GB -- change it if this number doesn't work for your system
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
