# Maintainer: swyter <swyterzone+aur@gmail.com>

# Based on the excellent Gentoo ebuild created by Pacho Ramos <pacho@gentoo.org>
# <https://github.com/gentoo/gentoo-portage-rsync-mirror/blob/master/sys-apps/systemd-readahead/systemd-readahead-216.ebuild>

pkgname=systemd-readahead
pkgver=216
pkgrel=1
epoch=
pkgdesc="Standalone version of the fast built-in readahead implementation dropped in systemd 217"
arch=('i686' 'x86_64')
url="https://dev.gentoo.org/~pacho/systemd-readahead.html"
license=('LGPL-2.1 MIT')
depends=("systemd>$pkgver")
makedepends=('make' 'autoconf' 'gperf' 'sed')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
install=systemd-readahead.install
source=("http://www.freedesktop.org/software/systemd/systemd-$pkgver.tar.xz")
md5sums=('04fda588a04f549da0f397dce3ae6a39')

prepare()
{
    cd "systemd-$pkgver"

    # systemd-notify no longer supports readahead playing
    sed -i -e 's:ExecStart=@SYSTEMD_NOTIFY@ --readahead=done:ExecStart=/bin/touch /run/systemd/readahead/done:' \
                units/systemd-readahead-done.service.in || die
}

build()
{
    cd "systemd-$pkgver"

    ./configure --enable-readahead --prefix=/usr                                                \
                --disable-maintainer-mode                                                       \
                --localstatedir=/var                                                            \
                --enable-split-usr                                                              \
                                                                                                \
                --libexecdir=/usr/lib                                                           \
                --localstatedir=/var                                                            \
                --sysconfdir=/etc                                                               \
                                                                                                \
                --with-rootprefix=/usr                                                          \
                --with-rootlibdir=/usr/lib                                                      \
                --with-sysvinit-path=                                                           \
                --with-sysvrcnd-path=                                                           \
                --disable-efi                                                                   \
                --disable-ima                                                                   \
                --disable-acl                                                                   \
                --disable-apparmor                                                              \
                --disable-audit                                                                 \
                --disable-libcryptsetup                                                         \
                --disable-libcurl                                                               \
                --disable-gtk-doc                                                               \
                --disable-elfutils                                                              \
                --disable-gcrypt                                                                \
                --disable-gudev                                                                 \
                --disable-microhttpd                                                            \
                --disable-gnutls                                                                \
                --disable-libidn                                                                \
                --disable-introspection                                                         \
                --disable-kdbus                                                                 \
                --disable-kmod                                                                  \
                --disable-lz4                                                                   \
                --disable-xz                                                                    \
                --disable-pam                                                                   \
                --disable-polkit                                                                \
                --without-python                                                                \
                --disable-python-devel                                                          \
                --disable-qrencode                                                              \
                --disable-seccomp                                                               \
                --disable-selinux                                                               \
                --disable-tests                                                                 \
                --disable-dbus                                                                  \
                --disable-smack                                                                 \
                --disable-blkid                                                                 \
                --disable-multi-seat-x                                                          \
                --disable-myhostname                                                            \
                                                                                                \
                --disable-backlight                                                             \
                --disable-binfmt                                                                \
                --disable-bootchart                                                             \
                --disable-coredump                                                              \
                --disable-firstboot                                                             \
                --disable-hostnamed                                                             \
                --disable-localed                                                               \
                --disable-logind                                                                \
                --disable-machined                                                              \
                --disable-networkd                                                              \
                --disable-quotacheck                                                            \
                --disable-randomseed                                                            \
                --disable-resolved                                                              \
                --disable-rfkill                                                                \
                --disable-sysusers                                                              \
                --disable-timedated                                                             \
                --disable-timesyncd                                                             \
                --disable-tmpfiles                                                              \
                --disable-vconsole                                                              \
                                                                                                \
                --disable-chkconfig                                                             \
                                                                                                \
                --with-dbuspolicydir=/etc/dbus-1/system.d                                       \
                --with-dbussessionservicedir=/usr/share/dbus-1/services                         \
                --with-dbussystemservicedir=/usr/share/dbus-1/system-services                   \
                --with-dbusinterfacedir=/usr/share/dbus-1/interfaces

    echo 'BUILT_SOURCES: $(BUILT_SOURCES)' > ./Makefile.extra
    make -f Makefile -f ./Makefile.extra BUILT_SOURCES

    make systemd-readahead
    make units/systemd-readahead-{drop,collect,replay,done}.service units/systemd-readahead-done.timer
    make man/{sd-readahead.3,sd_readahead.3,systemd-readahead-replay.service.8}
}

package()
{
    cd "systemd-$pkgver"

    # Install main app
    install -Dm 755 "systemd-readahead" "$pkgdir/usr/lib/systemd/systemd-readahead"

    # Install unit files
    install -Dm 644 "units/systemd-readahead-drop.service" "$pkgdir/usr/lib/systemd/system/systemd-readahead-drop.service"
    install -Dm 644 "units/systemd-readahead-collect.service" "$pkgdir/usr/lib/systemd/system/systemd-readahead-collect.service"
    install -Dm 644 "units/systemd-readahead-replay.service" "$pkgdir/usr/lib/systemd/system/systemd-readahead-replay.service"
    install -Dm 644 "units/systemd-readahead-done.service" "$pkgdir/usr/lib/systemd/system/systemd-readahead-done.service"
    install -Dm 644 "units/systemd-readahead-done.timer" "$pkgdir/usr/lib/systemd/system/systemd-readahead-done.timer"

    # Install manpages and aliases
    install -Dm 644 "man/systemd-readahead-collect.service.8" "$pkgdir/usr/share/man/man8/systemd-readahead-collect.service.8"
    install -Dm 644 "man/systemd-readahead-done.service.8"    "$pkgdir/usr/share/man/man8/systemd-readahead-done.service.8"
    install -Dm 644 "man/systemd-readahead-done.timer.8"      "$pkgdir/usr/share/man/man8/systemd-readahead-done.timer.8"
    install -Dm 644 "man/systemd-readahead-replay.service.8"  "$pkgdir/usr/share/man/man8/systemd-readahead-replay.service.8"
    install -Dm 644 "man/systemd-readahead.8"                 "$pkgdir/usr/share/man/man8/systemd-readahead.8"
}
