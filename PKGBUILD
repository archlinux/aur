# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Francisco Magalhães <franmagneto gmail com>

pkgname=code-git
pkgdesc='Microsoft Code for Linux, Open Source version from git'
pkgver=1.16.0.r4621.g783a0aafad
pkgrel=1
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/Microsoft/vscode'
license=('MIT')
makedepends=('npm' 'nodejs>=6.8.0' 'gulp' 'python2' 'git' 'yarn')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'libxtst' 'libxkbfile' 'nss'
         'alsa-lib')
conflicts=('visual-studio-code-git')
provides=('visual-studio-code-git')

source=("git+https://github.com/Microsoft/vscode"
        "${pkgname}.desktop"
        "startup_script.patch"
        "product_json.patch")
sha256sums=('SKIP'
            '4507d6aac23cc1135feb68c1fcaa8b4b41b42f4806575d38de0f93474a3fb8db'
            '7447807230c09b80529e5cde4a1abfbb687937b16790b77a227ae39ba4c603ce'
            'c402b3bd77530deea42315a9fb0fa4165926ff003179e0ac28b82c3f9acc93b4')

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

pkgver() {
    cd "${srcdir}/vscode"
    git describe --tags --match '?.*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
    install -m 0755 -d "${pkgdir}/usr/share/code-git"
    cp -r "${srcdir}/VSCode-linux-${_vscode_arch}"/* "${pkgdir}/usr/share/code-git"

    # Put the startup script in /usr/bin
    mv "${pkgdir}/usr/share/code-git/bin" "${pkgdir}/usr"

    # Avoid conflicting with the stable OSS build
    mv "${pkgdir}/usr/bin/code-oss" "${pkgdir}/usr/bin/code-git"

    # Add .desktop file
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Install license file
    install -D -m644 "${srcdir}/VSCode-linux-${_vscode_arch}/resources/app/LICENSE.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
