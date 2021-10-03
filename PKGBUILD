#!/bin/bash
# Maintainer  : bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor : Stephen Zhang <zsrkmyn at gmail dot com>
# Contributor : Maël Kerbiriou <m431.kerbiriou@gmail.com>

_fragment="${FRAGMENT:-#branch=master}"

_pkgname=autofdo
pkgname=$_pkgname-git
pkgver=0.1.r174.g963a8c1
pkgrel=1
pkgdesc="a tool to convert perf.data profile to AutoFDO profile that can be used by GCC and LLVM"
arch=('x86_64')
url="https://github.com/google/autofdo"
license=('Apache')
depends=('google-glog' 'protobuf') # common dependencies
depends+=('libelf' 'openssl')      # required by GCC variant
makedepends=('clang' 'cmake' 'git' 'llvm11' 'ninja' 'python')
optdepends=('llvm: for LLVM support')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}${_fragment}"
        "abseil-cpp::git+https://github.com/abseil/abseil-cpp"
        "perf_data_converter::git+https://github.com/google/perf_data_converter"
        "glog::git+https://github.com/google/glog"
        "googletest::git+https://github.com/google/googletest"
)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  git -C "$srcdir/autofdo" config submodule.third_party/abseil.url "$srcdir/abseil-cpp"
  git -C "$srcdir/autofdo" config submodule.third_party/perf_data_converter.url "$srcdir/perf_data_converter"
  git -C "$srcdir/autofdo" config submodule.third_party/glog.url "$srcdir/glog"
  git -C "$srcdir/autofdo" config submodule.third_party/googletest.url "$srcdir/googletest"
  git -C "$srcdir/autofdo" submodule update --init --progress --recursive
}

pkgver() {
	git -C "$srcdir/${_pkgname}" describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
# Note: "-DCMAKE_INSTALL_PREFIX=." must be used, because there is a bug in the basil cmakelist. (check: README.rst)
# Build LLVM variant
	cmake -G Ninja -S "$srcdir/${_pkgname}" -B build_with_llvm \
		-DCMAKE_INSTALL_PREFIX=. \
		-DLLVM_PATH=/usr \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++
	ninja -C build_with_llvm
# Build GCC variant
	cmake -G Ninja -S "$srcdir/${_pkgname}" -B build_without_llvm \
		-DCMAKE_INSTALL_PREFIX=.
	ninja -C build_without_llvm
}

check() {
	ninja -C build_with_llvm test
	ninja -C build_without_llvm test || true
}

package() {
	install -Dm755 -t "$pkgdir"/usr/bin build_with_llvm/{create_llvm_prof,profile_diff,profile_merger,sample_merger}
	install -Dm755 -t "$pkgdir"/usr/bin build_without_llvm/{create_gcov,dump_gcov}
}
