# Maintainer: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=3.1.0
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
depends=('python-matplotlib' 'python-pandas' 'python-opengl' 'python-pyglet'
         'python-moviepy' 'python-lxml' 'python-openpyxl' 'python-configobj'
         'python-freetype-py' 'python-gitpython' 'python-gitlab' 'python-pyzmq'
         'python-json-tricks' 'python-pygame' 'python-pyqt5' 'python-imageio-ffmpeg'
         'python-soundfile' 'python-sounddevice' 'python-pytables' 'python-msgpack-numpy'
         'python-gevent' 'python-pyaml' 'python-cryptography' 'python-pyopenssl'
         'python-xlrd' 'python-pyosf' 'python-bidi' 'python-esprima'
         'python-pyparallel' 'python-psutil' 'python-astunparse' 'python-pyserial'
         'python-arabic-reshaper' 'python-wxpython' 'webkit2gtk' 'python-mock')
makedepends=('python-wheel' 'python-setuptools')
optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
        "setup.cfg.patch")
md5sums=('a5c254a43df3675505d9e4e7fffaabe8'
         '51eae5ff98af0e0f83ca7187ff81e055')

prepare() {
  # apply patch to psychopy requirements in setup.cfg
  # archlinux opencv pacakge provides python bindings, but no metadata
  # wxpython is required for linux
  # psychopy msgpack requirement is outdated with archlinux version
  cd "$srcdir/$pkgname-$pkgver"
  patch --strip=0 --forward --input="$srcdir/setup.cfg.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # desktop files
  cd "$pkgname/app/Resources"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}

# vim:set ts=2 sw=2 et:
