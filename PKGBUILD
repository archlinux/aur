# Maintainer: soloturn@gmail.com

_basename=java-cef
pkgname="$_basename-git"
pkgver=r285.23a6e96
pkgrel=1
pkgdesc="Java Chromium Embedded Framework (JCEF). A simple framework for embedding Chromium-based browsers in other applications using the Java programming language."
arch=('x86_64')
url="https://bitbucket.org/chromiumembedded/java-cef/src/master/"
license=('BSD')
groups=()
depends=('java-environment=11')
makedepends=('cmake' 'git' 'ninja')
provides=('java-cef')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(
  "$pkgname::git://github.com/chromiumembedded/$_basename.git"
  "0001-update-gsutil-for-python3-compatibility.patch"
)
noextract=()
md5sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd ${pkgbase}
  mkdir -p jcef_build
  patch -p1 -i "${srcdir}/0001-update-gsutil-for-python3-compatibility.patch"
}

build() {
  cd "${pkgbase}/jcef_build"
  cmake .. -GNinja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
#  cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
#  make -j4
  cd ../tools
  ./compile.sh linux64
  ./make_distrib.sh linux64
  # to test run can be called on the command line, it opens a browser window
  # ./run.sh
}

package() {
  cd "${pkgbase}"
  mkdir ${pkgdir}/opt/
  mv binary_distrib/linux64 "${pkgdir}/opt/java-cef"
}

# vim:set ts=2 sw=2 et:

