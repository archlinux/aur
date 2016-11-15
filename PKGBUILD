# Maintainer: Michael Hansen <zrax0111 gmail com>

# Set this to 0 if you want to include only the open-source Visual Studio Code
# components.  This will cause the extension manager to work in a local-only
# mode (you'll have to download and install extensions manually).
[[ -z "$VSCODE_NONFREE" ]] && VSCODE_NONFREE=1

pkgname=visual-studio-code-git
pkgdesc='Visual Studio Code for Linux, Open Source version from git'
pkgver=1.1.0.insider.r6983.gd3171a3
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('MIT')
makedepends=('npm' 'nodejs>=6.8.0' 'gulp' 'python2')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'nss' 'alsa-lib')
conflicts=('vscode-oss' 'visual-studio-code-oss')
provides=('vscode-oss' 'visual-studio-code-oss')

source=("git+https://github.com/Microsoft/vscode"
        "${pkgname}.desktop")
sha1sums=('SKIP'
          'a42e461ed586ef0fd31ff911ad662135f4f602aa')

if (( VSCODE_NONFREE )); then
    source+=('product_json.patch')
    sha1sums+=('ba8febe936932080610d899fdb57294fc2f9f614')
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

    if (( VSCODE_NONFREE )); then
        patch -p1 -i "${srcdir}/product_json.patch"
        local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
        local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
        sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
            -i product.json
    fi
}

build() {
    cd "${srcdir}/vscode"

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
