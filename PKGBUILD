# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
_pkgname='mailpile'
pkgname="$_pkgname-git"
pkgver='1.0.0rc1.r719.g1fd5272f'
pkgrel='1'
pkgdesc='A free & open modern, fast email client with user-friendly encryption and privacy features - git version'
arch=('any')
url="http://www.$_pkgname.is"
license=('AGPL3')
depends=('gnupg' 'python2' 'python2-appdirs' 'python2-cryptography' 'python2-fasteners' 'python2-icalendar' 'python2-imgsize' 'python2-jinja>=2.6' 'python2-lxml>=2.3.2' 'python2-markupsafe' 'python2-pbr' 'python2-pgpdump' 'python2-pillow' 'python2-pydns' 'python2-socksipychain' 'tor')
optdepends=('pagekite: remote access' 'python2-stem>=1.4: remote access')
makedepends=('git' 'python2-setuptools')
install="$_pkgname.install"
source=(
	"$pkgname::git+https://github.com/$_pkgname/${_pkgname^}"
	"$_pkgname.sysusers"
	"$_pkgname.tmpfiles"
	"$_pkgname.service"
)
sha256sums=('SKIP'
            '47cad07997afb1e0b7a00d686db111cf819c4b6ffdcd5c174d5b5d1c0966ea13'
            'ddfc114acd7b926aad8ff1e3b0ce31558aef8017458e2c1c98c923ef9d4174ea'
            'e6a49dbf34a36a46b744e07cea39b443954f430835ff988a6938a07331b9726d')

_sourcedirectory="$pkgname"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	git submodule init
	git submodule update
	find . -type f -exec sed -i 's|#!/usr/bin/python|#!/usr/bin/env python2.7|g' {} \;
	find . -type f -exec sed -i 's|#!/usr/bin/python2.7|#!/usr/bin/env python2.7|g' {} \;
	rm -rf 'shared-data/'{"$_pkgname-gui/",'multipile/'}
	rm -rf 'shared-data/default-theme/'{'less/','index.html'}
	rm -rf "$_pkgname/tests"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	# The folder structure breaks when we build and install separately for some reason
	python2 setup.py install --root="$pkgdir/"

	install -dm755 "$pkgdir/usr/bin"
	ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/bin/mp"

	install -Dm644 "../$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm644 "../$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	install -Dm644 "../$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	install -Dm644 "packages/$_pkgname.1" "$pkgdir/usr/share/man/man8/$_pkgname.8"
}
