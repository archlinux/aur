# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

_name="libpaper"
pkgname="lib32-${_name}"
pkgver=2.2.6
pkgrel=1
pkgdesc="Library for handling paper characteristics (32-bit)"
arch=('x86_64')
url="https://github.com/rrthomas/${_name}"
license=('LGPL-2.1-or-later' 'LicenseRef-Public-Domain' 'GPL-3.0-or-later'
         'LGPL-2.0-or-later' 'FSFAP' 'MIT')
depends=('lib32-glibc' "${_name}")
provides=('lib32-paper' "${_name}.so")
conflicts=('lib32-paper')
replaces=('lib32-paper')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc}.tar.gz"
        'localepaper.c')
sha256sums=('500d39dc58768ee09688738c8b5bfe07640ba2fd6c25a6dc78810eb69c719e93'
            '7e49c6ce67fbaea77929ab5849026412d0f91f692a902805c0134a071cccde22')

prepare() {
  cd "${srcdir}/${_pkgsrc}/src"
  cp "${srcdir}/localepaper.c" .
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make

  pushd src
  gcc ${CFLAGS} ${LDFLAGS} -I.. -Ilibgnu -o localepaper localepaper.c libgnu/.libs/libgnupaper.a
  popd
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make -k check
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "src"
  install -vDm755 "localepaper" "${pkgdir}/usr/lib32/localepaper"

  cd "${pkgdir}/usr"
  rm -rf "bin" "etc" "include" "share"
}
