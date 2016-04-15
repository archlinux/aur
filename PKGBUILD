# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=visual-studio-code-git
pkgdesc='Visual Studio Code for Linux, Open Source version from git'
pkgver=0.10.12.insiders.r585.g92abb80
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
          'ffe64521128379790749d7e61ba1eeeb7e732dec')

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
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/vscode"

    local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
    patch -p1 -i "${srcdir}/product_json.patch"
    sed "s/@commit@/${_commit}/g" -i product.json
}

build() {
    cd "${srcdir}/vscode"

    ./scripts/npm.sh install
    gulp vscode-linux-${_vscode_arch}
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
