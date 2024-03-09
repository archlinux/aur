# Maintainer: ptchinster <AT> gmail <DOT> com
# Contributor:  gt <AT> notfoss.com
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Paul Mattal <paul.archlinux.org>

pkgname="dcron"
pkgver="4.6"
pkgrel="2"
pkgdesc="dillon's lightweight cron daemon"
arch=("i686" "x86_64" "armv6h" "armv7h")
license=("GPL")
url="http://www.jimpryor.net/linux/dcron.html"
backup=("var/spool/cron/root" "etc/conf.d/crond")
depends=("bash")
optdepends=("msmtp-mta: sending cron job output via email")
provides=("cron")
conflicts=("cron")
source=("https://github.com/ptchinster/dcron/archive/refs/tags/v4.6.tar.gz"
        "service")
md5sums=("a2623b7ba605adb9588822e4c573579c"
         "2eefc422db24bf2ac38e3a16292ccdc4")

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # fix paths to point to /usr/bin
    sed -i 's=/usr/sbin/sendmail=/usr/bin/sendmail=g' defs.h
    sed -i 's=/usr/sbin/run-cron=/usr/bin/run-cron=g' extra/root.crontab

    # by default, any member of group "users" can edit their own crontab
    make \
        PREFIX=/usr \
        SBINDIR=/usr/bin \
        CRONTAB_GROUP=users \
        CRONTABS=/var/spool/cron \
        CRONSTAMPS=/var/spool/cronstamps
}

package() {
    if [ ! $(getent group users) ]; then groupadd users; fi ;

    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # install standard configuration and scripts
    install -d -m755 "$pkgdir"/etc/cron.{hourly,daily,weekly,monthly}

    install -D -m755 extra/run-cron "$pkgdir"/usr/bin/run-cron
    install -D -m0600 extra/root.crontab "$pkgdir"/var/spool/cron/root
    install -D -m0644 extra/crond.conf "$pkgdir"/etc/conf.d/crond
    install -D -m644 extra/crontab.vim "$pkgdir"/usr/share/vim/vimfiles/ftplugin/crontab.vim
    sed -i -e 's=/var/spool/cron/cronstamps=/var/spool/cronstamps=' extra/prune-cronstamps
    install -D -m755 extra/prune-cronstamps "$pkgdir"/etc/cron.d/prune-cronstamps
    install -Dm644  "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/dcron.service
}
