# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=unidbg
pkgver=0.9.9
pkgrel=3
pkgdesc="Android native library emulator with experimental iOS emulation"
arch=('x86_64')
url="https://github.com/zhkl0228/unidbg"
license=('Apache-2.0' 'GPL-2.0-only')
depends=('gcc-libs' 'java-runtime>=8')
makedepends=('cmake' 'java-environment>=17' 'maven')
_unicorn_ver=1.0.15
# Matches zhkl0228/unicorn's "Release 1.0.15" commit, the Maven dependency pinned by unidbg-api.
_unicorn_commit=99b54f90095ce27d5490be702dd8db5df175cfb5
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "unicorn-${_unicorn_ver}-${_unicorn_commit}.tar.gz::https://github.com/zhkl0228/unicorn/archive/${_unicorn_commit}.tar.gz"
  "java-module-ambiguity.patch"
  "fix-unicorn-java-link.patch"
)
sha256sums=('155412c3f65adf7170ce21250f8641023c204f71ef72207fa5a47cfc2650d988'
            'e99658fa4ca42bb179c468ad6808bf75ec225b237edc3b1b871b105f03a510bf'
            '951e4900542437416c50bea90e18fc4e3f432fc00d57d9e4e114ec6cf421fbd1'
            '4d81bf48949a6e2ea7d8e45c8281dc946c2942e6b05c8c7d07e20f2ae1ea2a5d')

latestver() {
  gh api --paginate repos/zhkl0228/unidbg/releases --jq \
    '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 < "${srcdir}/java-module-ambiguity.patch"

  cd "${srcdir}/unicorn-${_unicorn_commit}"
  patch -Np1 < "${srcdir}/fix-unicorn-java-link.patch"
}

build() {
  cd "${srcdir}/unicorn-${_unicorn_commit}"
  ./make.sh
  cmake -S bindings/java -B build-java \
    -DUNICORN_HOME="${srcdir}/unicorn-${_unicorn_commit}" \
    -DUNICORN_BUILD="${srcdir}/unicorn-${_unicorn_commit}"
  cmake --build build-java

  cd "${srcdir}/${pkgname}-${pkgver}"
  mvn -Dmaven.repo.local="${srcdir}/m2" \
    -Dmaven.test.skip=true \
    -Dmaven.javadoc.skip=true \
    package
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local jar
  for jar in \
    unidbg-api/target/unidbg-api-${pkgver}.jar \
    unidbg-android/target/unidbg-android-${pkgver}.jar \
    unidbg-ios/target/unidbg-ios-${pkgver}.jar \
    backend/dynarmic/target/unidbg-dynarmic-${pkgver}.jar \
    backend/hypervisor/target/unidbg-hypervisor-${pkgver}.jar \
    backend/kvm/target/unidbg-kvm-${pkgver}.jar \
    backend/unicorn2/target/unidbg-unicorn2-${pkgver}.jar
  do
    install -Dm644 "${jar}" "${pkgdir}/usr/share/java/${pkgname}/${jar##*/}"
  done

  for jar in \
    "${srcdir}/m2/com/github/zhkl0228/unicorn/1.0.15/unicorn-1.0.15.jar" \
    "${srcdir}/m2/org/scijava/native-lib-loader/2.3.5/native-lib-loader-2.3.5.jar" \
    "${srcdir}/m2/com/github/zhkl0228/capstone/3.1.8/capstone-3.1.8.jar" \
    "${srcdir}/m2/net/java/dev/jna/jna/5.10.0/jna-5.10.0.jar" \
    "${srcdir}/m2/com/github/zhkl0228/keystone/0.9.7/keystone-0.9.7.jar" \
    "${srcdir}/m2/commons-codec/commons-codec/1.21.0/commons-codec-1.21.0.jar" \
    "${srcdir}/m2/org/apache/commons/commons-collections4/4.5.0/commons-collections4-4.5.0.jar" \
    "${srcdir}/m2/commons-io/commons-io/2.21.0/commons-io-2.21.0.jar" \
    "${srcdir}/m2/com/alibaba/fastjson/1.2.83/fastjson-1.2.83.jar" \
    "${srcdir}/m2/com/github/zhkl0228/demumble/1.0.4/demumble-1.0.4.jar" \
    "${srcdir}/m2/net/dongliu/apk-parser/2.6.10/apk-parser-2.6.10.jar" \
    "${srcdir}/m2/io/kaitai/kaitai-struct-runtime/0.8/kaitai-struct-runtime-0.8.jar" \
    "${srcdir}/m2/com/googlecode/plist/dd-plist/1.29/dd-plist-1.29.jar" \
    "${srcdir}/m2/org/slf4j/slf4j-api/2.0.16/slf4j-api-2.0.16.jar"
  do
    install -Dm644 "${jar}" "${pkgdir}/usr/share/java/${pkgname}/${jar##*/}"
  done

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/unidbg-java" <<'EOF'
#!/bin/sh
exec java -Djava.library.path=/usr/lib/unidbg -cp "/usr/share/java/unidbg/*${CLASSPATH:+:${CLASSPATH}}" "$@"
EOF

  local jar_path
  install -dm755 "${pkgdir}/usr/lib/unidbg"

  install -Dm644 "${srcdir}/unicorn-${_unicorn_commit}/build-java/libunicorn_java.so" "${pkgdir}/usr/lib/unidbg/libunicorn_java.so"

  jar_path="${srcdir}/m2/com/github/zhkl0228/capstone/3.1.8/capstone-3.1.8.jar"
  bsdtar -xOf "${jar_path}" "linux-x86-64/libcapstone.so" > "${pkgdir}/usr/lib/unidbg/libcapstone.so"
  bsdtar -xOf "${jar_path}" "natives/linux_64/libdisassembler.so" > "${pkgdir}/usr/lib/unidbg/libdisassembler.so"

  jar_path="${srcdir}/m2/com/github/zhkl0228/keystone/0.9.7/keystone-0.9.7.jar"
  bsdtar -xOf "${jar_path}" "linux-x86-64/libkeystone.so" > "${pkgdir}/usr/lib/unidbg/libkeystone.so"

  jar_path="${pkgdir}/usr/share/java/${pkgname}/unidbg-dynarmic-${pkgver}.jar"
  bsdtar -xOf "${jar_path}" "natives/linux_64/libdynarmic.so" > "${pkgdir}/usr/lib/unidbg/libdynarmic.so"

  jar_path="${pkgdir}/usr/share/java/${pkgname}/unidbg-unicorn2-${pkgver}.jar"
  bsdtar -xOf "${jar_path}" "natives/linux_64/libunicorn.so" > "${pkgdir}/usr/lib/unidbg/libunicorn.so"

  chmod 644 "${pkgdir}"/usr/lib/unidbg/*.so
}
