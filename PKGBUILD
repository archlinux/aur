# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com> (mailpile-git PKGBUILD)
# Contributor: Frank Fishburn <frankthefishburn@gmail.com> (mailpile-git PKGBUILD)
pkgname='mailpile'
pkgver='1.0.0rc6'
_printcommit='7c1372b999dd6e68710e08e16778f2986c064295'
pkgrel='2'
pkgdesc='A free & open modern, fast email client with user-friendly encryption and privacy features'
arch=('any')
url="http://www.$pkgname.is"
license=('AGPL3')
depends=('gnupg' 'python2' 'python2-appdirs' 'python2-cryptography' 'python2-fasteners' 'python2-icalendar' 'python2-imgsize' 'python2-jinja>=2.6' 'python2-lxml>=2.3.2' 'python2-markupsafe' 'python2-pbr' 'python2-pgpdump' 'python2-pillow' 'python2-pydns' 'python2-socksipychain' 'tor')
optdepends=('pagekite: remote access' 'python2-stem>=1.4: remote access')
makedepends=('python2-setuptools')
install="$pkgname.install"
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/$pkgname/${pkgname^}/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver-$pkgrel-print.tar.gz::https://github.com/$pkgname/${pkgname^}-print/archive/$_printcommit.tar.gz"
	"$pkgname.sysusers"
	"$pkgname.tmpfiles"
	"$pkgname.service"
)
sha256sums=('db4ee7d43b049fe8ffbd99225e9be7c9d66258bb7d30636c3361de1f2a08e0e0'
            'e35ba90ffc3f4f864765f5f8e096cc66a6a62c50e78e95c1696417baa4ea8344'
            '47cad07997afb1e0b7a00d686db111cf819c4b6ffdcd5c174d5b5d1c0966ea13'
            'ddfc114acd7b926aad8ff1e3b0ce31558aef8017458e2c1c98c923ef9d4174ea'
            'e6a49dbf34a36a46b744e07cea39b443954f430835ff988a6938a07331b9726d')

_sourcedirectory="${pkgname^}-$pkgver"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	find . -type f -exec sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2.7|g' {} \;
	find . -type f -exec sed -i 's|#!/usr/bin/python2.7|#!/usr/bin/env python2.7|g' {} \;
	rm -rf 'shared-data/'{mailpile-gui/,multipile/}
	rm -rf 'shared-data/default-theme/'{less/,index.html}
	rm -rf 'mailpile/tests'
	# One of the plugins is a submodule and doesn't get pulled automatically, provide it manually
	mv "$srcdir/${pkgname^}-print-$_printcommit/"* 'shared-data/contrib/print/'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	# The folder structure breaks when we build and install separately for some reason
	python2 setup.py install --root="$pkgdir/"

	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/usr/bin/$pkgname" "$pkgdir/usr/bin/mp"

	install -Dm644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 "../$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "packages/$pkgname.1" "$pkgdir/usr/share/man/man8/$pkgname.8"
}
