# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc
pkgver=0.45.2
pkgrel=1
pkgdesc='Dependency based init system that works with sysvinit and systemd or on its own.'
arch=('i686' 'x86_64')
url='https://github.com/OpenRC/openrc'
license=('BSD')
depends=('pam')
optdepends=('openrc-arch-services-git: collection of services for Arch'
            'net-tools: for network service support'
            'opentmpfiles: adds support for systemd-style tmpfiles.d'
            'bash-completion: tab completion for openrc commands in bash shells')
makedepends=('meson' 'pam' 'psmisc')
provides=('openrc' 'librc.so' 'init-rc' 'libeinfo.so' 'svc-manager')
conflicts=('openrc')
backup=(etc/openrc/inittab
        etc/openrc/rc.conf
        etc/openrc/conf.d/{bootmisc,consolefont,devfs,dmesg,fsck,hostname,hwclock,keymaps}
        etc/openrc/conf.d/{killprocs,localmount,modules,netmount,network,staticroute})
source=("$url/archive/$pkgver.tar.gz"
        'openrc.logrotate')
b2sums=('bb7d52b183612eb8924a2d0f9ec63eea88253d8d83964d6341a4715a6cdc372b3fd99ad0f972f4f539da9d741548777dabf4ced86fd20be741a89a69ffe2ff01'
        'f283de20b5a07e3c5d21a28b9de72f0a71fd2cc1b70a5567db80373c7144aec0e6ac217eef77acbbb05eff2134c22ee6746b7f248abc4587042c456ed0a32a31')

prepare() {
    cd $pkgname-$pkgver
    # inittab does not honor SBINDIR
    sed -ie 's!/sbin/rc!/usr/bin/rc!g' support/sysvinit/inittab
}

build() {
    cd $pkgname-$pkgver
    # sysconfdir: avoid conflicts with other init systems
    arch-meson                       \
        --libexecdir=/usr/libexec/rc \
        --sbindir=/usr/bin           \
        -Dbranding='"Arch Linux"'    \
        -Dos=Linux                   \
        -Dpam=true                   \
        -Dpkg_prefix=''              \
        -Dpkgconfig=true             \
        -Dselinux=disabled           \
        -Dsysconfdir=/etc/openrc     \
        -Dtermcap=ncurses            \
        build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    meson install -C build --destdir "$pkgdir"

    # default path to inittab conflicts with initscripts
    # install -Dm644 support/sysvinit/inittab "$pkgdir"/etc/inittab

    # avoid initscripts conflict, requires openrc-sysvinit
    install -Dm644 support/sysvinit/inittab "$pkgdir/etc/openrc/inittab"

    # rotate boot log
    install -Dm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
