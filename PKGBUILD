plainname=kotlin-native
pkgname="$plainname-git"
pkgver=r2571.56c1f2b0
pkgrel=1
pkgdesc="A LLVM backend for the Kotlin compiler"
arch=('x86_64')
url="https://github.com/JetBrains/kotlin-native"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
depends=('java-environment' 'ncurses5-compat-libs')
source=("git+https://github.com/JetBrains/kotlin-native.git")
sha512sums=('SKIP')

pkgver() {
  cd "$plainname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $plainname
  ./gradlew dependencies:update
}

build() {
  cd $plainname
  ./gradlew dist
}

package() {
  mkdir -p ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin
  cp -R ${plainname}/dist ${pkgdir}/opt/kotlin-native
  chmod 755 ${pkgdir}/opt/kotlin-native
  ln -s /opt/kotlin-native/bin/kotlinc-native ${pkgdir}/usr/bin/kotlinc-native
  ln -s /opt/kotlin-native/bin/konanc ${pkgdir}/usr/bin/konanc
  ln -s /opt/kotlin-native/bin/cinterop ${pkgdir}/usr/bin/cinterop
  ln -s /opt/kotlin-native/bin/run_konan ${pkgdir}/usr/bin/run_konan
}
