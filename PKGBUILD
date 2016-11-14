# Maintainer:  Andrew Gregory <andrew.gregory.8@gmail.com>
# Co-maintainer Lone_Wolf <lonewolf.xs4all.nl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc
pkgver=0.22.3
pkgrel=1
pkgdesc='Dependency based init system that works with sysvinit.'
arch=('i686' 'x86_64')
url='https://github.com/OpenRC/openrc/'
license=('BSD')
depends=('openrc-sysvinit' 'pam' 'sh')
optdepends=('openrc-arch-services-git: collection of services for Arch'
            'net-tools: for network service support')
backup=(etc/openrc/inittab
        etc/openrc/rc.conf
        etc/openrc/conf.d/{bootmisc,consolefont,devfs,dmesg,fsck,hostname,hwclock,keymaps}
        etc/openrc/conf.d/{killprocs,localmount,modules,netmount,network,staticroute}
        etc/openrc/conf.d/{tmpfiles,urandom})
source=($pkgname-$pkgver::https://github.com/OpenRC/$pkgname/archive/$pkgver.tar.gz
        $pkgname.logrotate)
# oldsourcelocation : http://dev.gentoo.org/~williamh/dist/$pkgname-$pkgver.tar.bz2
sha512sums=('1eadb02c4c5cb3c6d210cfd1f3a10ba60c08041ba32b199fe9f8aa5edb7363a5b066ddce2a2dec9cd39e070c499d0a9ae0ac9eb1e0ecda854d5095b1b791f94d'
            '690612fddfb2c4cf8f6b5ba7239b9faf29eb3d9b152ab4dcf62694aa2852780440d08cee56d98a9597607f446b3697c911269562821a8402bb5747cbbae34bd9')

_makeargs=(BRANDING='Arch Linux')
_makeargs+=(MKPAM=pam)
_makeargs+=(MKSELINUX=no)
_makeargs+=(MKTERMCAP=ncurses)
_makeargs+=(PKG_PREFIX="")
_makeargs+=(LIBDIR=/usr/lib)
_makeargs+=(LIBMODE=0644) # enable binary stripping by makepkg
_makeargs+=(SHLIBDIR=/usr/lib)
_makeargs+=(LIBEXECDIR=/usr/lib/openrc)
_makeargs+=(BINDIR=/usr/bin)
_makeargs+=(SBINDIR=/usr/bin)
_makeargs+=(SYSCONFDIR=/etc/openrc) # avoid conflict with initscripts

build() {

    cd "${pkgname}-${pkgver}"
    make "${_makeargs[@]}"
}

package() {

    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" "${_makeargs[@]}" install

    # default path to inittab conflicts with initscripts
    #install -m 644 support/sysvinit/inittab "$pkgdir"/etc/inittab

    # avoid initscripts conflict, requires openrc-sysvinit
    install -m 644 support/sysvinit/inittab "${pkgdir}/etc/openrc/inittab"

    # rotate boot log
    install -Dm0644 "${srcdir}/${pkgname}.logrotate" "${pkgdir}/etc/logrotate.d/${pkgname}"
    
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${srcdir}/${pkgname}-${pkgver}/AUTHORS" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
