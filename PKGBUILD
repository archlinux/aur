# Maintainer:  Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc-git
pkgver=0.17.2.ga36a635
pkgrel=1
pkgdesc='Dependency based init system that works with sysvinit.'
arch=('i686' 'x86_64')
url='http://www.gentoo.org/proj/en/base/openrc/'
license=('BSD')
depends=('openrc-sysvinit' 'pam' 'sh')
optdepends=('openrc-arch-services-git: collection of services for Arch'
            'net-tools: for network service support')
makedepends=('git')
provides=('openrc')
conflicts=('openrc')
backup=(etc/openrc/inittab
        etc/openrc/rc.conf
        etc/openrc/conf.d/{bootmisc,consolefont,dmesg,fsck,hostname,hwclock,keymaps}
        etc/openrc/conf.d/{killprocs,localmount,modules,netmount,network,staticroute}
        etc/openrc/conf.d/{tmpfiles,urandom})
source=('git://github.com/OpenRC/openrc.git')
source+=('openrc.logrotate')
md5sums=('SKIP'
         'ede356beae529d1b16b769c9da70ad52')

_makeargs=(BRANDING='Arch Linux')
_makeargs+=(MKPAM=pam)
_makeargs+=(MKSELINUX=no)
_makeargs+=(MKTERMCAP=ncurses)
_makeargs+=(PKG_PREFIX="")
_makeargs+=(LIBDIR=/usr/lib)
_makeargs+=(SHLIBDIR=/usr/lib)
_makeargs+=(LIBEXECDIR=/usr/libexec/rc)
_makeargs+=(BINDIR=/usr/bin)
_makeargs+=(SBINDIR=/usr/bin)
_makeargs+=(SYSCONFDIR=/etc/openrc) # avoid conflict with initscripts

pkgver() {
    cd "$srcdir/openrc"
    git describe | sed 's/^openrc-//;s/-/./g'
}

prepare() {
    cd "$srcdir/openrc"

    # inittab does not honor SBINDIR
    sed -ie 's!/sbin/rc!/usr/bin/rc!g' support/sysvinit/inittab
}

build() {
    cd "$srcdir/openrc"
    make "${_makeargs[@]}"
}

package() {
    cd "$srcdir/openrc"

    make DESTDIR="$pkgdir" "${_makeargs[@]}" install

    # default path to inittab conflicts with initscripts
    # openrc-sysvinit not needed
    #install -m 644 support/sysvinit/inittab "$pkgdir"/etc/inittab

    # avoid initscripts conflict, requires openrc-sysvinit
    install -m 644 support/sysvinit/inittab "$pkgdir/etc/openrc/inittab"

    # rotate boot log
    install -Dm0644 "$srcdir/openrc.logrotate" "$pkgdir/etc/logrotate.d/openrc"
}
