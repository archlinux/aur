# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=2021.2.3
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
makedepends=(python-setuptools)
depends=(python-pyosf)

optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/psychopy/psychopy/archive/${pkgver}.tar.gz")
sha512sums=('7c802face85a48db2b4212e9dbb6a3a596c33c23970dd326a9156b558b1a97330aeb07bfe15d26d37b48e18bdf2aa998e8aa4ec376df3c5ca3895339a70a56ca')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf packaging/

  # The opencv package in Arch is compiled with the python bindings so the python package is not needed
  sed -i '/opencv-python/d' setup.cfg

  # The python-pyglet package is required, but the Arch version is newer than the one specified in setup.cfg. There is probably a cleaner way to do this ...
  sed -i '/pyglet/d'  setup.cfg
   
  python setup.py build
}

package() {
  # These packages come from setup.cfg
  depends+=(python python-packaging python-requests python-cryptography python-numpy python-scipy python-matplotlib python-pandas python-pillow python-glfw python-pygame python-opengl python-pyo python-soundfile python-sounddevice python-bidi python-arabic-reshaper python-future python-json-tricks python-xlrd python-openpyxl python-pyserial python-pyaml python-gevent python-msgpack python-msgpack-numpy python-psutil python-pytables python-pyzmq python-ujson python-moviepy python-gitlab python-gitpython python-astunparse python-esprima python-freetype-py python-jedi python-psychtoolbox python-websocket-client python-pyglet python-wxpython python-vlc python-pyparallel python-xlib python-distro python-imageio python-imageio-ffmpeg python-pyqt5 python-javascripthon python-questplus)

  # These packages seem to be required
  depends+=(webkit2gtk python-xmlschema)

  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  
  # desktop files
  cd "$pkgname/app/Resources"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}
