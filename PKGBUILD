# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Francois Boulogne <fboulogne@april.org>
# Contributor: TDY <tdy@gmx.com>

pkgname=spyder2
_pkgname=spyder
pkgver=3.3.6
pkgrel=1
pkgdesc='The Scientific Python Development Environment (Python 2 version)'
arch=('any')
url='https://www.spyder-ide.org/'
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/spyder-ide/${_pkgname}/archive/v${pkgver}.tar.gz"
        "python2.patch"
        "bug_53489_python2-optional-nbconvert.patch"
        "bug_54508_missing_pyqt4_qtwebkit.patch"
        "bug_51437.patch")
sha256sums=('aa3e46e30da987a2532854d3ba30143f7876bddb3be1b0d5ced11a7ab7abea83'
            '84b8d5e9640d5d347ac4564130f217368cc3f823de30b458d467a05e60bbc8da'
            '7486faba90da062ef8da6912bfabd22b59343b1275758f04e4a41df2b3b8eec0'
            '28d4aa8938d809c299ab6bf6b00a2f82677f9a98a9763b7127970881b76276f5'
            'f594996710b3e9a66eaa7ad3951fbcf415276253e33ec84f51bf756053ff8e67')
makedepends=('python2-setuptools' 'python2-sphinx')
depends=('python2-pyqt5' 'qt5-webkit' 'python2-qtconsole' 'python2-qtpy' 'python2-qtawesome'
         'python2-pyflakes' 'python2-pyzmq' 'python2-pygments' 'python2-psutil' 'python2-pickleshare'
         'python2-rope' 'python2-jedi' 'python2-pylint' 'python2-pycodestyle' 'python2-sphinx'
         'python2-opengl' 'python2-spyder-kernels<1.0' 'icu' 'gtk-update-icon-cache'
         'desktop-file-utils')
optdepends=('python2-numpy: N-dimensional arrays'
            'python2-scipy: signal/image processing'
            'python2-h5py: HDF5 support'
            'python2-matplotlib: interactive 2D/3D data plotting'
            'python2-sympy: symbolic mathematics for the IPython console'
            'python2-pandas: view and edit DataFrames and Series in the Variable Explorer')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Forced QT API to pyqt5 (see https://bugs.archlinux.org/task/54508)
  echo "Applying patches bug_54508_missing_pyqt4_qtwebkit.patch"
  patch -p1 -i "../bug_54508_missing_pyqt4_qtwebkit.patch"
  # Replace spyder with spyder2 (see https://bugs.archlinux.org/task/51437)
  echo "Applying patches bug_51437.patch"
  patch -p1 -i "../bug_51437.patch"
  mv "img_src/spyder.png" "img_src/${pkgname}.png"
  mv "scripts/spyder.desktop" "scripts/${pkgname}.desktop"

  echo "Applying patches python2.patch"
  patch -p1 -i "../python2.patch"
  echo "Applying patches bug_53489_python2-optional-nbconvert.patch"
  patch -p1 -i "../bug_53489_python2-optional-nbconvert.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license file
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  # Install icon and desktop file
  install -D -m644 "spyder/images/spyder.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  # Change main executable name
  mv "${pkgdir}/usr/bin/spyder" "${pkgdir}/usr/bin/${pkgname}"
  # Remove useless spyder_win_post_install script
  rm -f "${pkgdir}/usr/bin/spyder_win_post_install.py"
}

