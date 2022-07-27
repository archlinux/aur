# Maintainer: ninni <soelder@hotmail.com>
pkgname=exilence-next-git
pkgver=1.1.7.r38.g91d273e6
pkgrel=1
pkgdesc='Desktop application that helps you summarize your wealth in Path of Exile'
arch=('x86_64')
url='https://github.com/viktorgullmark/exilence-next'
license=('CC BY-NC 3.0')
makedepends=('git' 'npm' 'nvm')
depends=('fuse2' 'fuse-common')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=('Exilence-Next.desktop' 'git+https://github.com/NINNiT/exilence-next.git#branch=fix/labels-linux' )
md5sums=('SKIP' 'SKIP')

_ensure_local_nvm() {
    # let's be sure we are starting clean
    which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
    export NVM_DIR="${srcdir}/.nvm"

    # The init script returns 3 if version specified
    # in ./.nvrc is not (yet) installed in $NVM_DIR
    # but nvm itself still gets loaded ok
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

pkgver() {
    cd "${srcdir}/exilence-next"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
    _ensure_local_nvm
    nvm install 16
}

build() {
    cd "${srcdir}/exilence-next/ExilenceNextApp"
    _ensure_local_nvm
    npm install
    npm run smoke-build-linux
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    cp ${srcdir}/exilence-next/ExilenceNextApp/dist/*.AppImage ${pkgdir}/usr/bin/exilence-next
    cp ${srcdir}/exilence-next/ExilenceNextApp/build/icon.ico ${pkgdir}/usr/share/pixmaps/exilence.ico
    cp ${srcdir}/Exilence-Next.desktop ${pkgdir}/usr/share/applications/Exilence-Next.desktop
}

post_install() {
    update-mime-database
    update-desktop-database
}

post_upgrade() {
    post_install "$1"
}

post_remove() {
    post_install "$1"
}
