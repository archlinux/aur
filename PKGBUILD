# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_libname=libsignal_jni
pkgver=0.2.3
_pkgver="java-${pkgver}"
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${pkgname}"
makedepends=('rustup' 'cargo' 'gradle' 'git' 'zip' 'protobuf')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/signalapp/${pkgname}/archive/$_pkgver.tar.gz"
        "fix_gradle_7.patch"
)

sha512sums=('8bb650fe1ab20401b69990b92aa0906b3d7d3118f4315821b0b947700ef7179e78f8e2297a5863716ead507b97b27f0ebbf098ff7424143aa6b25a8740bb9ad6'
            'fdaf7037f0338379701e9669012e4b4e47d17f99a195c70ce057dbdd626c8699abb1c6387fb65d0ab0e32bed5cdceed50db39712f542c150b24606824a3361f5')

prepare() {
  tar xf "${pkgname}-$_pkgver.tar.gz"
  cd "${pkgname}-${_pkgver}"

  # currently nightly is required ... so rustup is required a makedepends
  # # Use the default system rust toolchain
  # rm -f rust-toolchain

  # Do not build the android library
  sed -i "s/, ':android'//" java/settings.gradle
  # Fix build with gradle 7
  sed -i "s/compile/implementation/" java/tests/build.gradle
  sed -i "s/Compile/Implementation/" java/tests/build.gradle
  patch -p1 < ../fix_gradle_7.patch
}

build() {
  cd "${pkgname}-${_pkgver}/java"

  ./build_jni.sh desktop
  gradle --no-daemon assemble

  zip -d "java/build/libs/signal-client-java-${pkgver}.jar" "${_libname}.so"
}

package() {
  cd "${pkgname}-${_pkgver}"

  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" "${pkgdir}/usr/lib"

  install -Dm644 "java/java/build/libs/signal-client-java-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/release/${_libname}.so" "$pkgdir/usr/lib/"
}
