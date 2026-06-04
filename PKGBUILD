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

pkgver="5.6.0"
pkgrel=1
url="https://github.com/gene-git/sd-boot"

arch=(x86_64)
license=(GPL-2.0-or-later)

depends=(
    dracut
    efifs
    glibc
    libyaml
    rsync
    systemd
    sbctl
    systemd
    systemd-ukify
    util-linux-libs     # provides libblkid
)
optdepends=(
    'edk2-shell: efi-shell (installed into EFI partition'
    # 'memtest86_64-git: memtest (installed into EFI partition'   # TBD in AUR
)

makedepends=(
    gcc
    git
    meson
)

# clang provides clang-tidy (static source code analysis)
# linux/edk2-shell are used to test installing a kernel/efi tool
checkdepends=(
    clang
    cppcheck
    valgrind
    linux
    edk2-shell
)

backup=(
    etc/sd-boot/config
    etc/sd-boot/config.yaml
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
    cd "${_gitname}/src"
    echo "***"
    echo "Building:" 
    echo "***"

    #
    # Compile flags are in meson.build - options like C23 are required.
    #
    /usr/bin/rm -rf build/*
    export PATH="/usr/bin"
    export CFLAGS=""
    export LDFLAGS=""

    /usr/bin/meson setup \
            --prefix=/usr \
            --sysconfdir=/etc \
            --localstatedir=/var \
            --buildtype=plain \
            --reconfigure build/release \
            --buildtype=release \
            -Ddefault_library=shared

    /usr/bin/meson compile -C build/release
}

check() {
    cd "${_gitname}/src/"
    echo "***"
    echo "Running test suite:"
    echo "***"

    echo ""
    echo "-----------------------------"
    echo " Standard:"
    echo "------------"
    echo ""
    /usr/bin/meson test -C build/release --setup=standard

    # echo ""
    # echo "-----------------------------"
    # echo " Valgrind:"
    # echo "------------"
    # echo ""
    # /usr/bin/meson test -C build/release --setup=valgrind
}

package() {
    cd "${_gitname}/src"
    echo "***"
    echo "Installing:"
    echo "***"

    /usr/bin/meson install -C build/release --destdir "$pkgdir" > /dev/null
}
# vim:set ts=4 sts=4 sw=4 et:

