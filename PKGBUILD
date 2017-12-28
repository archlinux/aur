# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>

pkgname=code
pkgdesc='Microsoft Code -- The Open Source build of Visual Studio Code (vscode)'
pkgver=1.19.1
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Microsoft/vscode'
license=('MIT')
makedepends=('npm' 'nodejs>=6.8.0' 'gulp' 'python2' 'git' 'yarn')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'libxkbfile' 'nss'
         'alsa-lib')
conflicts=('vscode-oss' 'visual-studio-code-oss')
provides=('vscode-oss' 'visual-studio-code-oss')

source=("vscode::git+https://github.com/Microsoft/vscode#tag=${pkgver}"
        "${pkgname}.desktop"
        "startup_script.patch"
        "product_json.patch")
sha256sums=('SKIP'
            'f472fb49852ae9048966f02278110efbbe451192a8ae312ec05d1c31093a0ff4'
            '8b2feded3382e5bf6b5b292c14083bfc536c05cd00f3235dd22b75b67fba134d'
            '7970996eaddbb0265373e71c5452064465472ebb5bd6a393b94e8b84bde24854')

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
    cd "${srcdir}/vscode"

    # This patch no longer contains proprietary modifications.
    # See https://github.com/Microsoft/vscode/issues/31168 for details.
    patch -p1 -i "${srcdir}/product_json.patch"
    local _commit=$(cd "${srcdir}/vscode" && git rev-parse HEAD)
    local _datestamp=$(date -u -Is | sed 's/\+00:00/Z/')
    sed -e "s/@COMMIT@/${_commit}/" -e "s/@DATE@/${_datestamp}/" \
        -i product.json
}

build() {
    cd "${srcdir}/vscode"

    yarn install --arch=${_vscode_arch}

    # The default memory limit may be too low for current versions of node
    # to successfully build vscode.  Uncomment this to set it to 2GB, or
    # change it if this number still doesn't work for your system.
    mem_limit="--max_old_space_size=2048"
    /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-${_vscode_arch}

    # Patch the startup script to know where the app is installed, rather
    # than guessing...
    ( cd "${srcdir}/VSCode-linux-${_vscode_arch}" && \
            patch -p1 -i "${srcdir}/startup_script.patch" )
}

package() {
    install -m 0755 -d "${pkgdir}/usr/share/code-oss"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/usr/share/code-oss"

    # Put the startup script in /usr/bin
    mv "${pkgdir}/usr/share/code-oss/bin" "${pkgdir}/usr"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
