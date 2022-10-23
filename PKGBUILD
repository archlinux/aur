# Maintainer: fft

pkgname=apr-2-svn
pkgver=r1904787
pkgrel=2
pkgdesc='Apache Portable Runtime library. This is version 2 from SVN trunk, possibly unstable.'
arch=('x86_64')
url='https://apr.apache.org/'
depends=('expat') # libxml2 also supported
makedepends=('svn')
optdepends=('python' 'sqlite')
license=('APACHE')
conflicts=(apr-2) # for the future, when APR 2 will be released.
provides=(apr-2)
source=("${pkgname}::svn+https://svn.apache.org/repos/asf/apr/apr/trunk/"
        'ship_find_apr.m4.patch'
        'fix-apr.pc.patch'
        'omit_extra_libs.patch'
        'dont_override_external_buildflags')
sha256sums=('SKIP'
            '268f65a263199901a07788a28e3e7bac74cd445dac677ca4e22a054d9e5315fd'
            '12595d331b48be9e44bd843635eb4f0f500bd213e197a551a9d383a28a24641f'
            '3d491d3af8fb5a75db4e085a17e5d8dcbe058bd256ef893ee779dc97fc9f8ad6'
            '5ac0bdc532479f6082d29115ac9d3ca24524fd8b97a556568755b88e5a68e3df')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${pkgname}"
  svn revert -R ./
  patch -Np1 -i ../ship_find_apr.m4.patch
  patch -Np1 -i ../fix-apr.pc.patch
  patch -Np1 -i ../omit_extra_libs.patch
  patch -Np1 -i ../dont_override_external_buildflags
  ./buildconf
}

build() {
  cd "${pkgname}"
    ./configure --prefix=/usr --includedir=/usr/include/apr-2 \
    --with-installbuilddir=/usr/share/apr-2/build \
    --enable-nonportable-atomics \
    --with-devrandom=/dev/urandom --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${pkgname}"
  make -j1 check
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}/usr/lib/apr.exp" # conflict with apr package and seems useless on linux
}
