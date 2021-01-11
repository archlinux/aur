# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Obarun PkgSrc : https://framagit.org/pkg/obcore/util-linux/
#----------------
# Contributor   : Tom Gundersen <teg@jklm.no>
# Contributor   : Dave Reisner <dreisner@archlinux.org>
# Contributor   : judd <jvinet@zeroflux.org>
# Arch PkrSrc   : https://www.archlinux.org/packages/core/x86_64/util-linux/
#---------------------------------------------------------------------------
# Website       : https://www.kernel.org/pub/linux/utils/util-linux/
#---------------------------------------------------------------------------
#--DESCRIPTION--------------------------------------------------------------

pkgname=(util-linux-nosystemd-minimal-git util-linux-libs-nosystemd-minimal-git)

pkgdesc="Miscellaneous system utilities for Linux"

pkgver=2.36.1
pkgrel=1

url='https://www.kernel.org/pub/linux/utils/util-linux'

source=("git+https://github.com/karelzak/util-linux.git"
        'pam-login'
        'pam-common'
        'pam-runuser'
        'pam-su'
        '60-rfkill.rules'
        'util-linux.sysusers'
        '0001-libmount-don-t-use-symfollow-for-helpers-on-user-mounts.patch')

#--BUILD CONFIGURATION------------------------------------------------------

options=(
    'strip')

makedepends=(
    'python'
    'libcap-ng'
    'libxcrypt')

#--BUILD PREPARATION--------------------------------------------------------

pkgver() {
  cd util-linux
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd util-linux

  patch -Np1 < ../0001-libmount-don-t-use-symfollow-for-helpers-on-user-mounts.patch
}

#--BUILD CONTROL------------------------------------------------------------

path=(
    --prefix=/usr
    --libdir=/usr/lib
    --bindir=/usr/bin
    --sbindir=/usr/bin
    --localstatedir=/var
)

flags=(
    --enable-usrdir-path
    --enable-fs-paths-default=/usr/bin:/usr/local/bin
    --enable-raw
    --enable-vipw
    --enable-newgrp
    --enable-chfn-chsh
    --enable-write
    --enable-mesg
    --with-python=3
    --disable-hardlink
    --with-systemdsystemunitdir=no
    --with-systemd=no
    --with-selinux=no
    --with-audit=no
)

#--BUILD--------------------------------------------------------------------

build() {
    cd util-linux

    ./autogen.sh
    ./configure "${path[@]}" "${flags[@]}"
    make
}

#--CHECK--------------------------------------------------------------------


#--PACKAGE------------------------------------------------------------------

package_util-linux-nosystemd-minimal-git() {
    conflicts=('rfkill' 'util-linux')
    provides=('rfkill' 'util-linux')
    replaces=('rfkill')
    depends=(
        'pam'
        'shadow'
        'coreutils'
        'libutil-linux'
        'libeudev'
        'libcap-ng'
        'libxcrypt'
        'libcrypt.so'
        'libmagic.so'
        'libncursesw.so'
        'libreadline.so'
    )
    optdepends=('python: python bindings to libmount'
                'words: default dictionary for look')
    groups=('base' 'base-devel')
    backup=(etc/pam.d/chfn
            etc/pam.d/chsh
            etc/pam.d/login
            etc/pam.d/runuser
            etc/pam.d/runuser-l
            etc/pam.d/su
            etc/pam.d/su-l)

    cd util-linux

    make DESTDIR="$pkgdir" install

    ## setuid chfn and chsh
    chmod 4755 "$pkgdir"/usr/bin/{newgrp,ch{sh,fn}}

    ## install PAM files for login-utils
    install -Dm 0644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chfn"
    install -m 0644 "$srcdir/pam-common" "$pkgdir/etc/pam.d/chsh"
    install -m 0644 "$srcdir/pam-login" "$pkgdir/etc/pam.d/login"
    install -m 0644 "$srcdir/pam-runuser" "$pkgdir/etc/pam.d/runuser"
    install -m 0644 "$srcdir/pam-runuser" "$pkgdir/etc/pam.d/runuser-l"
    install -m 0644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su"
    install -m 0644 "$srcdir/pam-su" "$pkgdir/etc/pam.d/su-l"

    ## adjust for usrmove
    ## TODO(dreisner): fix configure.ac upstream so that this isn't needed
    cd "$pkgdir"
    mv usr/sbin/* usr/bin
    rmdir usr/sbin

    ### runtime libs are shipped as part of util-linux-libs
    rm "$pkgdir"/usr/lib/lib*.{a,so}*

    ### install pacopts applysys
    install -Dm 0644 "$srcdir/util-linux.sysusers" \
      "$pkgdir/usr/lib/sysusers.d/util-linux.conf"

    install -Dm 0644 "$srcdir/60-rfkill.rules" \
      "$pkgdir/usr/lib/udev/rules.d/60-rfkill.rules"
}

package_util-linux-libs-nosystemd-minimal-git() {
    pkgdesc="util-linux runtime libraries"
    provides=('util-linux-libs' 'libutil-linux' 'libblkid.so' 'libfdisk.so' 'libmount.so' 'libsmartcols.so' 'libuuid.so')
    conflicts=('libutil-linux' 'util-linux-libs')
    replaces=('libutil-linux')

    make -C util-linux DESTDIR="$pkgdir" install-usrlib_execLTLIBRARIES
}

#--INSTALL CONFIGURATION----------------------------------------------------

arch=('x86_64')

#--SECURITY AND LICENCE-----------------------------------------------------

license=('GPL2')

#validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
