# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>

pkgname=code
pkgdesc='Microsoft Code -- The Open Source build of Visual Studio Code (vscode)'
pkgver=1.24.0
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Microsoft/vscode'
license=('MIT')
makedepends=('npm' 'nodejs-lts-carbon' 'gulp' 'python2' 'git' 'yarn')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'libxkbfile' 'nss'
         'alsa-lib')
conflicts=('vscode-oss' 'visual-studio-code-oss')
provides=('vscode-oss' 'visual-studio-code-oss')

source=("vscode::git+https://github.com/Microsoft/vscode#tag=${pkgver}"
        "${pkgname}.desktop"
        "startup_script.patch"
        "product_json.patch"
        "code-liveshare.patch")
sha256sums=('SKIP'
            'cd10a8532c0722298098cd9657df4ef05fcfe952e5be41f2294f50bb562a23dc'
            '8b2feded3382e5bf6b5b292c14083bfc536c05cd00f3235dd22b75b67fba134d'
            '055bd73b72d7289dfc3834f2e7b2359d8c5ffea6f2fd266df7bad96bb6a7f3f6'
            '90b8915d8195546088e845f3205fb965e941561d309c8b462bb0b22a159e041c')

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

    # See https://github.com/MicrosoftDocs/live-share/issues/262 for details
    patch -p1 -i "${srcdir}/code-liveshare.patch"
}

build() {
    cd "${srcdir}/vscode"

    yarn install --arch=${_vscode_arch}

    # The default memory limit may be too low for current versions of node
    # to successfully build vscode.  Uncomment this to set it to 2GB, or
    # change it if this number still doesn't work for your system.
    mem_limit="--max_old_space_size=2048"

    if ! /usr/bin/node $mem_limit /usr/bin/gulp vscode-linux-${_vscode_arch}-min
    then
        echo
        echo "*** NOTE: If the build failed due to running out of file handles (EMFILE),"
        echo "*** you will need to raise your max open file limit."
        echo "*** This can be done by:"
        echo "*** 1) Set a higher 'nofile' limit (at least 10000) in either"
        echo "***    /etc/systemd/system.conf.d/limits.conf (for systemd systems)"
        echo "***    /etc/security/limits.conf (for non-systemd systems)"
        echo "*** 2) Reboot (or log out and back in)"
        echo "*** 3) Run 'ulimit -n' and ensure the value set above is shown before"
        echo "***    re-attempting to build this package."
        echo
        exit 1
    fi

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
