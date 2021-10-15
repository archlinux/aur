# Maintainer: <asamk@gmx.de>

pkgname=libsignal-client
_libname=libsignal_jni
pkgver=0.9.7
pkgrel=1
pkgdesc='Library for the Signal Protocol.'
url="https://github.com/signalapp/${pkgname}"
makedepends=('cargo' 'gradle' 'git' 'zip' 'protobuf')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/signalapp/${pkgname}/archive/refs/tags/v$pkgver.tar.gz"
        "fix_gradle_7.patch"
)

sha512sums=('4c1427ecdaa95eff76e9ee80e7c665a8425833b9a96a567c2b394e793ca479ab5f836ac75171d8c5d964d556d38ee231a1d8724c59f4f7ef8bf6871d7c5f7c08'
            'fdaf7037f0338379701e9669012e4b4e47d17f99a195c70ce057dbdd626c8699abb1c6387fb65d0ab0e32bed5cdceed50db39712f542c150b24606824a3361f5')

prepare() {
  tar xf "${pkgname}-$pkgver.tar.gz"
  cd "${pkgname}-${pkgver}"

  # Use the default system rust toolchain
  # rm -f rust-toolchain

  # Do not build the android library
  sed -i "s/, ':android'//" java/settings.gradle
  # Fix build with gradle 7
  sed -i "s/compile/implementation/" java/tests/build.gradle
  sed -i "s/Compile/Implementation/" java/tests/build.gradle
  patch -p1 < ../fix_gradle_7.patch
}

build() {
  cd "${pkgname}-${pkgver}/java"

  ./build_jni.sh desktop
  gradle --no-daemon assemble

  zip -d "java/build/libs/signal-client-java-${pkgver}.jar" "${_libname}.so"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" "${pkgdir}/usr/lib"

  install -Dm644 "java/java/build/libs/signal-client-java-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "target/release/${_libname}.so" "$pkgdir/usr/lib/"
}
