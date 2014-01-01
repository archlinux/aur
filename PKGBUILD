# Based on an older PKGBUILD by: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# quick update check: https://git.wikimedia.org/log/pywikibot%2Fcore/refs%2Fheads%2Fmaster

pkgname=('python2-pywikibot-git')
pkgver=2477.98b0588
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

package() {
	 cd "${srcdir}/${pkgname}"
	 export PYTHONPATH="${pkgdir}/usr/lib/python2.7/site-packages"
	 mkdir -p "$PYTHONPATH"
	 python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 </dev/null

	 # did the above PYTHONPATH hack cause these?
#	 rm -rf "$pkgdir"/usr/lib/python2.7/site-packages/{easy-install.pth,site.py*}

	 install -D -m644 {${srcdir},${pkgdir}/usr/share/pywikibot}/user-config.py
}
