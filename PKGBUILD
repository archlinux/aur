#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Laurent Carlier <lordheavym@gmail.com>
#Credits: circle <az6980522@gmail.com>

pkgname=libclc10-minimal
pkgdesc='Library requirements of the OpenCL C programming language'
url='https://libclc.llvm.org/'
pkgver=10.0.0
pkgrel=1
arch=(x86_64)
license=(MIT)
makedepends=(clang10-minimal llvm10-minimal cmake ninja python gcc12 gcc12-fortran gcc12-libs)
source=(https://github.com/llvm/llvm-project/archive/refs/tags/llvmorg-${pkgver}.tar.gz)

# Both ninja & LIT by default use all available cores. this can lead to heavy stress on systems making them unresponsive.
# It can also happen that the kernel oom killer interferes and kills important tasks.
# A reasonable value for them to avoid these issues appears to be 75% of available cores.
# NINJAFLAGS and LITFLAGS are env vars that can be used to achieve this. They should be set on command line or in files read by your shell on login (like .bashrc ) .
# example for systems with 24 cores
# NINJAFLAGS="-j 20 -l 20"
# LITFLAGS="-j 18"
# NOTE: It's your responbility to validate the value of NINJAFLAGS and LITFLAGS. If unsure, don't set it.

build(){
export CC=/usr/bin/gcc-12
export CXX=/usr/bin/g++-12
export CFLAGS+=" ${CPPFLAGS}"
export CXXFLAGS+=" ${CPPFLAGS}"

  cd ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/opt/llvm10 \
  -DLLVM_CONFIG=/opt/llvm10/bin/llvm-config

  ninja $NINJAFLAGS -C build
}

package(){
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc/build/ install

  install -Dm644 ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc/CREDITS.TXT "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
}

sha256sums=('b81c96d2f8f40dc61b14a167513d87c0d813aae0251e06e11ae8a4384ca15451')

# vim:set ts=8 sts=2 sw=2 et:
