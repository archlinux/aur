# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='blink-darcs'
pkgver=20160601
pkgrel='1'
pkgdesc='A state of the art, easy to use SIP client'
arch=(
	'i686'
	'x86_64'
)
url='http://www.icanblink.com'
license=('GPL')
depends=(
	'python2'
	'python2-application'
	'python2-cjson'
	'python2-eventlib'
	'python2-gnutls'
	'python2-pyqt'
	'python2-sipsimple'
	'python-otr'
	'twisted'
	'libvncserver'
	'cython2'
	'python2-gmpy2'
)
makedepends=('darcs')

_darcstrunk="http://devel.ag-projects.com/repositories"
_darcsmod="blink-qt"

build() {
	msg "Connecting to Darcs server for $_darcsmod..."
  
	if [[ -d "$srcdir/$_darcsmod/_darcs" ]]; then
		msg2 "Updating local Darcs repository..."
		cd "$srcdir/$_darcsmod"
		darcs pull -a "$_darcstrunk/$_darcsmod"
	else
		msg2 "Downloading Darcs repository..."
		darcs get --lazy "$_darcstrunk/$_darcsmod"
	fi
  
	msg2 "Cloning for build..."
	[[ -d "$srcdir/$_darcsmod-build" ]] && rm -rf "$srcdir/$_darcsmod-build"
	cp -r "$srcdir/$_darcsmod" "$srcdir/$_darcsmod-build"

	msg "Starting build..."
	cd "$srcdir/$_darcsmod-build"
	python2 setup.py build
}

package() {
	cd "$srcdir/$_darcsmod-build"
	python2 setup.py install --root="$pkgdir"

	install -Dm 644 'debian/blink.desktop' "$pkgdir/usr/share/applications/blink.desktop"
	install -Dm 644 'debian/blink.xpm' "$pkgdir/usr/share/pixmaps/blink.xpm"
	install -Dm 644 'debian/blink.1' "$pkgdir/usr/share/man/man1/blink.1"
}
