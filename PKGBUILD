# Maintainer: Andy Alt <andy400-dev at yahoo dot com>
# Contributor: gt <AT> notfoss.com
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: Paul Mattal <paul.archlinux.org>

pkgname="dcron"
pkgver="4.5"
pkgrel="9"
pkgdesc="dillon's lightweight cron daemon"
arch=("i686" "x86_64" "armv6h" "armv7h")
license=("GPL")
url="http://www.jimpryor.net/linux/dcron.html"
backup=("var/spool/cron/root" "etc/conf.d/crond")
depends=("bash")
optdepends=("msmtp-mta: sending cron job output via email")
provides=("cron")
conflicts=("cron")
source=("http://www.jimpryor.net/linux/releases/${pkgname}-${pkgver}.tar.gz"
        "service"
        "crontab.c.O_EXCL.diff"
        "dcron.update.during.long.running.jobs.diff"
        "defs.h.TMPDIR.diff"
        "defs.h._DEFAULT_SOURCE.diff")
md5sums=("078833f3281f96944fc30392b1888326"
         "2eefc422db24bf2ac38e3a16292ccdc4"
         "60ccc2d785edcbfaa0b5dcbda5b9ebea"
         "da30bc48e1f88f72bb3de38fe24bef51"
         "de9f7b8831585a871c6b3c3e1a1514c5"
         "54326a7f54633f69cf28def6bba87fce")

build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    # These 4 patches were obtained from Slackware sources at
    # https://mirrors.slackware.com/slackware/slackware64-14.2/source/a/dcron/

    # Define TMPDIR as /var/spool/cron instead of /tmp
    patch --verbose -p1 < ../../defs.h.TMPDIR.diff || exit 1

    # Fix problem where user creates /var/spool/cron/crontabs/<user>.new
    # using 'crontab -', exits with control-c, and then crontab refuses to
    # overwrite the junk file.  It would be better if dcron would wipe
    # the junk file in the event it were not closed correctly, but oh well.
    patch --verbose -p1 < ../../crontab.c.O_EXCL.diff || exit 1

    # Running jobs should not block cron.update:
    patch --verbose -p1 < ../../$CWD/dcron.update.during.long.running.jobs.diff || exit 1

    # Change _BSD_SOURCE to _DEFAULT_SOURCE for recent glibc:
    patch --verbose -p1 < ../../defs.h._DEFAULT_SOURCE.diff || exit 1

    # fix paths to point to /usr/bin
    sed -i 's=/usr/sbin/sendmail=/usr/bin/sendmail=g' defs.h
    sed -i 's=/usr/sbin/run-cron=/usr/bin/run-cron=g' extra/root.crontab

    make \
        PREFIX=/usr \
        SBINDIR=/usr/bin \
        CRONTABS=/var/spool/cron \
        CRONSTAMPS=/var/spool/cronstamps
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    chmod 4711 "$pkgdir"/usr/bin/crontab
    chmod 0751 "$pkgdir"/var/spool/cron
    chmod 0750 "$pkgdir"/var/spool/cron "$pkgdir"/var/spool/cronstamps

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
