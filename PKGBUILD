# Maintainer: Nicolas Lesser <blitzrakete [at] gmail [dot] com>
pkgname=cppcoro-git
pkgver=r362.99bb7f8
pkgrel=2
pkgdesc="C++ coroutine abstractions for the coroutines TS"
arch=(any)
url="https://github.com/lewissbaker/cppcoro"
license=('MIT')
options=('!strip')
makedepends=('git' 'clang' 'llvm' 'lld' 'libc++' 'python2' 'python2-setuptools')
source=("git+https://github.com/lewissbaker/cppcoro"
        "git+https://github.com/lewissbaker/cake"
        "disable-broken-test.patch")
md5sums=('SKIP'
         'SKIP'
         '3e2058eff2585767b7224992cbdd7a1d')

pkgver() {
  cd "${srcdir}/cppcoro"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/cppcoro"

  # Get custom build tool 'cake'
  git submodule init
  git config submodule.cake.url "${srcdir}/cake"
  git submodule update
  # Initialize cake so that it's available
  source init.sh

  patch -p0 --strip=1 -i "${srcdir}/disable-broken-test.patch"
  rm -rf build
}

build() {
  cd "${srcdir}/cppcoro"
  cake release=optimised lib/build.cake
}

check() {
  cd "${srcdir}/cppcoro"
  cake release=optimised test/build.cake
}

package() {
  cd "${srcdir}/cppcoro"
  mkdir -p "${pkgdir}/usr/include"

  cp -r "include/cppcoro" "${pkgdir}/usr/include/"
  chmod -R 644 "${pkgdir}/usr/include/cppcoro/"
  install -D -m644 "build/linux_x64_clang8.0.0_optimised/lib/libcppcoro.a" -t "${pkgdir}/usr/lib/"
  install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/cppcoro-git"
}
