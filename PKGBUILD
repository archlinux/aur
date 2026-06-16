# Maintainer: kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-FileCopyrightText: 2026 kleines Filmröllchen <kleines at filmroellchen dot eu>
# SPDX-License-Identifier: 0BSD
_pkgarch=riscv64
_target=${_pkgarch}-linux-musl
pkgname=${_target}-cross
pkgver=16.1.0
pkgrel=1
pkgdesc="Static musl-based cross-compilation toolchain via musl-cross-make"
# TODO: test the others: "i686" "aarch64" "riscv64"
arch=("x86_64")
provides=("${_target}-gcc" "${_target}-binutils" "${_target}-g++")
conflicts=("${pkgname}-bin" "${_target}-gcc" "${_target}-binutils" "${_target}-g++")
# use fork with GCC 16 patches
_ghurl="https://github.com/userdocs/musl-cross-make"
# _ghurl="https://github.com/richfelker/musl-cross-make"
url="https://github.com/richfelker/musl-cross-make"
license=("MIT")
options=(!strip staticlibs)
makedepends=("gcc-fortran" "curl" "git" "rsync")
_rev="33aa77d69d36b72e1b4e3f5fa76e53e86037637f"
# _branch="gcc-16.1.0"
source=(
  "git+${_ghurl}#commit=${_rev}"
  "file://config.mak"
)
b2sums=(
  "SKIP"
  "9f023d7b1976c79e247ba33b65e482f924b7c6505b1431d660c6b8346579f2b7c17aa170bec9974c57fdb7e7a2000fa5a10da970e8efcd6cea5ce5c3351e3c74"
)

prepare() {
  cd "${srcdir}/musl-cross-make/"
  ln -sf "${srcdir}/config.mak" config.mak
}

build() {
  cd "${srcdir}/musl-cross-make/"
  # FIXME: need to unset CFLAGS and CXXFLAGS from system, which will mess up the cross-compiler while building musl.
  # unfortunately this means that the cross-compiler itself is not built with optimal settings from makepkg.conf.
  CFLAGS='' CXXFLAGS='' make "TARGET=${_target}"
}

package() {
  cd "${srcdir}/musl-cross-make/"
  make install "TARGET=${_target}" OUTPUT="$(pwd)/out"

  cd out

  # strip binaries with the native tool
  # based on https://gitlab.alpinelinux.org/alpine/aports/-/blob/283dac189ae517c553404a8bd085865c38209383/main/gcc/APKBUILD#L442-448
  STRIP_FOR_TARGET=${_target}/bin/strip
  find . \( -name libgfortran.a -o -name libobjc.a -o -name libgomp.a \
		-o -name libgphobos.a -o -name libgdruntime.a \
		-o -name libgcc.a -o -name libgcov.a -o -name libquadmath.a \
		-o -name libitm.a -o -name libgo.a -o -name libcaf\*.a \
		-o -name libatomic.a -o -name libasan.a -o -name libtsan.a \) \
		-a -type f \
		-exec "${STRIP_FOR_TARGET}" -g {} +

  # cleanup work for install files
  rm -rf share/man/man7 share/locale/ share/gcc-${pkgver}/ usr src lib/bfd-plugins
  # # fix broken absolute link to /lib/libc.so
  ln -sfT ../lib/libc.so ${_pkgarch}-linux-musl/lib/ld-musl-${_pkgarch}.so.1

  mkdir -p "${pkgdir}/usr/"
  cp -r "./" "${pkgdir}/usr/"
}
