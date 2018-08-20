# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Vincenzo Maffione <v.maffione@gmail.com>
pkgname=netmap
pkgver=r3450.4b381787
pkgrel=1
pkgdesc="A framework for high speed network packet I/O, using kernel bypass"
arch=('any')
url="http://info.iet.unipi.it/~luigi/netmap"
license=('BSD')
groups=()
depends=('glibc')
makedepends=('git' 'sed' 'gzip' 'linux-headers' 'pacman' 'xmlto' 'docbook-xsl' 'patch' 'bc' 'asp')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="netmap.install"
source=("netmap.install" "git+https://github.com/luigirizzo/netmap")
noextract=()
md5sums=("62cbf2409535cf25cb4a185d4fa21525" "SKIP")

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    msg "Downloading kernel sources..."
    # Download and prepare kernel sources using asp, checking that the
    # version is the same as the running kernel
    mkdir -p $srcdir/asp
    cd $srcdir/asp
    asp update linux
    asp export linux
    NESTEDDIR="$srcdir/asp/linux"
    cd $NESTEDDIR
    grep "_srcver[ ]*=" PKGBUILD > .ksver
    KSVER=$(sed 's|_srcver[ ]*=[ ]*||g' .ksver | sed 's|\([1-9]\.[0-9]\+\).*|\1|g')
    rm .ksver
    RKVER=$(uname -r | sed 's|\.[^.]*$||')
    if [ "$KSVER" != "$RKVER" ]; then
        msg "Kernel sources version ($KSVER) differs from running kernel version ($RKVER): Cannot continue"
        return 1
    fi
    msg "Building on $KSVER"

    echo "SRCDEST=$SRCDEST"
    echo "SRCPKGDEST=$SRCPKGDEST"
    echo "PKGDEST=$PKGDEST"
    echo "BUILDDIR=$BUILDDIR"
    # We force some makepkg variables, trying to ovverride yaourt default behaviour,
    # which is to download sources in $srcdir/../linux instead of the place where
    # makepkg is invoked
    SRCDEST=$NESTEDDIR SRCPKGDEST=$NESTEDDIR PKGDEST=$NESTEDDIR BUILDDIR=$NESTEDDIR \
                                        makepkg --nobuild --skippgpcheck
    msg "Kernel sources are ready"

    # Build the netmap kernel module and all modified drivers, using the
    # kernel sources downloaded in the previous steps to copy the NIC
    # drivers. Note however that the kernel modules are built against the
    # running kernel, and not against the downloaded sources.
    # We need to use --no-ext-drivers to make sure netmap does not
    # download (Intel) drivers sources from the internet, we want to use the
    # drivers sources provided by the Arch linux package.
    # We also build and install the patched drivers with a "-netmap" suffix,
    # so that they can be modprobed without conflicts/ambiguity with the
    # unpatched drivers
    msg "Starting to build netmap and netmap applications"
    cd "$srcdir/netmap"
    msg "PREFIX=$pkgdir/usr"
    msg "KERNEL-SOURCES=$NESTEDDIR/src/linux-$KSVER"
    msg "INSTALL-MOD-PATH=$pkgdir"
    ./configure --kernel-sources=$NESTEDDIR/src/linux-$KSVER \
                --no-ext-drivers \
                --driver-suffix="_netmap" \
                --install-mod-path="$pkgdir/usr" \
                --prefix="$pkgdir/usr"
    make || return 1
    msg "Build complete"
}

package() {
    cd "$srcdir/netmap"
    # Install netmap module, patched drivers modules, applications, headers
    # and the man page
    make install
    mv "$pkgdir/usr/bin/bridge" "$pkgdir/usr/bin/netmap-bridge"
    mv "$pkgdir/usr/bin/bridge-b" "$pkgdir/usr/bin/netmap-bridge-b"
}

# vim:set ts=2 sw=2 et:
