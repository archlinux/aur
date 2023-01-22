# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Arthur Zamarin <arthurzam@gmail.com>
# Contributor: Hermann Mayer <hermann.mayer92@gmail.com>

pkgbase=psmoveapi-git
pkgname=('psmoveapi-git'
         'python-psmoveapi-git'
          )
pkgver=4.0.12.162.g5067d19
pkgrel=1
pkgdesc='Playstation Move Motion Controller API (GIT version)'
arch=('x86_64')
url='http://thp.io/2010/psmove'
license=('BSD')
makedepends=('git'
             'cmake'
             'python-sphinx'
             'udev'
             'bluez-libs'
             'libusb-compat'
             )
source=('git+https://github.com/thp/psmoveapi.git'
        'git+https://github.com/thp/hidapi.git'
        'git+https://github.com/inspirit/PS3EYEDriver.git'
        'git+https://github.com/libusb/libusb.git'
        'add-libv4l2-module.patch'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '271eaa3f1f5c50045873f1583ebc38eb6c9451440a7c98de5b75731058901480'
            )
options=('debug')

pkgver() {
  cd psmoveapi
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd psmoveapi
  git config submodule.external/hidapi.url "${srcdir}/hidapi"
  git config submodule.external/PS3EYEDriver.url "${srcdir}/PS3EYEDriver"
  git config submodule.external/libusb-1.0.url "${srcdir}/libusb"
  git -c protocol.file.allow=always submodule update --init \
    external/hidapi \
    external/PS3EYEDriver \
    external/libusb-1.0

  # Add the missing cmake libv4l2 linkage
  patch -p1 -i "${srcdir}/add-libv4l2-module.patch"

  mkdir -p docs/_static
}

build() {
  cmake -B build -S psmoveapi \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DPSMOVEAPI_LIB_DEST=lib \
    -DPSMOVE_BUILD_EXAMPLES=ON \
    -DPSMOVE_BUILD_TESTS=OFF \
    -DPSMOVE_BUILD_TRACKER=ON

  cmake --build build
}

package_psmoveapi-git() {
  provides=('psmoveapi')
  conflicts=('psmoveapi')
  depends=('udev'
           'bluez-libs'
           'libusb-compat'
         )

  DESTDIR="${pkgdir}" cmake --install build

  (cd psmoveapi/docs; make BUILDDIR="${pkgdir}/usr/share/doc/${pkgbase}" html)

  mkdir -p "${pkgdir}/usr/share/"{doc,licenses}"/${pkgbase}"
  mv "${pkgdir}/usr/share/psmoveapi/README.md" "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  mv "${pkgdir}/usr/share/psmoveapi/COPYING" "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"
  rm -fr "${pkgdir}/usr/share/psmoveapi"
}

package_python-psmoveapi-git() {
  pkgdesc='Python bindings for Playstation Move Motion Controller API (GIT version)'
  provides=('python-psmoveapi')
  conflicts=('python-psmoveapi')
  depends=("psmoveapi-git=${pkgver}"
           'python'
           )

  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
  install -Dm644 psmoveapi/bindings/python/psmoveapi.py "${pkgdir}${_site_packages}/psmoveapi.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/psmoveapi.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/psmoveapi.py"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/licenses/${pkgbase}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
