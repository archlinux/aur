# Maintainer: Otto Sabart <aur@seberm.com>
# Maintainer: Olivier Medoc <o_medoc@yahoo.fr>

# Ref.: https://github.com/QubesOS/qubes-vmm-xen/tree/xen-4.13/archlinux

pkgname=qubes-vm-xen
_gitname=${pkgname%-git*}

# Qubes v4.0
pkgver='4.8.5'
pkgrel=40

# Qubes v4.1
#pkgver='4.14.3'
#pkgrel=5

epoch=
pkgdesc="QubesOS component"
arch=("x86_64")
url="https://github.com/QubesOS/qubes-vmm-xen"
license=('GPL')
groups=()
depends=('python'
         'bridge-utils'
         'libutil-linux'
         'lzo'
         'libsystemd'
         'yajl'
)

# FIXME: The 'python2' is *not* needed for newer Xen (>=4.14 tested).
#        Remove it in the future
makedepends=('wget'
             'make'
             'gcc'
             'patch'
             'git'
             'bin86'
             'dev86'
             'iasl'
             'yajl'
             'pkg-config'
             'openssl'
             'pixman'

             'python2'
)
checkdepends=()
optdepends=()
provides=('xen-qubes-vm-essentials')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
validpgpkeys=('0AF64C3B1F1214B38C8C57861FA2DBE674387CC3'  # Otto Sabart
              '0064428F455451B3EBE78A7F063938BA42CFA724'  # Marek Marczykowski-Górecki
              '427F11FD0FAA4B080123F01CDDFA1A3E36879494'  # Qubes Master Signing Key
)

source=("$_gitname::git+https://github.com/QubesOS/qubes-vmm-xen.git?signed#tag=v${pkgver}-${pkgrel}")
sha512sums=('SKIP')


build() {
    # FIXME: Change this to "python" when moving to newer Xen
    export PYTHON=/usr/bin/python2

    cd "${srcdir}/${_gitname}/"
    make get-sources
    make verify-sources
    tar -xvzf "xen-${pkgver}.tar.gz"

    cd xen-$pkgver
    for p in ../patch-*; do ln -f -s $p; done

    ../apply-patches ../series-vm.conf .

    export XEN_VENDORVERSION="-$pkgrel"
    export OCAML_TOOLS=n
    unset LDFLAGS

    autoreconf --install
    ./configure --prefix=/usr \
                --sbindir=/usr/bin \
                --disable-ocamltools \
                --disable-blktap2

    #make prefix=/usr dist-xen
    make prefix=/usr dist-tools
    #make prefix=/usr dist-docs
}

package() {
    cd "${srcdir}/${_gitname}/"
    cd "xen-${pkgver}"

    export OCAML_TOOLS=n

    # Note: Archlinux removed use of directory such as /sbin /bin /usr/sbin (https://mailman.archlinux.org/pipermail/arch-dev-public/2012-March/022625.html)
    make DESTDIR="$pkgdir" LIBDIR=/usr/lib/ SBINDIR=/usr/bin prefix=/usr install-tools

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
      mkdir -p "licensedir/`dirname $file`"
      install -m 644 "$file" "licensedir/$file"
    done
    ############ all done now ############

    # Remove /var/lock (it is tmpfs in archlinux anyway)
    rm -rf $pkgdir/var/lock
}
