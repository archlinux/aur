#
# sd-boot:
# Arch Linux PKGBUILD 
# This builds the latest release tag.
#
# Maintainer: Gene C <arch@sapience.com>
# Contributor: 
# 
pkgname='sd-boot'
pkgdesc='Tools to install linux kernels via kernel-install from systemd'
_gitname='sd-boot'

pkgver="4.3.0"
pkgrel=1
url="https://github.com/gene-git/sd-boot"

arch=(any)
license=(GPL-2.0-or-later)

#install='sd-boot.install'

# To build docs uncommont sphinx/texlive
depends=(
    bash
    dracut
    efifs
    rsync
    systemd
    glibc
)
optdepends=(
    'edk2-shell: efi-shell (installed into EFI partition'
    # 'memtest86_64-git: memtest (installed into EFI partition'   # TBD in AUR
)

makedepends=(
    git
    gcc
    cmake
    ninja
)

# clang provides clang-tidy (static source code analysis)
checkdepends=(
    cppcheck
    clang
    valgrind
)

backup=(
    etc/sd-boot/config
    etc/sd-boot/kernel.packages
    etc/sd-boot/efi-tool.packages
    etc/sd-boot/edk2-shell.image
    etc/sd-boot/memtest86_64-git.image
    etc/kernel/install.conf
    etc/kernel/ukify.conf
    etc/dracut.conf.d/010-dracut.conf
)

#
# Verifying Signed Tag
#   Add arch@sapience.com key to keyring then use the source line with "?signed"
#   Key available via keys/pgp, WKD or dowload from https://www.sapience.com/tech
#   Note that upstream release procedure requires every tagged release have new tag
#
validpgpkeys=( '7CCA1BA66669F3273DB52678E5B81343AB9809E1')   # Gene C <arch@sapience.com>

#source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}?signed")
source=("git+https://github.com/gene-git/${_gitname}#tag=${pkgver}")
sha512sums=('SKIP')

changelog="Changelog"

build() {
    cd "${_gitname}"
    echo "***"
    echo "Building:" 
    echo "***"
    cd ./src
    /usr/bin/cmake -G Ninja -B build
    cd ./build
    /usr/bin/cmake -S .. -B none -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
    /usr/bin/cmake --build none
}

check() {
    cd "${_gitname}/src/"
    echo "***"
    echo "Running test suite:"
    echo "***"
    ./tests/scripts/run-test-suite
}

package() {
    cd "${_gitname}"
    echo "***"
    echo "Installing:"
    echo "***"
    cd src/build
    DESTDIR="$pkgdir" cmake --install none
    # dont need the static lib in production
    /usr/bin/rm -f "$pkgdir"/usr/lib/libsd_boot.a
}
# vim:set ts=4 sts=4 sw=4 et:

