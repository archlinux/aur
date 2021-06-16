pkgname=libclc12-git
pkgver=12.0.1_rc1+30+gf78f530bd384
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
provides=('libclc')
conflicts=('libclc')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('clang' 'llvm' 'cmake' 'ninja' 'python' 'git'
  'spirv-llvm-translator')

_gitbranch="release/12.x"
source=("llvm-project::git+https://github.com/llvm/llvm-project.git#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {

  cd "${srcdir:?}/llvm-project" || (
    echo -e "\E[1;31mCan't cd to ${srcdir}/llvm-project directory! PkgVer Failed! \E[0m"
    exit 1
  )

  _gitdesc=$(git describe --long --tags)
  if [[ "${_gitdesc}" =~ "rc" ]]; then
    _gitdesc="_$(echo "${_gitdesc}" | cut -f3-5 -d- | tr '-' '+')"
  else
    _gitdesc="+$(echo "${_gitdesc}" | cut -f3-4 -d- | tr '-' '+')"
  fi

  echo "$(
    sed -nE "/LLVM_VERSION_MAJOR/{:a;N;/LLVM_VERSION_SUFFIX/Ta};0,/LLVM_VERSION_MAJOR/D;p" \
      llvm/CMakeLists.txt |
      grep -oP "\d+" |
      xargs | tr ' ' '.'
  )${_gitdesc}"

}

prepare() {

  cd "${srcdir:?}/llvm-project/libclc" || (
    echo -e "\E[1;31mCan't cd to ${srcdir}/llvm-project/libclc directory! Prepare Failed! \E[0m"
    exit 1
  )

  mkdir -p build

}

build() {

  cd "${srcdir:?}/llvm-project/libclc/build" || (
    echo -e "\E[1;31mCan't cd to ${srcdir}/llvm-project/libclc/build directory! Build Failed! \E[0m"
    exit 1
  )

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja

}

package() {

  cd "${srcdir:?}/llvm-project/libclc/build" || (
    echo -e "\E[1;31mCan't cd to ${srcdir}/llvm-project/libclc/build directory! Package Failed! \E[0m"
    exit 1
  )

  DESTDIR="${pkgdir:?}" ninja install
  install -Dm644 ../LICENSE.TXT "${pkgdir:?}/usr/share/licenses/${pkgname}/LICENSE"

}
