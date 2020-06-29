# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Stephen Martin <stephenSRMMartin at gmail dot com>

pkgname=jamovi-git
_pkgname=jamovi
pkgver=r1277.7744a02
pkgrel=1
pkgdesc="Open Source Software to bridge the gap between researcher and statistician (Git)"
arch=('any')
url="https://www.jamovi.org/"
license=('GPL')
depends=('electron' 'python' 'python-protobuf' 'python-tornado' 'python-nanomsg' 'python-yaml' 'boost-libs' 'python-chardet' 'python-scipy' 'r-rinside' 'gcc6-libs') #gcc6 libs added for libgfortran.so.3
optdepends=("jamovi-rbundle: R backend for various analyses")
makedepends=('boost' 'npm' 'cython' 'git' 'r-rinside')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/jamovi/jamovi.git 
	"env.conf" 
	"jamovi.sh"
	"rinclude.patch")
sha512sums=('SKIP'
            '22b77987ace79ed7ddfa51319f61da3090e200c364cf6a3715a8d412757943bd0aa4d212178713afd3c55670414854314aa45c94a4ed788281e73cefbec0f1d5'
            'e4a3cc021f2914779e7521c0b3c462aa53af24b1e3eda79396e64f681ddd887c23ac439607235a2f4400ae57242aa8d8360c1390026a491143d00f5fd3dca3ab'
            '4fce631eb557420525ab5d138124cf48c6a20627b419f66c6c07bcc38bccc979d081e5e2ca75392a0dd84450ef29871183628174043aefc61b2fe6d55a4abb55')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 <$srcdir/rinclude.patch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	# Electron
	cd electron
	npm install
	# Server
	cd ../server
	python setup.py build_ext --inplace
	# Client
	cd ../client
	npm install
	# Engine
	cd ../engine
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/$_pkgname/bin
	mkdir -p $pkgdir/usr/lib/$_pkgname/Resources/jamovi/{client,examples,server}
	mkdir -p $pkgdir/usr/lib/$_pkgname/Resources/jamovi/server/jamovi
	mkdir -p $pkgdir/usr/lib/$_pkgname/Resources/modules
	mkdir -p $pkgdir/usr/share/applications/

	# Resources
	## Client files
	cp -r client/{analysisui.css,analysisui.html,analysisui.js,index.html,main.css,main.js,package.json,resultsview.css,resultsview.html,resultsview.js,assets} $pkgdir/usr/lib/$_pkgname/Resources/jamovi/client/

	## Examples
	cp -r examples $pkgdir/usr/lib/$_pkgname/Resources/jamovi/

	## Server
	cp -r server/jamovi/server $pkgdir/usr/lib/$_pkgname/Resources/jamovi/server/jamovi
	cp -r server/jamovi/{__init__.py,core.cpython-36m-x86_64-linux-gnu.so} $pkgdir/usr/lib/$_pkgname/Resources/jamovi/server/jamovi

	# User stuff
	cp platform/jamovi.desktop $pkgdir/usr/share/applications
	cp platform/app-icon.svg $pkgdir/usr/lib/$_pkgname/Resources

	install -m 755 $srcdir/jamovi.sh $pkgdir/usr/lib/$_pkgname/bin/jamovi.sh
	ln -s /usr/lib/$_pkgname/bin/jamovi.sh $pkgdir/usr/bin/jamovi

	# bin
	## engine
	cp engine/jamovi-engine $pkgdir/usr/lib/$_pkgname/bin/
	## Various electron stuff
	ln -s /usr/lib/electron/* $pkgdir/usr/lib/$_pkgname/bin/
	cp /usr/lib/electron/electron $pkgdir/usr/lib/$_pkgname/bin/jamovi
	### Remove node link
	rm $pkgdir/usr/lib/$_pkgname/bin/node
	### Replace electron's default thing with jamovi's
	rm $pkgdir/usr/lib/$_pkgname/bin/resources
	mkdir $pkgdir/usr/lib/$_pkgname/bin/resources
	cp electron/default_app.asar $pkgdir/usr/lib/$_pkgname/bin/resources
	ln -s /usr/lib/electron/resources/electron.asar $pkgdir/usr/lib/$_pkgname/bin/resources

	# Env conf
	cp $srcdir/env.conf $pkgdir/usr/lib/$_pkgname/bin

	# Version
	cp version $pkgdir/usr/lib/$_pkgname/Resources/jamovi

#	# Add link to R home
#	mkdir $pkgdir/usr/lib/$_pkgname/lib
#	ln -s /usr/lib/R $pkgdir/usr/lib/$_pkgname/lib
}
