# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname='spambayes'
pkgver='1.1b3.20180713'
_commit='1335ca87c5e62b11b9d1678eb7c58000d3cf5d31'
pkgrel='2'
pkgdesc='Bayesian anti-spam classifier written in Python'
arch=('any')
url="https://github.com/smontanaro/$pkgname"
license=('PSF')
depends=('python2' 'python2-lockfile' 'python2-pydns')
makedepends=('python2-setuptools')
_debianpatchprefix='https://salsa.debian.org/python-team/applications/spambayes/-/raw'
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$_commit.tar.gz"
	"$pkgname-$pkgver-$pkgrel-lockfile.patch::$_debianpatchprefix/da17fe0edd86a4d1b70df82a2f33b22c69c18c5a/debian/patches/lockfile.patch"
	"$pkgname-$pkgver-$pkgrel-gnus_fix.patch::$_debianpatchprefix/2fd800b2bac0e78cd4866e70962ab72334fdfd7f/debian/patches/gnus_fix.patch"
	"$pkgname-$pkgver-$pkgrel-paths_fix.patch::$_debianpatchprefix/f68f1f6df897af5d2f0ea36db34a0ff59f152f4f/debian/patches/paths_fix.patch"
	"$pkgname-$pkgver-$pkgrel-fix-imports-from-sb_server.patch::$_debianpatchprefix/da6655f931a97ae7da0be27a2754501b18a18d54/debian/patches/fix-imports-from-sb_server.patch"
)
sha256sums=('68d4e6b36d67dcfdc8a6dc8a9aae2c56ef8fb96efa6b0a128c4c79191bd45dba'
            '3c1d336c3ae4392efa5cfdf24a336e8f3d10d98b8aa543007cb71412fae8ae1a'
            '153f92409bc880fc6e7def4cf7ace494b871c06c08b6130f17de66d500736619'
            'f6754159cfd0c2e2807f8075334ee94069d937375a32ab1711de16efa0e8a37b'
            '31d57a5bd902759d2876097b8d19363ec250a20d2ff9127a5f8c34e72bd9ddc1')

_sourcedirectory="$pkgname-$_commit/spambayes"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-lockfile.patch"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-gnus_fix.patch"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-paths_fix.patch"
	patch --forward -p1 < "$srcdir/$pkgname-$pkgver-$pkgrel-fix-imports-from-sb_server.patch"

	find . -type f -exec sed -i -E 's|#!( )?/usr/bin/env python$|#!/usr/bin/env python2.7|g' {} \;
	find . -type f -exec sed -i -E 's|#!( )?/usr/local/bin/python$|#!/usr/bin/env python2.7|g' {} \;
}

package() {
	cd "$srcdir/$_sourcedirectory"
	python2 setup.py install --root="$pkgdir"
	rename '.py' '' "$pkgdir/usr/bin/"*
}
