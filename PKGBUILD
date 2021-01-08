# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor:  Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc
pkgver=0.42.1
pkgrel=2
pkgdesc='Dependency based init system that works with sysvinit and systemd.'
arch=('i686' 'x86_64')
url='https://github.com/OpenRC/openrc/'
license=('BSD')
depends=('pam')
optdepends=('openrc-sysvinit'
            'openrc-arch-services-git: collection of services for Arch'
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
        etc/openrc/conf.d/keymaps
	etc/openrc/conf.d/hostname
	etc/openrc/conf.d/udev
	)
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenRC/$pkgname/archive/$pkgver.tar.gz"
        'openrc.logrotate'
	"gcc-10-fix.patch::https://github.com/OpenRC/$pkgname/commit/375ef42393f3dc6edbaa2cb70c79b2366072db38.patch"
	)
sha512sums=('579b9bfbb151b945a364a2c12b037d2e15991820ca99a07ac18e9bdc50074e67fbf0dcf9865aa4deabe2bf82092e4623be51c9e0b4014384951e0a92ac1e7646'
            '690612fddfb2c4cf8f6b5ba7239b9faf29eb3d9b152ab4dcf62694aa2852780440d08cee56d98a9597607f446b3697c911269562821a8402bb5747cbbae34bd9'
            '1757d895a17f1390caf9db36a74a91b4c127fb8333ea3557b352c2049abc3dbbce6f0ce1413daa594bf7107d6afe15bfe90dbaa021aae64a26b9bc089df08f37')

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

    patch -Np 1 -i ../gcc-10-fix.patch
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
