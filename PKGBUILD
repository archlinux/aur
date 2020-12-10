# Maintainer: Adler Neves <adlerosn@gmail.com>

_pkgname=psmoveapi
pkgname=${_pkgname}
pkgver=4.0.11
provides=('psmoveapi')
conflicts=('psmoveapi' 'psmoveapi-git' 'psmoveapi-bin')
_pkgurl=https://github.com/thp/psmoveapi/archive/${pkgver}.tar.gz
pkgrel=2
pkgdesc="Playstation Move Motion Controller API"
arch=(any)
url="http://thp.io/2010/psmove/"
license=('BSD')
depends=('udev' 'bluez-libs' 'libusb' 'libusb-compat')
makedepends=('go-md2man' 'java-environment' 'cmake' 'make' 'gcc' 'pkgconfig' 'swig' 'python')
source=("${_pkgname}-${pkgver}.tar.gz::${_pkgurl}"
        "PS3EYEDriver@b314029.tar.gz::https://github.com/inspirit/PS3EYEDriver/archive/b31402953d7d7b0c24b05c79b9c5933fce2b4773.tar.gz"
        "libusb@b4c9b42.tar.gz::https://github.com/libusb/libusb/archive/b4c9b4272d61cecffeddeb91abd31efe256a6224.tar.gz"
        "hidapi@38681c7.tar.gz::https://github.com/thp/hidapi/archive/38681c734965636c9fd710dc3898d90aaf923bb9.tar.gz")
sha1sums=('1fbc047a2099ebec609e682bf51e8096f3413877'
          '3bb8d3a76a13012b55c63836e2490a1cf9c8d88f'
          '7723ef5b48beae5cfe192bfb24618b248da27a61'
          '5921ef5edc950962ac7ef28f0c108d13af199860')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  rm -rf external/hidapi
  rm -rf external/libusb-1.0
  rm -rf external/PS3EYEDriver
  ln -s ../../hidapi-38681c734965636c9fd710dc3898d90aaf923bb9 external/hidapi
  ln -s ../../libusb-b4c9b4272d61cecffeddeb91abd31efe256a6224 external/libusb-1.0
  ln -s ../../PS3EYEDriver-b31402953d7d7b0c24b05c79b9c5933fce2b4773 external/PS3EYEDriver
  sed -E 's/^include\("examples/\#\0/g' -i CMakeLists.txt
  sed -E 's/^set -(e|x)/\#\0/g' -i scripts/build_package.sh
  sed -E "s/^PSMOVEAPI_REVISION=.*/PSMOVEAPI_REVISION=\"${pkgver}\"/g" -i scripts/build_package.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/scripts/linux"
  JAVA_HOME="${JAVA_HOME:=/usr/lib/jvm/default}" sh build-debian
  cd "${srcdir}/${_pkgname}-${pkgver}/scripts"
  JAVA_HOME="${JAVA_HOME:=/usr/lib/jvm/default}" PSMOVEAPI_REVISION="${pkgver}" sh build_package.sh
  cd "${srcdir}"
  bsdtar -xf "${_pkgname}-${pkgver}/upload/psmoveapi-${pkgver}-linux.tar.gz"
  cd "${srcdir}/${_pkgname}-${pkgver}-linux"
  go-md2man -in README.md -out README.man
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-linux"
  mkdir -p bin
  mkdir -p lib
  mkdir -p docs
  mkdir -p bindings/java
  mkdir -p bindings/csharp
  mkdir -p bindings/python
  mkdir -p bindings/processing
  export PYVER=$(python -c 'import sys; print(".".join(list(map(str, sys.version_info[:2]))))')
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/lib
  install -d "${pkgdir}"/usr/include
  install -d "${pkgdir}"/usr/share/psmoveapi
  install -d "${pkgdir}"/usr/share/psmoveapi/docs
  install -d "${pkgdir}"/usr/share/psmoveapi/bindings
  install -d "${pkgdir}"/usr/share/man/man1
  install -d "${pkgdir}"/usr/share/licenses/psmoveapi
  install -d "${pkgdir}"/usr/lib/python${PYVER}/site-packages
  install -d "${pkgdir}"/etc/udev/rules.d/
  install ../"${_pkgname}-${pkgver}"/contrib/99-psmove.rules -m 644 "${pkgdir}"/etc/udev/rules.d/
  install README.man -m 644 "${pkgdir}"/usr/share/man/man1/psmoveapi.1
  install COPYING -m 644 "${pkgdir}"/usr/share/licenses/psmoveapi/LICENSE
  install bin/* -m 755 "${pkgdir}"/usr/bin/.
  install lib/* -m 755 "${pkgdir}"/usr/lib/.
  install bindings/java/libpsmove_java.so -m 755 "${pkgdir}"/usr/lib/.
  install bindings/csharp/psmoveapi_csharp.so -m 755 "${pkgdir}"/usr/lib/.
  install bindings/python/_psmove.so -m 755 "${pkgdir}"/usr/lib/.
  install bindings/python/_psmove.so -m 755 "${pkgdir}"/usr/lib/python${PYVER}/site-packages
  install bindings/python/psmove.py -m 755 "${pkgdir}"/usr/lib/python${PYVER}/site-packages
  install bindings/python/psmoveapi.py -m 755 "${pkgdir}"/usr/lib/python${PYVER}/site-packages
  install include/* -m 755 "${pkgdir}"/usr/include/.
  cp docs/. -R "${pkgdir}"/usr/share/psmoveapi/docs
  cp bindings/. -R "${pkgdir}"/usr/share/psmoveapi/bindings
  rm -rf "${pkgdir}"/usr/share/psmoveapi/bindings/processing
}
