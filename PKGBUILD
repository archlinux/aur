# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=unidbg
pkgver=0.9.9
pkgrel=1
pkgdesc="Android native library emulator with experimental iOS emulation"
arch=('any')
url="https://github.com/zhkl0228/unidbg"
license=('Apache-2.0')
depends=('java-runtime>=8')
makedepends=('java-environment>=17' 'maven')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  "java-module-ambiguity.patch"
)
sha256sums=('155412c3f65adf7170ce21250f8641023c204f71ef72207fa5a47cfc2650d988'
            '951e4900542437416c50bea90e18fc4e3f432fc00d57d9e4e114ec6cf421fbd1')

latestver() {
  gh api --paginate repos/zhkl0228/unidbg/releases --jq \
    '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
    sed -nE 's/^v([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 < "${srcdir}/java-module-ambiguity.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  mvn -Dmaven.repo.local="${srcdir}/m2" \
    -Dmaven.test.skip=true \
    -Dmaven.javadoc.skip=true \
    package
}

package() {
  cd "${pkgname}-${pkgver}"

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
}
