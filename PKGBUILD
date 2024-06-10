# Maintainer: Fabian Posch <aur@posch.tech>

pkgname=act-core-git
_basever=0
_patchlvl=1
_gitversion=r1866.3b3d028
pkgver=${_basever}.${_patchlvl}.${_gitversion}
pkgrel=2
pkgdesc="ACT core provides the core library for the ACT AVLSI toolflow."
arch=('x86_64')
url="https://github.com/asyncvlsi/act"
license=('GPL-2.0')
depends=('libedit' 'zlib')
optdepends=()
makedepends=('git' 'gcc' 'patch' 'sed' 'make' 'm4')
conflicts=('act-core')
provides=('act-core')
source=(
    "git+${url}"
    "${pkgname}.csh"
    "${pkgname}.sh"
    "install-scripts.patch"
    "script-makefile.patch"
    "standard-makefile.patch"
)
sha512sums=(
    "SKIP"
    "2a8efc3439ba260009f2a0040630e033a6a49d6718775da574a926bc540adc19bbc4e14dcfa5c0d04dcaeb2c4c3bd7c496d353f0e21e758923df29353b27582e"
    "d3b3826b1e2126f9e12760d9046da7cd19b8f20e94e40e4229b82df3a36f8d7392c09feb3b473ca603cdac214d6b97f6b2d6cd667b8b11e5cf5b661f0bf94640"
    "49663486b1d8098da390f53f731d654f7711af1329e0b21a7a34658864278b6671c2f234320c56132a5cfedd42a6152f5a1ad502f068a767a95049476aa44af0"
    "e2c949e7e7ef6a3053b406db61c975f3b77e7bef203dc858edabcc6eff8c1a1c47df7d5747f55973ac5a0ed6b5ff512aef87490b979c5cbcd13305d0a23348e0"
    "b63ddb198a5b967a1b1eb1801a20b021257424975ea98a738feb2d0e6020a43e5f551591b4257863100bc885a9034c4e3e713758bf29a38a690a9a57efe94949"
)

pkgver() {
    cd act
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # the scripts install script uses ACT_HOME instead of INSTALLDIR as the installation location
    # we need to fix this
    patch "${srcdir}/act/scripts/install-scripts" < "install-scripts.patch"
    patch "${srcdir}/act/scripts/Makefile" < "script-makefile.patch"
}

package() {
    # install the scripts to set the correct env variables
    install -Dm755 "${pkgname}.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
    install -Dm755 "${pkgname}.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"
    install -Dm644 "${srcdir}/act/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # we need to build in fakeroot since ACT does not separate
    # build and install very cleanly
    export VLSI_TOOLS_SRC=${srcdir}/act

    install -d "${pkgdir}/opt/act-async"
    export ACT_HOME="/opt/act-async"

    # build the package
    cd act/
    ./configure "${pkgdir}/opt/act-async"
    ./build
    make install

    # Since reconfiguring includes creating the folders which we can't do,
    # only change the installation location.
    # In addition, for other packages to be able to build to other places than
    # /opt/act-async, we make the assignment conditional.
    sed -i 's/INSTALLDIR=.*/INSTALLDIR=\/opt\/act-async/' "${pkgdir}/opt/act-async/scripts/config"

    export ACT_HOME="${pkgdir}/opt/act-async"
    make runtest

    # to separate libraries and build location better for packaging, inject install location override
    patch "${pkgdir}/opt/act-async/scripts/Makefile.std" < "${srcdir}/standard-makefile.patch"
}