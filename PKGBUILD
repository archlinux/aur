# Maintainer: Phillip Smith <pkgbuild@phs.id.au>
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

pkgname=nsca
pkgver=2.9.2
pkgrel=1
pkgdesc="Integrate passive alerts and checks from remote machines and applications with Nagios. Useful for processing security alerts, as well as redundant and distributed Nagios setups."
arch=('i686' 'x86_64')
replaces=('nagios-nsca')
license=('GPL')
depends=('openssl' 'libmcrypt')
options=(!libtool)
install="$pkgname.install"
backup=('etc/nsca/nsca.cfg' 'etc/nsca/send_nsca.cfg')
url="https://www.nagios.org/"
source=("http://downloads.sourceforge.net/nagios/nsca-$pkgver.tar.gz"
        'nsca.service')
md5sums=('43f638c51367a3170476ed106fbb4858'
         '6f11d8d79c5f1b4d65b82e46ef26f554')

build() {
	cd "$srcdir"/nsca-$pkgver

  # on my system at least, the values set by makepkg.conf for these 2 env vars
  # causes the build to fail. unset them and let the configure script figure
  # out how it would like them.
  unset CFLAGS LDFLAGS

	./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc/nsca \
		--with-nsca-user=nsca \
    --with-nsca-grp=nsca

  # make will fail with parallel jobs, so need to use -j1
	make all
}

package() {
	cd "$srcdir"/nsca-$pkgver

	install -D -m640 sample-config/nsca.cfg "$pkgdir"/etc/nsca/nsca.cfg
	install -D -m640 sample-config/send_nsca.cfg "$pkgdir"/etc/nsca/send_nsca.cfg
	install -D -m755 src/nsca "$pkgdir"/usr/bin/nsca
	install -D -m755 src/send_nsca "$pkgdir"/usr/bin/send_nsca

  # install systemd unit file
  install -D -m755 "$srcdir"/nsca.service "$pkgdir"/usr/lib/systemd/system/nsca.service
}

# vim:set ts=2 sw=2 et:
