# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor:  Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc
pkgver=0.43
pkgrel=2
pkgdesc='Dependency based init system that works with sysvinit and systemd or on its own.'
arch=('i686' 'x86_64')
url='https://github.com/OpenRC/openrc/'
license=('BSD')
depends=('pam')
optdepends=('openrc-arch-services-git: collection of services for Arch'
            'net-tools: for network service support'
            'opentmpfiles: adds support for systemd-style tmpfiles.d'
            'bash-completion: tab completion for openrc commands in bash shells')
makedepends=('psmisc' 'pam' 'git')
provides=('openrc' 'librc.so' 'init-rc' 'libeinfo.so' 'svc-manager')
conflicts=('openrc')
backup=(etc/openrc/inittab
        etc/openrc/rc.conf
        etc/openrc/conf.d/{bootmisc,consolefont,devfs,dmesg,fsck,hostname,hwclock,keymaps}
        etc/openrc/conf.d/{killprocs,localmount,modules,netmount,network,staticroute}
	etc/openrc/conf.d/udev
	)
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenRC/$pkgname/archive/$pkgver.tar.gz"
        'openrc.logrotate'
	)
sha512sums=('6c26f170892612a3621b6893af31ba8e2245d276f4d042adafa845bae081393a2eaf10e865f112db39034b06104bc3e4ff98ec19b63470e22fa28ba9ec4f1a49'
            '690612fddfb2c4cf8f6b5ba7239b9faf29eb3d9b152ab4dcf62694aa2852780440d08cee56d98a9597607f446b3697c911269562821a8402bb5747cbbae34bd9')

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
_makeargs+=(SYSCONFDIR=/etc/openrc) # avoid conflicts with other init systems

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's:0444:6444:' mk/sys.mk

    # inittab does not honor SBINDIR
    sed -ie 's!/sbin/rc!/usr/bin/rc!g' support/sysvinit/inittab
}

build() {
    cd "${pkgname}-${pkgver}"
    make "${_makeargs[@]}"
}

package() {

    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" "${_makeargs[@]}" install

    # default path to inittab conflicts with initscripts
    #install -m 644 support/sysvinit/inittab "$pkgdir"/etc/inittab

    # avoid initscripts conflict, requires openrc-sysvinit
    install -m 644 support/sysvinit/inittab "${pkgdir}/etc/openrc/inittab"

    # rotate boot log
    install -Dm0644 "${srcdir}/${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
    
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${srcdir}/${pkgname}-${pkgver}/AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
