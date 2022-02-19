pkgname=android-ndk-22-ollvm
pkgver=r22.b
pkgrel=1
pkgdesc='Android C/C++ developer kit with obfuscated llvm'
arch=('x86_64')
url='https://github.com/heroims/obfuscator/wiki'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=("etc/profile.d/$pkgname.sh")
install="$pkgname.install"
replaces=('android-ndk64-ollvm')
depends=('glibc')
optdepends=(
  'ncurses5-compat-libs: for using gdb'
  'python2: various helper scripts'
  'python: various helper scripts'
)
source=("$pkgname.sh"
        "git+https://github.com/heroims/obfuscator.git#branch=llvm-12.x")
source_x86_64=("https://dl.google.com/android/repository/android-ndk-${pkgver/./}-linux-x86_64.zip")
# SHA1 sums is kept to follow upstream releases https://github.com/android-ndk/ndk/issues/673
sha1sums=('e1b785a0bb757604f67abd98831f24bb187173fa'
          'SKIP')
sha1sums_x86_64=('9ece64c7f19763dd67320d512794969930fce9dc')
sha256sums=('019f0d0b9c58b4969356b3d9c837ed04f2ad6f67eb900f48b9dc5d38f198b61a'
            'SKIP')
sha256sums_x86_64=('ac3a0421e76f71dd330d0cd55f9d99b9ac864c4c034fc67e0d671d022d4e806b')

build() {
  mkdir build
  
  cmake -B build -S "${srcdir}/obfuscator/llvm" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_PROJECTS="clang;lld" \
    -DLLVM_ENABLE_LLD=ON \
    -DLLVM_STATIC_LINK_CXX_STDLIB=ON \
    -DLLVM_TARGETS_TO_BUILD="ARM;AArch64;X86"
  
  cmake --build build
  
  cmake --install build --prefix "android-ndk-${pkgver/./}/toolchains/llvm/prebuilt/linux-x86_64/"
}

package() {
  install -Ddm755 "$pkgdir/opt"
  mv "android-ndk-${pkgver/./}" "$pkgdir/opt/android-ndk-ollvm"

  install -Dm644 $pkgname.sh -t "$pkgdir/etc/profile.d/"

  # make sdkmanager and gradle recognize NDK
  install -Ddm755 "$pkgdir"/opt/android-sdk
  ln -s /opt/android-ndk-ollvm "$pkgdir"/opt/android-sdk/ndk-bundle
}
