# Maintainer: Arpan Kapoor <a@arpankapoor.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

_pkgname=compiler-rt
pkgname="${_pkgname}90"
pkgver=9.0.1
pkgrel=1
pkgdesc="Compiler runtime libraries for clang"
arch=('x86_64')
url="https://compiler-rt.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('gcc-libs')
makedepends=('llvm90' 'cmake' 'ninja' 'python')
# Build 32-bit compiler-rt libraries on x86_64 (FS#41911)
makedepends_x86_64=('lib32-gcc-libs')
options=('staticlibs')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/$_pkgname-$pkgver.src.tar.xz{,.sig}
        sanitizer_platform_limits_posix.patch)
sha256sums=('c2bfab95c9986318318363d7f371a85a95e333bc0b34fbfa52edbd3f5e3a9077'
            'SKIP'
            '2bbc6eba809cf778fb5cdfada924b4097bea10eef1c25d8073a2d1fb3b0d2012')
validpgpkeys+=('B6C8F98282B944E3B0D5C2530FC3042E345AD05D') # Hans Wennborg <hans@chromium.org>
validpgpkeys+=('474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

prepare() {
  cd compiler-rt-$pkgver.src
  mkdir -p build

  # from https://708430.bugs.gentoo.org/attachment.cgi?id=618030
  patch -Np2 -i ../sanitizer_platform_limits_posix.patch
}

build() {
  cd compiler-rt-$pkgver.src/build

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm90 \
    -DCMAKE_SKIP_RPATH=ON \
    -DCOMPILER_RT_INSTALL_PATH=/opt/llvm90/lib/clang/$pkgver

  ninja
}

package() {
  cd compiler-rt-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
