# Maintainer: Vyacheslav Konovalov <echo dnlhY2hrb25vdmFsb3ZAZ21haWwuY29tCg== | base64 -d>

pkgname=robomongo
pkgver=1.0.0
_ref='0fefd6d44307ca371d2b0ad70455ff378b0f676e'
_pkgname=$pkgname-${_ref}
_opensslver=OpenSSL_1_0_2k
pkgrel=1
pkgdesc='Shell-centric cross-platform open source MongoDB management tool'
arch=('i686' 'x86_64')
url="https://robomongo.org/"
license=('GPLv3')
depends=('qt5-base')
makedepends=('git' 'scons' 'cmake')
conflicts=('robomongo-bin')
source=('git+https://github.com/paralect/robomongo-shell.git#branch=roboshell-v3.2'
        "https://github.com/paralect/robomongo/archive/${_ref}.tar.gz"
        "https://github.com/openssl/openssl/archive/${_opensslver}.tar.gz"
        'patch.diff'
        'robomongo.desktop')
sha256sums=('SKIP'
            '062a15f42fbb72ea2e05f57c5192b6e721ea110ba8ee8d5a4779a9630c65dd70'
            '8173c6a6d6ab314e5e81e9cd1e1632f98586a14d7807697fd24155f162292229'
            '18f36fcc10e1fa9efd4cc53e1274641e89489a6373d84b14c93db2933567d091'
            'bdd63f5d4bd35dd865a0164f285d19555e4ecafb2d11d01f67bdb86bd730a13d')

build() {
  if [ $CARCH == 'i686' ]; then
    _shellopts='--wiredtiger=off'
    cd $srcdir/${_pkgname}/cmake
    sed -i -e 's/x86_64/i386/g' FindMongoDB.cmake mongodb/linux-release.objects
  fi

  _openssldir=$srcdir/openssl-${_opensslver}
  cd ${_openssldir}
  ./config shared
  make
  mkdir -p lib
  cp libssl* libcrypto* lib/

  _mongodir=$srcdir/robomongo-shell
  cd $srcdir
  scons mongo --directory=${_mongodir} --ssl CPPPATH=${_openssldir}/include LIBPATH=${_openssldir}/lib --disable-warnings-as-errors ${_shellopts}

  cd $srcdir/${_pkgname}
  mkdir -p ./target && cd ./target/
  cmake .. -DCMAKE_PREFIX_PATH="${_mongodir};${_openssldir}" -DCMAKE_BUILD_TYPE=Release
  patch $srcdir/${_pkgname}/src/robomongo/gui/widgets/workarea/WelcomeTab.cpp $srcdir/patch.diff
  make
  make install
}

package() {
  _instdir=$srcdir/${_pkgname}/target/install

  install -Dm0755 "${_instdir}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "$srcdir/robomongo.desktop" "$pkgdir/usr/share/applications/robomongo.desktop"
  install -Dm0644 "$srcdir/${_pkgname}/src/robomongo/gui/resources/icons/logo.png" "${pkgdir}/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "${_instdir}/LICENSE" "${pkgdir}/usr/share/licenses/robomongo/LICENSE"
  install -Dm0644 "${_instdir}/COPYRIGHT" "${pkgdir}/usr/share/doc/robomongo/COPYRIGHT"
}
