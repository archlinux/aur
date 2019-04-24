# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `ladspa` Maintainer: damir <damir@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>

_pkgbase=ladspa
pkgname=mingw-w64-ladspa
pkgver=1.15
pkgrel=4
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA)"
arch=('x86_64')
license=('LGPL')
url="https://www.ladspa.org/"
depends=('gcc-libs')
source=("https://ladspa.org/download/ladspa_sdk_${pkgver}.tgz"
        'fix-memleak-in-plugin-scanning.patch')
sha512sums=('a521622e23d988284244003e4ccfc3b42f6ddc7944cb00e7949b87e09d7f39a0cbb64b6d8b5a5af0a5ccf7179f88815416a88f02d3912957167e54b74accfc65'
            'e80a575e6afe42f9d0ac1234a7832a29fb9362c7ab7b2d6b14cc3e6da6a9ba67af886cf09f1c0b78c161205084f705049fb4dc22fe2795efaeb7d94da90dc93e')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  mv -v ${_pkgbase}_sdk_${pkgver} ${_pkgbase}-${pkgver}
  cd "${_pkgbase}-${pkgver}"
  patch -Np0 -i "../fix-memleak-in-plugin-scanning.patch"
  # add LDFLAGS for full RELRO
  sed -e "s#-O2#${CFLAGS} ${LDFLAGS}#" -i src/Makefile
}

build() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    rm -rf build-${_arch}
    cp -r "${_pkgbase}-${pkgver}" build-${_arch}
    pushd build-${_arch}/src

    make targets

    popd
  done
}

package() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}/src"

    make INSTALL_PLUGINS_DIR="${pkgdir}/usr/$_arch/lib/ladspa/" \
         INSTALL_INCLUDE_DIR="${pkgdir}/usr/$_arch/include/" \
         INSTALL_BINARY_DIR="${pkgdir}/usr/$_arch/bin/" install
    install -vDm 644 ../doc/*.{html,txt} -t "${pkgdir}/usr/$_arch/share/doc/${_pkgbase}"

    popd
  done
}


