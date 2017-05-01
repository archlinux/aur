# Maintainer: Vyacheslav Konovalov <echo dnlhY2hrb25vdmFsb3ZAZ21haWwuY29tCg== | base64 -d>

pkgname=robomongo
pkgver=1.0.0
_ref='1124ec22c6e35055da67579410d7f3630a1954be'
_pkgname=$pkgname-${_ref}
_opensslver=OpenSSL_1_1_0e
pkgrel=3
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
        'https://github.com/libssh2/libssh2/archive/libssh2-1.8.0.tar.gz'
        'omron93_SERVER-26781.patch'
        'CMakeLists.txt.patch'
        'SettingsManager.cpp.patch'
        'RobomongoInstall.cmake.patch'
        'robomongo.desktop')
sha256sums=('SKIP'
            'f772387708b7803ce8ad00ba5c2f9d8e093d1fdfb38cdefe6d8c5b570a5911aa'
            'e703df4eca8b3687af0bec069ea2e7b9fefcb397701dd0d36620fd205cde82a5'
            '973f63f98141d68b4a1bc85791ee29411eeab12a6230ae1aca9c368550ccafae'
            '9e3d88e97bdf53484a93c736665248b5e5641441b3d86e7671f11b952e44c6a4'
            'c33643dcb421cee0a9031576ef572b0faf31678856e77a2c46e6ed122b8dc0c2'
            '0f49f15ec3e82cab86ca1f21609b6aadce3d57bd2129329b09ba2d55c50dd384'
            '2e39a4e140e64e2aafb322f443bd9ee03c8011541f19609f21c5427f2eade293'
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
  cd ${_mongodir} && git apply $srcdir/omron93_SERVER-26781.patch
  cd $srcdir
  scons mongo --directory=${_mongodir} --ssl CPPPATH=${_openssldir}/include LIBPATH=${_openssldir}/lib --disable-warnings-as-errors ${_shellopts}

  cd $srcdir/${_pkgname}
  patch CMakeLists.txt $srcdir/CMakeLists.txt.patch
  patch src/robomongo/core/settings/SettingsManager.cpp $srcdir/SettingsManager.cpp.patch
  patch cmake/RobomongoInstall.cmake $srcdir/RobomongoInstall.cmake.patch

  rm -r src/third-party/libssh2/sources/*
  cp -r $srcdir/libssh2-libssh2-1.8.0/* src/third-party/libssh2/sources/

  mkdir -p ./target && cd ./target/
  cmake .. -DCMAKE_PREFIX_PATH="${_mongodir};${_openssldir}" -DCMAKE_BUILD_TYPE=Release
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
