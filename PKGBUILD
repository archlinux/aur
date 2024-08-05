# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=2024.2.1
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
makedepends=(python-build python-installer python-pdm-backend python-tomlkit python-six)
depends=(python-distro python-pyosf)

optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/psychopy/psychopy/archive/${pkgver}.tar.gz")
sha512sums=('6a61ba1360a0714802e745baaea363bdc0cd34501de813ce00b61c5bd9b5179d77bb50d60ebecf6f9c5d6a47fd9737f86569efa8da7913429bfb4b048d0d332d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  rm -rf packaging/

#  # The opencv package in Arch is compiled with the python bindings so the python package is not needed
#  sed -i '/opencv-python/d' setup.cfg

#  # The python-pyglet package is required, but the Arch version is newer than the one specified in setup.cfg. There is probably a cleaner way to do this ...
#  sed -i '/pyglet/d'  setup.cfg
   
  python -m build --wheel --no-isolation
}

package() {
  # These packages come from setup.cfg
  depends+=(python python-packaging python-requests python-cryptography python-numpy python-scipy python-matplotlib python-pandas python-pillow python-glfw python-pygame python-opengl python-pyo python-soundfile python-sounddevice python-bidi python-arabic-reshaper python-future python-json-tricks python-xlrd python-openpyxl python-pyserial python-pyaml python-gevent python-msgpack python-msgpack-numpy python-psutil python-pytables python-pyzmq python-ujson python-moviepy python-gitlab python-gitpython python-astunparse python-esprima python-freetype-py python-jedi python-psychtoolbox python-websocket-client python-pyglet python-wxpython python-vlc python-pyparallel python-xlib python-imageio python-pyqt5 python-javascripthon python-questplus)

  # These packages seem to be required
  depends+=(webkit2gtk-4.1 python-xmlschema)

  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir=${pkgdir} dist/*.whl
  
  # desktop files
  cd "$pkgname/app/Resources"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}
