# Maintainer: Michael Hansen <zrax0111 gmail com>

# Set this to 0 if you want to include only the open-source Visual Studio Code
# components.  This will cause the extension manager to work in a local-only
# mode (you'll have to download and install extensions manually).
[[ -z "$VSCODE_NONFREE" ]] && VSCODE_NONFREE=1

pkgname=visual-studio-code-oss
pkgdesc='Visual Studio Code for Linux, Open Source version'
pkgver=1.7.1
pkgrel=2
_commit=02611b40b24c9df2726ad8b33f5ef5f67ac30b44
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'nodejs>=6.8.0' 'gulp' 'python2' 'git')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'nss' 'alsa-lib')
conflicts=('vscode-oss')
provides=('vscode-oss')

source=("${pkgver}-${pkgrel}.tar.gz::https://github.com/Microsoft/vscode/archive/${_commit}.tar.gz"
        "${pkgname}.desktop")
sha1sums=('27868bbab5ecb5313daf419b4fcba81c1d4ad1dc'
          '1f08aa48cfa0ec57114ad906db48a35e59e077be')

if (( VSCODE_NONFREE )); then
    source+=('product_json.patch')
    sha1sums+=('ba8febe936932080610d899fdb57294fc2f9f614')
    install='visual-studio-code-oss.nonfree.install'
    license+=('proprietary')
fi

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

    if (( VSCODE_NONFREE )); then
        patch -p1 -i "${srcdir}/product_json.patch"
        _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
        sed -e "s/@COMMIT@/$_commit/" -e "s/@DATE@/$_datestamp/" \
            -i product.json
    fi
}

build() {
    cd "${srcdir}/vscode-${_commit}"

    ./scripts/npm.sh install --arch=${_vscode_arch}

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
    ln -s '/opt/VSCode-OSS/bin/code-oss' "${pkgdir}/usr/bin/${pkgname}"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
