# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname=systemd-crontab-generator
pkgver=0.9.0
pkgrel=1
pkgdesc="systemd generator to generate timers/services from crontab and anacrontab files"
url="https://github.com/systemd-cron/systemd-crontab-generator"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python2' 'systemd')
makedepends=('rust')
provides=('cron' 'anacron')
replaces=('cron' 'anacron')
source=('https://github.com/systemd-cron/systemd-crontab-generator/archive/master.zip'
        'systemd-crontab-update'
        'crontab'
        'systemd-crontab-generator.1'
        'crontab.1'
        'crontab.5')
md5sums=('35e308952f6e4f7d80c50d83ba981c2a'
         '6f00710ad710e319b52edef3e98bd010'
         '4ac2cfc8de6dabf2e08f39b3c3557879'
         '15acf6fd2a9533c13ce21c6e03210194'
         'd863925d682395cef72701725f180884'
         'f5e92c03bcb37acd580e2e27f5facc6a')

prepare() {
    RUSTVER=$(rustc --version | awk '{ print $2 }')
    if [[ -n "$RUSTVER" && ("$RUSTVER" < "1.3.0") ]]; then
        error "Rust nightly is required to build this package."
        error "Possible ways to get Rust nightly:"
        error " - AUR package 'rust-nightly-bin',"
        error " - AUR package 'multirust', and then choose"
        error "   nightly channel with 'multirust default nightly' command,"
        error " - from official site: http://www.rust-lang.org/install.html."
        return 1
    fi
}

build() {
    cd "$srcdir/systemd-crontab-generator-master"
    make release
}

package() {
    cd "$srcdir/systemd-crontab-generator-master"
    make install PREFIX="$pkgdir/usr"

    cd "$srcdir/"
    install --mode=0644 -D systemd-crontab-generator.1 ${pkgdir}/usr/share/man/man1/systemd-crontab-generator.1
    gzip ${pkgdir}/usr/share/man/man1/systemd-crontab-generator.1

    install --mode=0644 -D crontab.1 ${pkgdir}/usr/share/man/man1/crontab.1
    gzip ${pkgdir}/usr/share/man/man1/crontab.1

    install --mode=0644 -D crontab.5 ${pkgdir}/usr/share/man/man5/crontab.5
    gzip ${pkgdir}/usr/share/man/man5/crontab.5

    install --mode=0755 -D systemd-crontab-update ${pkgdir}/usr/bin/systemd-crontab-update
    install --mode=0755 -D crontab ${pkgdir}/usr/bin/crontab
}
