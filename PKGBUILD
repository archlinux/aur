# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>

pkgname=qubes-vm-xen
pkgver='4.8.5'
pkgrel=14
epoch=
pkgdesc="QubesOS component"
arch=("x86_64")
url="http://qubes-os.org/"
license=('GPL')
groups=()
depends=('python2' 'bridge-utils' 'python2-lxml' 'libutil-linux' 'lzo' 'libsystemd' 'yajl')
makedepends=('wget' 'make' 'gcc' 'patch' 'git' 'bin86' 'dev86' 'iasl' 'yajl' 'pkg-config' 'openssl' 'pixman')
checkdepends=()
optdepends=()
provides=('xen-qubes-vm-essentials')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=

source=("https://github.com/QubesOS/qubes-vmm-xen/archive/v${pkgver}-${pkgrel}.tar.gz" )
noextract=()
sha512sums=('f151d45ccccf0298285a43de26cbd043f32e6f90728d7c16a40c1ffce56bcdb68d9b6494f30ccb4f28b5e6da2da1a880af9d34b4225c8cae9b221b33e1001eae')


build() {
    export PYTHON=/usr/bin/python2

    cd "${srcdir}/qubes-vmm-xen-${pkgver}-${pkgrel}"
    make get-sources
    make verify-sources
    tar -xvzf "xen-${pkgver}.tar.gz"

    cd xen-$pkgver
    for p in ../patch-*; do ln -f -s $p; done

    ../apply-patches ../series-vm.conf .

    export XEN_VENDORVERSION="-$pkgrel"
    export OCAML_TOOLS=n
    export PYTHON=/usr/bin/python2
    unset LDFLAGS

    autoreconf
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --disable-ocamltools \
                --disable-blktap2

    #make prefix=/usr dist-xen
    make prefix=/usr dist-tools
    #make prefix=/usr dist-docs
}

package() {
    cd "${srcdir}/qubes-vmm-xen-${pkgver}-${pkgrel}"
    cd xen-$pkgver

    export OCAML_TOOLS=n
    export PYTHON=python2

    # Note: Archlinux removed use of directory such as /sbin /bin /usr/sbin (https://mailman.archlinux.org/pipermail/arch-dev-public/2012-March/022625.html)
    make DESTDIR=$pkgdir LIBDIR=/usr/lib/ SBINDIR=/usr/bin prefix=/usr install-tools

    # Remove unwated stuff

    # stubdom: newlib
    rm -rf $pkgdir/usr/*-xen-elf

    # hypervisor symlinks
    rm -rf $pkgdir/boot/

    # silly doc dir fun
    rm -rf $pkgdir/usr/share/doc/xen
    rm -rf $pkgdir/usr/share/doc/qemu

    # Pointless helper
    rm -f $pkgdir/usr/bin/xen-python-path

    # qemu stuff (unused or available from upstream)
    rm -rf $pkgdir/usr/share/xen/man

    # README's not intended for end users
    rm -rf $pkgdir/etc/xen/README*

    # standard gnu info files (removed by packaging post actions anyway)
    rm -rf $pkgdir/usr/info

    # adhere to Static Library Packaging Guidelines
    rm -rf $pkgdir/usr/lib/*.a

    # not used in Qubes VM
    rm -f $pkgdir/usr/bin/xenstored
    rm -f $pkgdir/usr/share/xen/create.dtd
    rm -rf $pkgdir/etc/sysconfig
    rm -rf $pkgdir/etc/rc.d/init.d

    rm -r "$pkgdir/var/run"

    ############ fixup files in /etc ############
    # udev
    rm -f $pkgdir/etc/udev/rules.d/xend.rules

    # config file only used for hotplug, Fedora uses udev instead
    rm -f $pkgdir/etc/sysconfig/xend

    ############ assemble license files ############
    mkdir licensedir
    # avoid licensedir to avoid recursion, also stubdom/ioemu and dist
    # which are copies of files elsewhere
    find . -path licensedir -prune -o -path stubdom/ioemu -prune -o \
      -path dist -prune -o -name COPYING -o -name LICENSE | while read file; do
      mkdir -p licensedir/`dirname $file`
      install -m 644 $file licensedir/$file
    done
    ############ all done now ############

    # Remove /var/lock (it is tmpfs in archlinux anyway)
    rm -rf $pkgdir/var/lock
}
