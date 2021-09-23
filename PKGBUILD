# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_binver=1.5.31

pkgname=kotlin-native-bin
pkgver=1.5.31
pkgrel=2
pkgdesc="An LLVM based backend for the Kotlin compiler and native implementation of the Kotlin standard library"
arch=('x86_64')
url="https://kotlinlang.org/"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
# 1. For 'java-environment>=8':
# https://kotlinlang.org/docs/native-command-line-compiler.html
# > While the output of the compiler does not have any dependencies or virtual
# > machine requirements, the compiler itself requires
# > [Java 1.8 or higher runtime](https://jdk.java.net/11/).
# 2. For 'ncurses5-compat-libs':
# https://youtrack.jetbrains.com/issue/KT-42693
# via https://github.com/JetBrains/kotlin-native/issues/2674
# This dependency should be removed in 1.6.0 release.
depends=('java-environment>=8' 'ncurses5-compat-libs')
optdepends=(
  'lldb: for konan-lldb'
)
provides=('kotlin-native')
conflicts=('kotlin-native' 'kotlin-native-git')
source=(
  "https://github.com/JetBrains/kotlin/releases/download/v${pkgver}/kotlin-native-linux-x86_64-${_binver}.tar.gz"
)
sha256sums=(
  '636b7e9e54eefa3fa1d284677a8ec2271d0f98b024a8a60127ef20a3badaae03'
)

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"

  cp -r "kotlin-native-linux-x86_64-${_binver}" "${pkgdir}/usr/lib/kotlin-native"
  # Fix permissions for some files, e.g. /usr/lib/kotlin-native/klib/common/stdlib/ir/ir_tables/*.knt
  chmod -R +r "${pkgdir}/usr/lib/kotlin-native"

  ln -s /usr/lib/kotlin-native/bin/kotlinc-native "${pkgdir}/usr/bin/kotlinc-native"
  ln -s /usr/lib/kotlin-native/bin/konanc "${pkgdir}/usr/bin/konanc"
  ln -s /usr/lib/kotlin-native/bin/konan-lldb "${pkgdir}/usr/bin/konan-lldb"
  ln -s /usr/lib/kotlin-native/bin/klib "${pkgdir}/usr/bin/klib"
  ln -s /usr/lib/kotlin-native/bin/cinterop "${pkgdir}/usr/bin/cinterop"
  ln -s /usr/lib/kotlin-native/bin/jsinterop "${pkgdir}/usr/bin/jsinterop"
  ln -s /usr/lib/kotlin-native/bin/run_konan "${pkgdir}/usr/bin/run_konan"
  ln -s /usr/lib/kotlin-native/bin/generate-platform "${pkgdir}/usr/bin/generate-platform"
}
