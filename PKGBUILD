#_     _            _                                _____
#| |__ | | __ _  ___| | ___ __ ___   ___   ___  _ __ |___ /
#| '_ \| |/ _` |/ __| |/ / '_ ` _ \ / _ \ / _ \| '_ \  |_ \
#| |_) | | (_| | (__|   <| | | | | | (_) | (_) | | | |___) |
#|_.__/|_|\__,_|\___|_|\_\_| |_| |_|\___/ \___/|_| |_|____/

#Maintainer: blackmoon3 <https://github.com/blacksky3>
#Credits: Laurent Carlier <lordheavym@gmail.com>
#Credits: circle <az6980522@gmail.com>

pkgname=libclc11-minimal
pkgdesc='Library requirements of the OpenCL C programming language'
url='https://libclc.llvm.org/'
pkgver=11.0.0
pkgrel=1
arch=(x86_64)
license=(MIT)
makedepends=(clang11-minimal llvm11-minimal cmake ninja python git gcc12 gcc12-fortran gcc12-libs)
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
  -DCMAKE_INSTALL_PREFIX=/opt/llvm11 \
  -DLLVM_CONFIG=/opt/llvm11/bin/llvm-config

  ninja $NINJAFLAGS -C build
}

package(){
  DESTDIR="$pkgdir" ninja $NINJAFLAGS -C ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc/build/ install

  install -Dm644 ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc/LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ${srcdir}/llvm-project-llvmorg-${pkgver}/libclc/CREDITS.TXT "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
}

sha256sums=('8ad4ddbafac4f2c8f2ea523c2c4196f940e8e16f9e635210537582a48622a5d5')
