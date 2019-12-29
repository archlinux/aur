# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: jfperini <@jfperini>

pkgname=veusz-git
pkgver=3.1.r2.gf8b92b60
pkgrel=1
pkgdesc="A scientific plotting and graphing package, designed to create publication-ready Postscript or PDF output."
url="https://github.com/veusz/veusz"
arch=('x86_64')
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'hicolor-icon-theme' 'cblas')
makedepends=('git' 'sip')
optdepends=('ghostscript: for EPS/PS output'
	    'python-pyfits: for reading files in FITS format'
	    'python-dbus: for dbus interface'
            'python-astropy: for VO table import')
conflicts=('veusz')
provides=('veusz')
source=('git+https://github.com/veusz/veusz' 'veusz.desktop')
sha256sums=('SKIP'
            '2697db4170f4f98b8498185dbaf408a9f8aa4c0bcaa6a117dae1a464f73ea379')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags --long|cut -c7- |sed 's+-+.r+'|tr - .
}

build() {
  cd ${pkgname%-git}
  [[ -d NEW ]] || mkdir NEW
  ln -s /usr/lib/python3.8/site-packages/PyQt5/bindings/ NEW/PyQt5
  export SIP_DIR=NEW/
  python setup.py build
}

package() {
  cd ${pkgname%-git}
  python setup.py install --root="$pkgdir" --prefix=/usr
  for _i in 16 32 48 64 128; do
    install -Dm644 "icons/veusz_${_i}.png" "$pkgdir"/usr/share/icons/hicolor/${_i}x${_i}/apps/veusz.png
  done
  install -Dm644 "$srcdir/veusz.desktop" "$pkgdir"/usr/share/applications/veusz.desktop
}
