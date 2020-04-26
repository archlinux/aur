# Maintainer: robertfoster

pkgname=pyload-nightly
pkgver=v0.4.9.r4783.g0fb966418
pkgrel=1
pkgdesc="Downloadtool for One-Click-Hoster written in python. Latest devel branch"
url="https://github.com/pyload/pyload"
license=('GPL')
arch=('any')
provides=('pyload')
conflicts=('pyload' 'pyload-hg')
backup=('var/lib/pyload/pyload.conf')
depends=('python' 'python-cheroot' 'python-cryptography' 'python-flask' 'python-flask-babel' 'python-filetype' 'python-flask-themes2' 'python-pycurl' 'python-requests-html' 'python-semver')
makedepends=('git' 'python-jinja' 'python-setuptools')
#install='pyload-git.install'

source=("$pkgname::git+https://github.com/pyload/pyload.git"
'pyload.service')

prepare() {
	cd $srcdir/$pkgname
	sed -i "s/6.5/8.3/g" setup.cfg
}

pkgver() {
	cd $srcdir/$pkgname
	git describe --long --tags| sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$pkgname
	python setup.py build
	python setup.py build_locale
}

package() {
	cd ${srcdir}/$pkgname
	python setup.py install --root=$pkgdir --install-data locale

	#Temporary fix for some not found resources
	cp -r src/pyload/core/config $pkgdir/usr/lib/python3.8/site-packages/pyload/core
	cp -r src/pyload/core/network/xdcc $pkgdir/usr/lib/python3.8/site-packages/pyload/core/network
	cp -r src/pyload/locale $pkgdir/usr/lib/python3.8/site-packages/pyload/

	# Create PyLoad service
	install -D -m 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
}

md5sums=('SKIP'
         '75069bddcec3ee630d2abea02ffef0b4')
