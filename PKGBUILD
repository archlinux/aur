# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc
pkgver=0.46
pkgrel=1
pkgdesc='Dependency based init system that works with sysvinit and systemd or on its own.'
arch=('i686' 'x86_64')
url='https://github.com/OpenRC/openrc'
license=('BSD')
depends=('pam')
optdepends=('openrc-arch-services-git: collection of services for Arch'
            'net-tools: for network service support'
            'opentmpfiles: adds support for systemd-style tmpfiles.d'
            'bash-completion: tab completion for openrc commands in bash shells'
            'zsh-completions: tab completion for openrc commands in zsh shells')
makedepends=('meson' 'pam' 'psmisc')
provides=('openrc' 'librc.so' 'init-rc' 'libeinfo.so' 'svc-manager')
conflicts=('openrc')
backup=(etc/openrc/inittab
        etc/openrc/rc.conf
        etc/openrc/conf.d/{bootmisc,consolefont,devfs,dmesg,fsck,hostname,hwclock,keymaps}
        etc/openrc/conf.d/{killprocs,localmount,modules,netmount,network,staticroute})
source=("$url/archive/$pkgver.tar.gz"
        'openrc.logrotate')
b2sums=('55490afc179e1e56a58408e8a2b7ebd5376ffee25cb61f2838a47cc97ad1e4eadabcc7f74e5cc2a2d9217917eb42517cf01766de2e82b50a3500bdbe263b0d88'
        'f283de20b5a07e3c5d21a28b9de72f0a71fd2cc1b70a5567db80373c7144aec0e6ac217eef77acbbb05eff2134c22ee6746b7f248abc4587042c456ed0a32a31')

prepare() {
    cd $pkgname-$pkgver
    # inittab does not honor SBINDIR
    sed -ie 's!/sbin/rc!/usr/bin/rc!g' support/sysvinit/inittab
}

build() {
    cd $pkgname-$pkgver
    # libexecdir and sbindir: overwrite arch-meson defaults
    # sysconfdir: avoid conflicts with other init systems
    arch-meson                       \
        --libexecdir=/usr/libexec/rc \
        --sbindir=/usr/bin           \
        -Dbash-completions=true      \
        -Dbranding='"Arch Linux"'    \
        -Dos=Linux                   \
        -Dpam=true                   \
        -Dpkg_prefix=''              \
        -Dpkgconfig=true             \
        -Dselinux=disabled           \
        -Dsysconfdir=/etc/openrc     \
        -Dtermcap=ncurses            \
        -Dzsh-completions=true       \
        build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    meson install -C build --destdir "$pkgdir"

    # default path to inittab conflicts with initscripts
    # install -Dm644 support/sysvinit/inittab "$pkgdir/etc/inittab"

    # avoid initscripts conflict, requires openrc-sysvinit
    install -Dm644 support/sysvinit/inittab "$pkgdir/etc/openrc/inittab"

    # rotate boot log
    install -Dm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
