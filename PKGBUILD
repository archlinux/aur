pkgname=('ncid' 'ncid-client' 'ncid-tools' 'ncid-extensions' 'ncid-module-alert' 'ncid-module-initmodem' 'ncid-module-skel')
pkgbase=ncid
pkgver=1.10.1
pkgrel=1
pkgdesc="Network caller ID."
arch=('x86_64')
url="http://ncid.sourceforge.net/"
license=('GPL3')
depends=('libpcap' 'pcre')
makedepends=('libnotify' 'perl')
optdepends=()
provides=()
conflicts=()
backup=()
options=()
install=
changelog=
source=("https://downloads.sourceforge.net/project/ncid/ncid/$pkgver/$pkgbase-$pkgver-src.tar.gz" "ncidd_pause.patch")
md5sums=('659937bb876b666e6a486809272a3324' '57da2c9ee2bd6eac8e3ba3aac82e1bb9')

build() {
	cd "$srcdir"
        patch -p0 < ncidd_pause.patch
	cd "$srcdir/$pkgbase"
	make package
}

package_ncid() {
	pkgdesc="Network caller ID server."
	backup=('etc/ncid/ncidd.alias'
                'etc/ncid/ncidd.blacklist'
                'etc/ncid/ncidd.conf'
                'etc/ncid/ncidd.whitelist')
        depends=('bash>=4.3.046')

        mkdir -p "$pkgdir/etc/ncid/conf.d"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/lib/systemd/system"
        mkdir -p "$pkgdir/usr/share/doc/ncid"
        mkdir -p "$pkgdir/usr/share/man/man5"
        mkdir -p "$pkgdir/usr/share/man/man8"
        mkdir -p "$pkgdir/usr/share/ncid/modules"

        cp -a "$srcdir/$pkgbase/doc/images" "$pkgdir/usr/share/doc/ncid/"

        install -m 755 "$srcdir/$pkgbase/server/ncidd" "$pkgdir/usr/bin"
        install -m 644 "$srcdir/$pkgbase/server/ncidd.alias" "$pkgdir/etc/ncid"
        install -m 644 "$srcdir/$pkgbase/server/ncidd.blacklist" "$pkgdir/etc/ncid"
        install -m 644 "$srcdir/$pkgbase/server/ncidd.conf" "$pkgdir/etc/ncid"
        install -m 644 "$srcdir/$pkgbase/server/ncidd.whitelist" "$pkgdir/etc/ncid"

        install -m 644 "$srcdir/$pkgbase/man/ncidd.8" "$pkgdir/usr/share/man/man8"
        install -m 644 "$srcdir/$pkgbase/man/ncidd.alias.5" "$pkgdir/usr/share/man/man5"
        install -m 644 "$srcdir/$pkgbase/man/ncidd.blacklist.5" "$pkgdir/usr/share/man/man5"
        install -m 644 "$srcdir/$pkgbase/man/ncidd.conf.5" "$pkgdir/usr/share/man/man5"
        install -m 644 "$srcdir/$pkgbase/man/ncidd.whitelist.5" "$pkgdir/usr/share/man/man5"

        install -m 644 "$srcdir/$pkgbase/systemd/ncidd.service" "$pkgdir/usr/lib/systemd/system"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid"
        install -m 644 "$srcdir/$pkgbase/doc/NCID-API.md" "$pkgdir/usr/share/doc/ncid"
        install -m 644 "$srcdir/$pkgbase/doc/NCID-SDK.md" "$pkgdir/usr/share/doc/ncid"
        install -m 644 "$srcdir/$pkgbase/doc/NCID-UserManual.md" "$pkgdir/usr/share/doc/ncid"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid"
        install -m 644 "$srcdir/$pkgbase/logrotate/README.logrotate" "$pkgdir/usr/share/doc/ncid"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid"

        install -m 644 "$srcdir/$pkgbase/doc/ReleaseNotes.md" "$pkgdir/usr/share/doc/ncid"

	cd "$srcdir/$pkgbase"
	make install-logrotate install-record prefix="$pkgdir/usr" prefix2="$pkgdir"
}

package_ncid-client() {
	pkgdesc="Network caller ID client."
	arch=('any')
        depends=('bash>=4.3.046')
        backup=('etc/ncid/ncid.conf')

        mkdir -p "$pkgdir/etc/ncid/conf.d"
        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/doc/ncid-client"
        mkdir -p "$pkgdir/usr/share/man/man1"
        mkdir -p "$pkgdir/usr/share/man/man5"
        mkdir -p "$pkgdir/usr/share/man/man7"
        mkdir -p "$pkgdir/usr/share/ncid/modules"
        mkdir -p "$pkgdir/usr/share/pixmaps/ncid"

        install -m 755 "$srcdir/$pkgbase/client/ncid" "$pkgdir/usr/bin"
        install -m 644 "$srcdir/$pkgbase/client/ncid.conf" "$pkgdir/etc/ncid"
        install -m 644 "$srcdir/$pkgbase/client/ncid.gif" "$pkgdir/usr/share/pixmaps/ncid"

        install -m 644 "$srcdir/$pkgbase/man/ncid.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/ncid.conf.5" "$pkgdir/usr/share/man/man5"
        install -m 644 "$srcdir/$pkgbase/man/ncid_modules.7" "$pkgdir/usr/share/man/man7"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid-client"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid-client"
        install -m 644 "$srcdir/$pkgbase/client/README.client" "$pkgdir/usr/share/doc/ncid-client"
        install -m 644 "$srcdir/$pkgbase/modules/README.modules" "$pkgdir/usr/share/doc/ncid-client"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid-client"
        install -m 644 "$srcdir/$pkgbase/doc/Verbose.md" "$pkgdir/usr/share/doc/ncid-client"
}

package_ncid-tools() {
	pkgdesc="Network caller ID tools."
	arch=('any')
        depends=('perl>=5.24.0')

        mkdir -p "$pkgdir/usr/bin"
        mkdir -p "$pkgdir/usr/share/doc/ncid-tools"
        mkdir -p "$pkgdir/usr/share/man/man1"
        mkdir -p "$pkgdir/usr/share/man/man7"

        install -m 755 "$srcdir/$pkgbase/tools/cidalias" "$pkgdir/usr/bin"
        install -m 755 "$srcdir/$pkgbase/tools/cidcall" "$pkgdir/usr/bin"
        install -m 755 "$srcdir/$pkgbase/tools/cidupdate" "$pkgdir/usr/bin"
        install -m 755 "$srcdir/$pkgbase/tools/ncidutil" "$pkgdir/usr/bin"
        install -m 755 "$srcdir/$pkgbase/tools/wct" "$pkgdir/usr/bin"

        install -m 644 "$srcdir/$pkgbase/man/cidalias.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/cidcall.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/cidupdate.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/ncidutil.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/wct.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/ncid_tools.7" "$pkgdir/usr/share/man/man7"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid-tools"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid-tools"
        install -m 644 "$srcdir/$pkgbase/tools/README.tools" "$pkgdir/usr/share/doc/ncid-tools"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid-tools"
}

package_ncid-extensions() {
	pkgdesc="Network caller ID extensions."
	arch=('any')
        depends=('bash>=4.3.046')

        mkdir -p "$pkgdir/usr/share/doc/ncid-extensions"
        mkdir -p "$pkgdir/usr/share/man/man1"

        install -m 644 "$srcdir/$pkgbase/man/hangup-message-skel.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/man/hangup-skel.1" "$pkgdir/usr/share/man/man1"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid-extensions"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid-extensions"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid-extensions"

	cd "$srcdir/$pkgbase"
	make install-extensions prefix="$pkgdir/usr" prefix2="$pkgdir"
}

package_ncid-module-alert() {
	pkgdesc="Network caller ID alert module."
        depends=('libnotify>=0.7.6' 'bash>=4.3.046')
        backup=('etc/ncid/conf.d/ncid-alert.conf')
	arch=('any')

        mkdir -p "$pkgdir/etc/ncid/conf.d"
        mkdir -p "$pkgdir/usr/share/doc/ncid-module-alert"
        mkdir -p "$pkgdir/usr/share/man/man1"
        mkdir -p "$pkgdir/usr/share/ncid/modules"

        install -m 755 "$srcdir/$pkgbase/modules/ncid-alert" "$pkgdir/usr/share/ncid/modules"
        install -m 644 "$srcdir/$pkgbase/modules/ncid-alert.conf" "$pkgdir/etc/ncid/conf.d"
        install -m 644 "$srcdir/$pkgbase/man/ncid-alert.1" "$pkgdir/usr/share/man/man1"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid-module-alert"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid-module-alert"
        install -m 644 "$srcdir/$pkgbase/modules/README.modules" "$pkgdir/usr/share/doc/ncid-module-alert"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid-module-alert"
}

package_ncid-module-initmodem() {
	pkgdesc="Network caller ID initmodem module."
	arch=('any')
        depends=('bash>=4.3.046')

        mkdir -p "$pkgdir/usr/lib/systemd/system"
        mkdir -p "$pkgdir/usr/share/doc/ncid-module-initmodem"
        mkdir -p "$pkgdir/usr/share/man/man1"
        mkdir -p "$pkgdir/usr/share/ncid/modules"

        install -m 755 "$srcdir/$pkgbase/modules/ncid-initmodem" "$pkgdir/usr/share/ncid/modules"
        install -m 644 "$srcdir/$pkgbase/man/ncid-initmodem.1" "$pkgdir/usr/share/man/man1"
        install -m 644 "$srcdir/$pkgbase/systemd/ncid-initmodem.service" "$pkgdir/usr/lib/systemd/system"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid-module-initmodem"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid-module-initmodem"
        install -m 644 "$srcdir/$pkgbase/modules/README.modules" "$pkgdir/usr/share/doc/ncid-module-initmodem"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid-module-initmodem"
}

package_ncid-module-skel() {
	pkgdesc="Network caller ID skel module."
	arch=('any')
        backup=('etc/ncid/conf.d/ncid-skel.conf')
        depends=('bash>=4.3.046')

        mkdir -p "$pkgdir/etc/ncid/conf.d"
        mkdir -p "$pkgdir/usr/share/doc/ncid-module-skel"
        mkdir -p "$pkgdir/usr/share/man/man1"
        mkdir -p "$pkgdir/usr/share/ncid/modules"

        install -m 755 "$srcdir/$pkgbase/modules/ncid-skel" "$pkgdir/usr/share/ncid/modules"
        install -m 644 "$srcdir/$pkgbase/modules/ncid-skel.conf" "$pkgdir/etc/ncid/conf.d"
        install -m 644 "$srcdir/$pkgbase/man/ncid-skel.1" "$pkgdir/usr/share/man/man1"

        install -m 644 "$srcdir/$pkgbase/doc/GPL.md" "$pkgdir/usr/share/doc/ncid-module-skel"
        install -m 644 "$srcdir/$pkgbase/README" "$pkgdir/usr/share/doc/ncid-module-skel"
        install -m 644 "$srcdir/$pkgbase/modules/README.modules" "$pkgdir/usr/share/doc/ncid-module-skel"
        install -m 644 "$srcdir/$pkgbase/VERSION" "$pkgdir/usr/share/doc/ncid-module-skel"
}
