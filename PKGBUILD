# Maintainer: Aaron McDaniel (mcd1992) <'aur' at the domain 'fgthou.se'>

pkgname=kaitai-struct-compiler-git
pkgver=0.8.r56.g078d45b
pkgrel=1
pkgdesc='Kaitai Struct Compiler: Compiler for the Kaitai declarative binary format parsing language'
url='http://kaitai.io'
arch=('x86_64')
license=('GPL')
depends=('scala' 'java-runtime')
makedepends=('git' 'sbt' 'unzip' 'ruby-rdoc')
optdepends=()
backup=()
source=("${pkgname}::git+https://github.com/kaitai-io/kaitai_struct.git")
md5sums=('SKIP')
provides=('kaitai-struct-compiler')
conflicts=('kaitai-struct-compiler')

pkgver() {
  cd ${pkgname}
  # Remove 'v' prefix on tags; prefix revision with 'r'; replace all '-' with '.'
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname}

  # Pull in compiler and example formats submodules
  git submodule update --init compiler/ formats/
}

build() {
  # Build the kaitai-compiler
  cd "${srcdir}/${pkgname}/compiler"
  sbt compilerJVM/universal:packageBin
}

package() {
  cd "${pkgdir}"
  mkdir -p "usr/share/${pkgname}/"

  # Unzip the compiler universal .zip into a temporary directory
  unzip "${srcdir}/${pkgname}/compiler/jvm/target/universal/kaitai-struct-compiler-*.zip" -d compiler-unzip

  # Copy all files out of the unzip directory into compiler-tmp/
  mkdir -p compiler-tmp/
  cp -a compiler-unzip/kaitai-struct-compiler-*/* "compiler-tmp/"

  # Install ksy files into usr/share
  mv "compiler-tmp/formats" "usr/share/${pkgname}/"

  # Install java jar / classes
  mkdir -p "${pkgdir}/usr/share/java/kaitai-struct-compiler/"
  mv compiler-tmp/lib/*.jar "${pkgdir}/usr/share/java/kaitai-struct-compiler/"

  # Install binaries
  mkdir -p "${pkgdir}/usr/bin/"
  mv compiler-tmp/bin/* "${pkgdir}/usr/bin/"

  # Patch kaitai-struct-compiler binary to point to system lib instead of installdir lib
  sed -ir 's/^declare -r lib_dir=.*/declare -r lib_dir="\/usr\/share\/java\/kaitai-struct-compiler"/' "${pkgdir}/usr/bin/kaitai-struct-compiler"

  # Remove temporary directories
  rm -rf "${pkgdir}/compiler-unzip"
  rm -rf "${pkgdir}/compiler-tmp"

  # Cleanup unused files
  find "${pkgdir}" -type f -iname "*.bat" -delete
}
