#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# prev-Maintainer: Raimar Sandner <raimar.sandner@uibk.ac.at>

pkgname=cppqed-git
pkgver=2.100.8.r285.g81b6de02
pkgrel=1
pkgdesc="Highly flexible framework for simulating open quantum dynamics."
arch=(i686 x86_64)
url=http://cppqed.sourceforge.net
license=(custom)
depends=(boost-libs blitz flens python python-numpy python-scipy gsl)
makedepends=(git cmake ninja clang boost)
provides=(cppqed)
conflicts=(cppqed)
source=("${pkgname}"::git+https://github.com/vukics/cppqed
        "blitz-cppqed::git+https://github.com/vukics/blitz"
        "pcg-cpp::git+https://github.com/vukics/pcg-cpp"
        "Xoshiro-cpp::git+https://github.com/vukics/Xoshiro-cpp"
        "cmake_GetGitRev.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f1bcc9fe4cc8accb76a2c3825b633c19f68ba995db3f9e42d89834b72d038bef')

prepare() {
  git -C "${srcdir}/${pkgname}" apply -v "${srcdir}"/cmake_GetGitRev.patch
  git -C "${srcdir}/${pkgname}" config submodule.blitz.url "${srcdir}"/blitz-cppqed
  git -C "${srcdir}/${pkgname}" config submodule.CPPQEDutils/thirdPartyRandom/pcg-cpp.url "${srcdir}"/pcg-cpp
  git -C "${srcdir}/${pkgname}" config submodule.CPPQEDutils/thirdPartyRandom/Xoshiro-cpp.url "${srcdir}"/Xoshiro-cpp
  git -C "${srcdir}/${pkgname}" -c protocol.file.allow=always submodule update --init --recursive --remote
}

pkgver() {
  git -C "${srcdir}/${pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  CXXFLAGS+=" -DBOOST_BIND_GLOBAL_PLACEHOLDERS -std=c++17"
  CFLAGS+=" -DBOOST_BIND_GLOBAL_PLACEHOLDERS"
  cmake \
  -S "${srcdir}/${pkgname}" \
  -B build \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++
# shellcheck disable=SC2086 # expand multiple flags passed in MAKEFLAGS
  ninja -C build ${MAKEFLAGS:--j1}
}

check() {
  ninja -C build ${MAKEFLAGS:--j1} test || true
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${srcdir}"/${pkgname}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
