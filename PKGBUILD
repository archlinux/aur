# Maintainer:
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=2025.1.1
pkgrel=1
pkgdesc="Free software for creating psychology, economics, neuroscience, psycholinguistics, behavioural experiments."
arch=('any')
url="http://www.psychopy.org"
license=('GPL3')
makedepends=(python-build python-installer python-pdm-backend python-tomlkit python-six python-polib)
depends=(python-distro)

optdepends=('python-seaborn: For nice graphs')
source=("https://github.com/psychopy/psychopy/archive/${pkgver}.tar.gz")
sha512sums=('7bae62b926c8e5e0e840964eb8a6ffe84a1ce5bbe579d1c15484013226df78f2ddb1779f96a8f9deba7b600f932740d23225c1aa87bfb28931426c92674a27f1')

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
  depends+=(python python-packaging python-requests python-cryptography python-numpy python-scipy python-matplotlib python-pandas python-pillow python-glfw python-pygame python-opengl python-soundfile python-bidi python-arabic-reshaper python-json-tricks python-xlrd python-openpyxl python-pyserial python-gevent python-msgpack python-msgpack-numpy python-psutil python-pytables python-pyzmq python-ujson python-moviepy python-gitlab python-gitpython python-astunparse python-esprima python-freetype-py python-jedi python-psychtoolbox python-pyglet python-wxpython python-vlc python-pyparallel python-xlib python-pyqt5 python-javascripthon python-questplus python-xmlschema python-yaml)

  # for webview support, optdep of wxwidgets-gtk3
  depends+=(webkit2gtk-4.1)

  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir=${pkgdir} dist/*.whl
  
  # desktop files
  cd "$pkgname/app/Resources"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.xml" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}
