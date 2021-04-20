# Maintainer: Marc Plano-Lesay <kernald@enoent.fr>
# Based on android-sdk-build-tools by xgdgsc and mynacol

pkgname=android-sdk-build-tools-30.0.1
pkgver=r30.0.1
pkgrel=1
pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('i686' 'x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib')
optdepends=('lib32-gcc-libs' 'lib32-zlib')

source=("https://dl-ssl.google.com/android/repository/build-tools_${pkgver}-linux.zip")
sha256sums=('560eace2cc6ca16011fbb97c92c39aa0441d54dbfc13837dfbdb4a6bdf9c9da8')
options=('!strip')

_sdk=android-sdk
_android=android-11

package() {
  cd "$pkgdir"

  install -Dm644 "${srcdir}/$_android/NOTICE.txt" usr/share/licenses/$pkgname/NOTICE.txt

  target="opt/$_sdk/build-tools/$_ver"
  mkdir -p "$target"
  cp -r "$srcdir/$_android/"* "$target"
  chmod +Xr -R "$target"

  # Add symlinks to binaries to usr/bin/
  mkdir -p usr/bin/
  # lld is also provided by extra/lld, not creating symlink
  binaries=("aapt" "aapt2" "aidl" "apksigner" "bcc_compat" "d8" "dexdump" "dx" "llvm-rs-cc" "mainDexClasses" "split-select" "zipalign")
  for f in "${binaries[@]}"
  do
    ln -s "/$target/$f" "usr/bin/$f"
  done
}
