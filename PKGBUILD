# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>

# Set this to 0 if you want to include only the open-source Visual Studio Code
# components.  This will cause the extension manager to work in a local-only
# mode (you'll have to download and install extensions manually).
[[ -z "$VSCODE_NONFREE" ]] && VSCODE_NONFREE=1

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=1.9.1
pkgrel=1
_commit=f9d0c687ff2ea7aabd85fb9a43129117c0ecf519
arch=('i686' 'x86_64' 'armv7h')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'nodejs>=6.8.0' 'gulp' 'python2' 'git')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'nss' 'alsa-lib')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("${pkgver}-${pkgrel}.tar.gz::https://github.com/Microsoft/vscode/archive/${_commit}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('d0df0c454642077319f3487ae49fa9c9333fc301e705f13178bd074a66c53d85'
            '2ce2c6033667092c5e854036b676533fd433e9daf9ac8ce0f00606193420e72d')

if (( VSCODE_NONFREE )); then
    source+=('product_json.patch')
    sha256sums+=('e90f9d69bd42c0d9fc5f081d3bf7ca307df53e3553efadf00d62ced66b1bb070')
    install="${pkgname}.nonfree.install"
    license+=('proprietary')
fi

case "$CARCH" in
    i686)
        _vscode_arch=ia32
        ;;
    x86_64)
        _vscode_arch=x64
        ;;
    armv7h)
        _vscode_arch=arm
        ;;
    *)
        # Needed for mksrcinfo
        _vscode_arch=DUMMY
        ;;
esac

prepare() {
    cd "${srcdir}/vscode-${_commit}"

    if (( VSCODE_NONFREE )); then
        patch -p1 -i "${srcdir}/product_json.patch"
        _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
        sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
            -i product.json
    fi
}

build() {
    cd "${srcdir}/vscode-${_commit}"

    ./scripts/npm.sh install --arch=${_vscode_arch}

    # The default memory limit may be too low for current versions of node
    # to successfully build vscode.  Uncomment this to set it to 2GB, or
    # change it if this number still doesn't work for your system.
    #mem_limit="--max_ols_space_size=2048"
    node $mem_limit /usr/bin/gulp vscode-linux-${_vscode_arch}
}

package() {
    install -m 0755 -d "${pkgdir}/opt/VSCode-OSS"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/opt/VSCode-OSS"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    ln -s '/opt/VSCode-OSS/bin/code-oss' "${pkgdir}/usr/bin/${pkgname}"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
