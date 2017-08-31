# Maintainer: Daniel E. Shub <daniel.e.shub@gmail.com>
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=psychopy
pkgver=1.85.3
pkgrel=1
pkgdesc="An experiment builder for neuroscience, psychology and psychophysics"
arch=(any)
url="http://www.psychopy.org"
license=(GPL)
makedepends=(python2-setuptools)

# Dependencies: Non Python
depends=(ttf-freefont desktop-file-utils glu)

# Dependencies: PsychoPy application
## The python2-numpy package is a dependency of python2-pandas and python2-scipy
depends+=(
    wxpython python2-scipy python2-matplotlib
    python2-pandas python2-opengl python2-pyglet
    python2-imaging  python2-lxml
    python2-openpyxl python2-configobj
)

# Dependencies: ioHub
## The python2-greenlet package is a dependency of python2-gevent
## The python2-pytables package is a dependency of python2-pandas
depends+=(python2-yaml python2-gevent python2-msgpack python2-psutil)

depends+=(python2-xlrd)
depends+=(python2-requests)

# There is some sort of Arch/ioHub incompatibility that
# requires patching ioHub to use the python2-xlib
depends+=(python2-xlib)

# Unlisted dependencies
depends+=(python2-future python2-json-tricks)

# The python2-pyqt5 package is a dependency of python2-matplotlib
# The pyosf and psychopy_exts packages are mentioned as optional dependencies, but are not packaged
optdepends=(
    'python2-moviepy: For playing movies'
    'python2-pyo: For playing sound (alterative to python2-pysoundcard/python2-pysoundfile)'
    'python2-pysoundcard: For playing sound (alterative to python2-pyo) Requires python2-pysoundfile'
    'python2-pysoundfile: For playing sound (alterative to python2-pyo) Requires python2-pysoundcard'
    'python2-cffi: For playing sound (alterative to python2-pyo)'
    'python2-seaborn: For graphing nicely'
    'python2-bidi: For formatting left-right languages'
    'python2-pyserial: For using the serial port'
    'python2-pyparallel: For using the parallel port'
    'python2-egi: For using egi/pynetstation'
    'python2-iolabs: For using the iolabs button box'
    'python2-xid: For communicating with Cedrus XID and StimTracker devices'
    'python2-labjack: For interacting with the LabJack'
    'python2-pytest: For running unit tests'
    'python2-coverage: For running unit tests'
    'python2-sphinx: For building documentation'
)

source=(
    "https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz"
)
md5sums=('460afc4344470ed6adaf9f95471e66b0')

prepare() {
    # Make sure all calls are to python2 functions
    sed -i 's/py.test /py.test2 /' \
            "${srcdir}/${pkgname}-${pkgver}/psychopy/tests/run.py"
}

package() {
    (
        cd "${srcdir}/${pkgname}-${pkgver}"
        python2 setup.py install --root="${pkgdir}/" --optimize=1
    )
    install -m 755 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/psychopyApp.py" \
            "${pkgdir}/usr/bin/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/Resources/${pkgname}.desktop" \
            "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/Resources/${pkgname}.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/psychopy/app/Resources/${pkgname}.xml" \
            "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
}
