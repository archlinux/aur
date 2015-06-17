# Maintainer: notfoss <AT> gmx.com
# Contributor: Jim Pryor <profjim@jimpryor.net>

pkgname="dcron-git"
pkgver="4.5.r7.gbccc0e8"
pkgrel="3"
pkgdesc="dillon's lightweight cron daemon (Git version)."
arch=("any")
license=("GPL")
url="http://www.jimpryor.net/linux/dcron.html"
backup=("var/spool/cron/root" "etc/conf.d/crond")
depends=("bash")
makedepends=("git")
optdepends=("msmtp-mta: sending cron job output via email")
provides=("cron")
conflicts=("cron")
source=("$pkgname"::"git+https://github.com/dubiousjim/dcron.git"
        "service")
md5sums=("SKIP"
        "2eefc422db24bf2ac38e3a16292ccdc4")

pkgver() {
    cd "$pkgname"
    # tag + number of commits since that + SHA-1 (first 7 characters) of the last commit
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"

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
    cd "$pkgname"
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
