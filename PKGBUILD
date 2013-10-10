# Based on an older PKGBUILD by: Baptiste Jonglez <baptiste--aur at jonglez dot org>

pkgname=('python2-pywikibot-git')
pkgver=2178.36435bb
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=('any')
url="https://www.mediawiki.org/wiki/Manual:Pywikibot"
license=('MIT')
makedepends=('python2-setuptools' 'git')
depends=('python2-httplib2')
install=install
source=("${pkgname}::git+https://gerrit.wikimedia.org/r/p/pywikibot/core.git" 'user-config.py')
md5sums=('SKIP' '0f7c5edb33017b4bbea2f80f13fe4843')

pkgver() {
	 cd "${srcdir}/${pkgname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

prepare() {
	 # upstream horror #1: global install script forces interactive setup to create per-user config file
	 # we excise this code and just provide a default config for user to copy
	 sed -i '/generate_user_files.py/Id' "${srcdir}/${pkgname}/setup.py"
}

package() {
	 cd "${srcdir}/${pkgname}"
	 python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1

	 # upstream horror #2: installing itself in:
	 #  /usr/lib/python2.7/site-packages/tests
	 #  /usr/lib/python2.7/site-packages/scripts
	 # This is mindblowingly stupid and prone to break something else.
	 rm -rf $pkgdir/usr/lib/python2.7/site-packages/tests

	 install -D -m644 {${srcdir},${pkgdir}/usr/share/pywikibot}/user-config.py
}
