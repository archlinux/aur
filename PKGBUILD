# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Johannes Löthberg <johannes@kyriasis.com> (spambayes PKGBUILD)
# Contributor: Felix Yan <felixonmars@archlinux.org> (spambayes PKGBUILD)
_pkgname='spambayes'
pkgname="$_pkgname-git"
pkgver='1.1b3.r2798.1335ca8'
pkgrel='1'
pkgdesc='Bayesian anti-spam classifier written in Python - git version'
arch=('any')
url="https://github.com/smontanaro/$_pkgname"
license=('PSF')
depends=('python2' 'python2-lockfile' 'python2-pydns')
makedepends=('python2-setuptools' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
_debianpatchprefix='https://salsa.debian.org/python-team/applications/spambayes/-/raw'
source=(
	"$pkgname::git+$url"
	"$pkgname-lockfile.patch::$_debianpatchprefix/da17fe0edd86a4d1b70df82a2f33b22c69c18c5a/debian/patches/lockfile.patch"
	"$pkgname-gnus_fix.patch::$_debianpatchprefix/2fd800b2bac0e78cd4866e70962ab72334fdfd7f/debian/patches/gnus_fix.patch"
	"$pkgname-paths_fix.patch::$_debianpatchprefix/f68f1f6df897af5d2f0ea36db34a0ff59f152f4f/debian/patches/paths_fix.patch"
	"$pkgname-fix-imports-from-sb_server.patch::$_debianpatchprefix/da6655f931a97ae7da0be27a2754501b18a18d54/debian/patches/fix-imports-from-sb_server.patch"
)
sha256sums=('SKIP'
            '3c1d336c3ae4392efa5cfdf24a336e8f3d10d98b8aa543007cb71412fae8ae1a'
            '153f92409bc880fc6e7def4cf7ace494b871c06c08b6130f17de66d500736619'
            'f6754159cfd0c2e2807f8075334ee94069d937375a32ab1711de16efa0e8a37b'
            '31d57a5bd902759d2876097b8d19363ec250a20d2ff9127a5f8c34e72bd9ddc1')

_sourcedirectory="$pkgname/spambayes"

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "$srcdir/$pkgname-lockfile.patch"
	patch --forward -p1 < "$srcdir/$pkgname-gnus_fix.patch"
	patch --forward -p1 < "$srcdir/$pkgname-paths_fix.patch"
	patch --forward -p1 < "$srcdir/$pkgname-fix-imports-from-sb_server.patch"
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	printf '%s.r%s.%s' "$(sed -nE 's/__version__ = "([^"]*)"/\1/p' "$_pkgname/__init__.py")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir"
	rename '.py' '' "$pkgdir/usr/bin/"*
}
