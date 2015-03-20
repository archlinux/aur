# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Based on an older PKGBUILD by: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# quick update check: https://git.wikimedia.org/log/pywikibot%2Fcore/refs%2Fheads%2Fmaster

pkgname=('python2-pywikibot-git')
pkgver=4362.bd2b9b0
pkgrel=1
pkgdesc="Python library that interfaces with the MediaWiki API"
arch=('any')
url="https://www.mediawiki.org/wiki/Manual:Pywikibot"
license=('MIT')
makedepends=('python2-setuptools' 'git')
depends=('python2-httplib2')
install=install
source=("${pkgname}::git+https://gerrit.wikimedia.org/r/p/pywikibot/core.git" 'user-config.py')
md5sums=('SKIP' 'f31497751cf290f94c32ada53ffbbf075baf8e205e4313cae1ffc7ba1337eb7e68388cc3fab8c6916b2c4d6252966d9894eb6e13389973a710b663c5c4e48eca')

pkgver() {
	 cd "${srcdir}/${pkgname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/${pkgname}"
	 python2 setup.py build
}

package() {
	 cd "${srcdir}/${pkgname}"
	 export PYTHONPATH="${pkgdir}/usr/lib/python2.7/site-packages"
	 mkdir -p "$PYTHONPATH"
	 python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 </dev/null

	 # did the above PYTHONPATH hack cause these?
	 rm -rf "$pkgdir"/usr/lib/python2.7/site-packages/{easy-install.pth,site.py*}

	 install -D -m644 {${srcdir},${pkgdir}/usr/share/pywikibot}/user-config.py
}
