# Maintainer: qubeck <qubeck (AT) disroot (DOT) org>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=jna
pkgname=(jna jna-platform)
pkgver=5.19.1
pkgrel=2
pkgdesc='Java Native Access library'
arch=(x86_64)
url='https://github.com/java-native-access/jna'
license=('Apache-2.0 OR LGPL-2.1-or-later')
_java=8
makedepends=(
  'ant'
  'git'
  "java-environment=${_java}"
  'libx11'
  'libxt'
  'pkgconf'
)
checkdepends=(
  'libcups'
)
source=("${pkgbase}-${pkgver}::git+${url}.git#tag=${pkgver}"
        'jna-disable-full-jar.patch'
        'jna-disable-native-jar.patch'
        'jna-native-ldflags.patch'
        'jna-use-system-library.patch')
sha256sums=('fb672b61c1af3acd40b9906bb4cbf9a762a921045a4e71a8f1ff784b5948857a'
            'e2dc08dd85e5e7a328def500f2f73783cb4169389158d868c7f34bfe0868abbc'
            '39ba650dd7ae5c62a21752187a92c17e87f0aeed5d59c3d2d38e5b153077a822'
            'ada01ef35a301b4dde0076e49ab5cbc92eeb7ff201da1bd4418a2d1dc00ef3af'
            'a9aec274a697c1dc0e8b1a5fde9db514e23074731e3517d6d78553c93eee863a')

_ant_opts=(
  -Drelease=true
  -Ddynlink.native=true
  -Domit-jnilib=true
  "-Dcflags_extra.native=${CPPFLAGS} ${CFLAGS}"
)

prepare() {
  cd "${pkgbase}-${pkgver}"

  patch -Np1 -i ../jna-disable-full-jar.patch

  patch -Np1 -i ../jna-disable-native-jar.patch

  patch -Np1 -i ../jna-native-ldflags.patch

  patch -Np1 -i ../jna-use-system-library.patch

  # Use the system Ant library
  sed -i 's@lib/ant\.jar@/usr/share/java/ant/ant.jar@g' build-ant-tools.xml
}

build() {
  cd "${pkgbase}-${pkgver}"

  export JAVA_HOME="/usr/lib/jvm/java-${_java}-openjdk"
  export PATH="${JAVA_HOME}/bin:${PATH}"
  ant "${_ant_opts[@]}" native jar contrib-jars
}

check() {
  cd "${pkgbase}-${pkgver}"

  export JAVA_HOME="/usr/lib/jvm/java-${_java}-openjdk"
  export PATH="${JAVA_HOME}/bin:${PATH}"
  ant "${_ant_opts[@]}" test

  export JAVA_TOOL_OPTIONS="-Djna.boot.library.path=${PWD}/build/native-linux-x86-64"
  ant "${_ant_opts[@]}" test-platform
}

package_jna() {
  depends=(
    'glibc'
    "java-runtime>=${_java}"
    'libffi.so=8-64'
  )

  cd "${pkgbase}-${pkgver}"

  install -Dm644 build/jna{.jar,-jpms.jar} \
    -t "${pkgdir}/usr/share/java/jna"
  install -Dm644 build/headers/*.h \
    -t "${pkgdir}/usr/include/jna"
  install -Dm644 build/native-linux-*/libjnidispatch.so \
    -t "${pkgdir}/usr/lib/jna"

  ln -sr "${pkgdir}"/usr/share/java/jna{/jna.jar,.jar}
}

package_jna-platform() {
  pkgdesc='Cross-platform JNA mappings (jna-platform)'
  arch=(any)
  depends=(
    "jna=${pkgver}"
    "java-runtime>=${_java}"
  )

  cd "${pkgbase}-${pkgver}"

  install -Dm644 \
    contrib/platform/dist/jna-platform{.jar,-jpms.jar} \
    -t "${pkgdir}/usr/share/java/jna"
}
