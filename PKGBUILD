# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: EatMyVenom <eat.my.venomm@gmail.com>
# Contributor: Andrew Gregory <andrew.gregory.8@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=openrc
pkgver=0.62.6
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
provides=('librc.so' 'init-rc' 'libeinfo.so' 'svc-manager')
backup=(etc/openrc/inittab
        etc/openrc/rc.conf
        etc/openrc/conf.d/{bootmisc,consolefont,devfs,dmesg,fsck,hostname,hwclock,keymaps}
        etc/openrc/conf.d/{killprocs,localmount,modules,netmount,network,staticroute,swap})
source=("$url/archive/$pkgver.tar.gz"
        'openrc.logrotate')
b2sums=('6be099ae7a9e22b7c7f6bfdf1576569f657483616879500515063f06da0526d9e79b1b08b0c5c5371b769edb483dfe0122f6b2296ea7d0382fe4bc39ed6bd91b'
        'f283de20b5a07e3c5d21a28b9de72f0a71fd2cc1b70a5567db80373c7144aec0e6ac217eef77acbbb05eff2134c22ee6746b7f248abc4587042c456ed0a32a31')

prepare() {
    cd $pkgname-$pkgver
    # replace system's halt with openrc-halt (the previous won't work on a non-systemd boot)
    sed -ie 's!halt -w!openrc-shutdown -w!g' init.d/bootmisc.in
    # reduce modules verbosity
    sed -it 's!--verbose!!g' init.d/modules.in
    # override VCS_TAG (it fails and we're doing a tar build anyway)
    sed -it 's!vcs_tag(!vcs_tag(\n\tcommand : [ '\'echo\'', '\'$pkgver\'', ],!g' src/shared/meson.build

}

build() {
    cd $pkgname-$pkgver
    # libexecdir and sbindir: overwrite arch-meson defaults
    # sysconfdir: avoid conflicts with other init systems
    arch-meson                       \
        --libexecdir=/usr/libexec/rc \
        --sbindir=/usr/bin           \
        --bindir=/usr/bin            \
        --libdir=/usr/lib            \
        -Dbash-completions=true      \
        -Dbranding='"Arch Linux"'    \
        -Dos=Linux                   \
        -Dpam=true                   \
        -Dpkg_prefix=''              \
        -Dpkgconfig=true             \
        -Dselinux=disabled           \
        -Dsysconfdir=/etc/openrc     \
        -Dzsh-completions=true       \
        build
    meson compile -C build
}

package() {
    cd $pkgname-$pkgver
    meson install -C build --destdir "$pkgdir"

	install -Dm644 "$pkgdir/etc/openrc/pam.d/start-stop-daemon" "$pkgdir/etc/pam.d/start-stop-daemon"
	install -Dm644 "$pkgdir/etc/openrc/pam.d/supervise-daemon" "$pkgdir/etc/pam.d/supervise-daemon"
    # default path to inittab conflicts with initscripts
    # install -Dm644 support/sysvinit/inittab "$pkgdir/etc/inittab"

    # avoid initscripts conflict, requires openrc-sysvinit
    install -Dm644 support/sysvinit/inittab "$pkgdir/etc/openrc/inittab"

    # rotate boot log
    install -Dm0644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
