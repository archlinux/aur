# Maintainer: Stephen Martin <stephenSRMMartin at gmail dot com>
pkgname=jamovi-git
_pkgname=jamovi
pkgver=r515.e8a78ad
pkgrel=1
pkgdesc="Open Source Software to bridge the gap between researcher and statistician"
arch=('any')
url="https://www.jamovi.org/"
license=('GPL')
depends=('electron' 'python' 'python-protobuf' 'python-tornado' 'python-nanomsg' 'python-yaml' 'boost-libs' 'python-chardet')
optdepends=("jamovi-rbundle: R backend for various analyses")
makedepends=('boost' 'npm' 'cython' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/jamovi/jamovi.git 
	"env.conf" 
	"jamovi.sh"
	"rinclude.patch")
md5sums=('SKIP'
         '207b3012a3235d9f9a0ec12fa4027694'
         '38fec18885de4ecbb91aef1f201c20d7'
         '60a8bd543e49debf6d917afde56f60c3')

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
}
