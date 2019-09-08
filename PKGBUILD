# Maintainer: robertfoster

pkgname='pyload-git'
pkgver=v0.4.9.r4782.gd686d625b
pkgrel=1
pkgdesc="Downloadtool for One-Click-Hoster written in python. Latest stable branch"
url="https://github.com/pyload/pyload"
license=('GPL')
arch=('any')
provides=('pyload')
conflicts=('pyload' 'pyload-hg')
backup=('var/lib/pyload/pyload.conf')
depends=('python' 'python-cheroot' 'python-cryptography' 'python-flask' 'python-flask-babel' 'python-filetype' 'python-flask-themes2' 'python-pycurl' 'python-requests-html' 'python-semver')
makedepends=('python-setuptools' 'python-babel' 'python-jinja2')
optdepends=('python-beautifulsoup4: for web scraping'
	'python-colorlog: for colored log output'
	'python-pycryptodomex: for low-level crypto routines'
	'python-pillow: Captcha resolver'
	'python-pyopenssl: ssl support'
	'python-pyxmmp2: notify on xmpp'
	'python-send2trash: trash support'
)
makedepends=('git')
install='pyload-git.install'

source=("$pkgname::git+https://github.com/pyload/pyload.git"
'pyload.service' 'pyload.conf' 'pyLoadCore' 'pyLoadCli' 'pyLoadGui')

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

	# Temporary fix for some not found resources
	cp -r src/pyload/core/config $pkgdir/usr/lib/python3.7/site-packages/pyload/core
	cp -r src/pyload/core/network/xdcc $pkgdir/usr/lib/python3.7/site-packages/pyload/core/network
	cp -r src/pyload/locale $pkgdir/usr/lib/python3.7/site-packages/pyload/

	# Create PyLoad service
	install -D -m 644 ${srcdir}/pyload.service ${pkgdir}/usr/lib/systemd/system/pyload.service
	install -D -m 644 ${srcdir}/pyload.conf ${pkgdir}/var/lib/pyload/pyload.conf
}

md5sums=('SKIP'
	'454e974b11ab31533423f336c3a182f2'
	'32b00d50be868c165930c592b99730a9'
	'6d764666ec89ce218cd00164e73e0989'
	'6fc2f343d2f324a66745524bbab93e5c'
'806a22a74e8331dffcb8538182e4df2c')
