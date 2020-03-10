# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Ray Kohler <ataraxia937@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: moostik <mooostik_at_gmail.com>

pkgname=veusz
pkgver=3.2
pkgrel=1
pkgdesc="A 2D and 3D scientific plotting package, designed to create publication-ready PDF or SVG output"
arch=('x86_64')
url="https://veusz.github.io/"
license=('GPL2')
depends=('python-pyqt5' 'python-numpy' 'python-sip' 'hicolor-icon-theme')
makedepends=('sip')
optdepends=('python-h5py:  HDF5 support'
#             'pyemf >= 2.0.0: EMF export   https://github.com/jeremysanders/pyemf (Python 3 port in development) - package missing
            'python-dbus: dbus interface'
            'python-iminuit: improved fitting'
            'python-astropy: VO table import and FITS import'
            'ghostscript: for EPS/PS output')
       # patch from https://github.com/veusz/veusz/issues/307
source=("https://github.com/veusz/veusz/releases/download/veusz-${pkgver}/veusz-${pkgver}.tar.gz"
        "veusz-${pkgver}-sip_dir.patch")
sha256sums=('67d4adcc83b33098f4740ac036e54b3078c596b67363b674ef167ac3a812b018'
            '526cf71bfa70e4a400e46054cb0e73254b45d1b930c36c5c2afd2cf8e0c59938')

prepare() {
  patch -Np1 -i "veusz-${pkgver}-sip_dir.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build_ext --sip-dir=/usr/lib/python3.8/site-packages/PyQt5/bindings/
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --prefix=/usr
  for _i in 16 32 48 64 128; do
    install -D -m644 "icons/veusz_${_i}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_i}x${_i}/apps/veusz.png"
  done
  install -D -m644 "support/veusz.desktop" \
      "${pkgdir}/usr/share/applications/veusz.desktop"
}

