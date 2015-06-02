# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=sysusage
pkgver=5.4
pkgrel=2
pkgdesc="Monitor your systems informations and generate periodical graph reports using rrdtool. All reports are shown throught a web interface."
arch=('any')
url="http://sysusage.darold.net/"
license=('GPL3')
depends=('inetutils' 'rrdtool' 'sysstat' 'perl' 'perl-proc-queue' 'procps-ng')
backup=('etc/sysusage.cfg')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c664de8983bc86ec7f0c09831974e6b6')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  
  perl Makefile.PL \
    BINDIR=/usr/bin \
    CONFDIR=/etc \
    PIDDIR=/var/run \
    BASEDIR=/var/lib/$pkgname \
    HTMLDIR=/srv/http/$pkgname \
    MANDIR=/usr/share/man/man1 \
    DOCDIR=/usr/share/doc/$pkgname

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  
	install -dm755 "$pkgdir"/var/lib/sysusage
  
  install -Dm644 Sar.pm "$pkgdir"/usr/share/perl5/vendor_perl/SysUsage/Sar.pm
  install -Dm644 sysusage.cfg "$pkgdir"/etc/sysusage.cfg
  install -Dm755 bin/sysusage "$pkgdir"/usr/bin/sysusage
  install -Dm755 bin/sysusagegraph "$pkgdir"/usr/bin/sysusagegraph
  install -Dm755 bin/sysusagewarn "$pkgdir"/usr/bin/sysusagewarn
  install -Dm644 resources/sysusage-logo.png "$pkgdir"/srv/http/sysusage/sysusage-logo.png
  install -Dm644 resources/sysusage.css "$pkgdir"/srv/http/sysusage/sysusage.css
  install -Dm644 resources/sysusage.js "$pkgdir"/srv/http/sysusage/sysusage.js
  install -Dm644 resources/sysusage_arrow.png "$pkgdir"/srv/http/sysusage/sysusage_arrow.png
  install -Dm644 resources/favicon.ico "$pkgdir"/srv/http/sysusage/favicon.ico
  install -Dm644 doc/sysusage.1 "$pkgdir"/usr/share/man/man1/sysusage.1
  install -Dm644 README "$pkgdir"/usr/share/doc/sysusage/README
  install -Dm644 ChangeLog "$pkgdir"/usr/share/doc/sysusage/ChangeLog
  install -Dm755 plugins/plugin-sample1.pl "$pkgdir"/usr/share/doc/sysusage/plugins/plugin-sample1.pl
  install -Dm755 plugins/plugin-sample2.pl "$pkgdir"/usr/share/doc/sysusage/plugins/plugin-sample2.pl

  # install sysusagejqgraph as per request from @cerb
  install -Dm755 bin/sysusagejqgraph "$pkgdir"/usr/bin/sysusagejqgraph
  tar xzf resources/jqplot-sysusage.tar.gz --directory "$pkgdir"/srv/http/sysusage
}

# vim:set ts=2 sw=2 et:
