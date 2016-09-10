# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=1.84.1
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=(any)
url="http://www.psychopy.org"
license=(GPL)
makedepends=(python2-setuptools)
depends=(desktop-file-utils python2-configobj python2-requests python2-moviepy python2 wxpython python2-numpy python2-pandas python2-scipy python2-imaging python2-lxml python2-pyglet python2-matplotlib glu python2-pyo python2-opengl python2-pygame avbin7 python2-openpyxl ttf-freefont python2-psutil python2-yaml python2-gevent python2-msgpack python2-xlib python2-pytables)
optdepends=('python2-pyparallel: To use the parallel port'
            'python2-pyserial: For interfacing with the serial port'
            'parallel-python: For parallel processing'
            'flac: For working with google speech'
            'python2-pytest: For running unit tests'
            'python2-coverage: For running unit tests'
            'python2-sphinx: For building documentation')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
        'linux2.patch'
)
md5sums=('4d250422f370ecc1d84a5649589c17ed'
         '3b55a69e8b37a621d8d1346aa2239fc6')

prepare() {
  # Deal with iohub issues
  patch "${srcdir}/${pkgname}-${pkgver}/psychopy/iohub/devices/mouse/linux2.py" < \
      "${srcdir}/linux2.patch"

  # Make sure all calls are to python2 functions
  sed -i 's/py.test /py.test2 /' "${srcdir}/${pkgname}-${pkgver}/psychopy/tests/run.py"
}

package() {
  (cd "${srcdir}/${pkgname}-${pkgver}"; \
      python2 setup.py install --root="${pkgdir}/" --optimize=1)
  install -m 755 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/psychopyApp.py" \
      "${pkgdir}/usr/bin/"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/Resources/${pkgname}.desktop" \
      "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/Resources/${pkgname}.png" \
      "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/Resources/${pkgname}.xml" \
      "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
