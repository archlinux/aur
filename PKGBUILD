# Maintainer: jfperini <@jfperini>
# Contributor: jfperini <@jfperini>

pkgname=veusz-git
pkgver=1.23.1+r2614.b00c508
pkgrel=1
pkgdesc="A scientific plotting and graphing package, designed to create publication-ready Postscript or PDF output."
url="http://home.gna.org/veusz"
arch=('any')
license=('GPL v2')
depends=('python2-pyqt4' 'python2-numpy')
optdepends=('python2-pyfits: for reading files in FITS format'
            'python2-emf: for EMF export'
	    'python2-dbus: for dbus interface'
            'python2-pyminuit2: for numerical function minimization'
            'python2-astropy: for VO table import')
install="$pkgname.install"
# conflicts=('')
# provides=('')
source=("$pkgname"::'git+https://github.com/jeremysanders/veusz' 'veusz.desktop')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP' '3823fe5961f3975a4dff2967aadaa14f')

pkgver() {
    
	cd "$srcdir/$pkgname"
  
	# Use the tag of the last commit
    	printf "1.23.1+r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    
}

build() {

    	cd "$srcdir/$pkgname"
  
    	msg2 "  -> Build program..."
    	python2 setup.py build
    
}

package() {

    	cd "$srcdir/$pkgname"
  
    	msg2 "  -> Installing program..."
    	python2 setup.py install --root="$pkgdir" --prefix=/usr
    
	msg2 "  -> Installing icons..."
    	for _i in 16 32 48 64 128; do
	install -Dm644 "icons/veusz_${_i}.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/veusz.png"
    	done

   	msg2 "  -> Installing .desktop file..."
    	install -Dm644 "$srcdir/veusz.desktop" "$pkgdir/usr/share/applications/veusz.desktop"

    	rm -rf {.git,.gitignore,CONTRIBUTORS,COPYING,CREDITS,LICENSE.txt,README.md}

}

# vim:set ts=2 sw=2 et: