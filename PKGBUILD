# Maintainer: FantomTchi7 <vladislav.kudriashev@gmail.com>
# Based on android-sdk-build-tools by xgdgsc and mynacol

pkgname=android-sdk-build-tools-35
#_ver=$(cat "${srcdir}/$_android/source.properties" |grep ^Pkg.Revision=|sed 's/Pkg.Revision=\([0-9.]*\).*/\1/')
_major=35
_minor=0
_micro=0
_ver=35.0.0
_displayversion=35
pkgver=r35
pkgrel=2
_sdk=android-sdk
_android=android-15

pkgdesc='.NET MAUI compatible build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib' 'bash')
optdepends=('lib32-gcc-libs' 'lib32-zlib' 'java-runtime')

source=("https://dl.google.com/android/repository/build-tools_r${_major}_linux.zip"
        "package.xml")
sha512sums=('b45dc6b7298567f3b45428def0b85584b99b125a3719dfb74a82732bf2b86a0c66161682f3c3d7a50cefaf6e1a2d993975665272e16f00b231a15a9a4512cc1e'
            '501211771b02940010420a4003b8396d3d6599fb339c2f64959335ab1c3cf615811cc62acaa093c9f4e14bbc019a9e493835573a5136383617d8b5184509d3f8')
options=('!strip')

package() {
  cd "$pkgdir"

  install -d usr/share/licenses/$pkgname/
  ln -s /opt/$_sdk/build-tools/$_ver/NOTICE.txt usr/share/licenses/$pkgname/NOTICE.txt
  sed -i "s/@major@/$_major/g;s/@minor@/$_minor/g;s/@micro@/$_micro/g;s/@displayv@/$_displayversion/g;s/@pathv@/$_ver/g" "$srcdir/package.xml"
  install -Dm644 "${srcdir}/package.xml" opt/$_sdk/build-tools/$_ver/package.xml
  ln -s /opt/$_sdk/build-tools/$_ver/package.xml usr/share/licenses/$pkgname/package.xml

  target="opt/$_sdk/build-tools/$_ver"
  mkdir -p "$target"
  cp -r "$srcdir/$_android/"* "$target"
  chmod +Xr -R "$target"

  # Add symlinks to binaries to usr/bin/
  mkdir -p usr/bin/
  # lld is also provided by extra/lld, not creating symlink
  binaries=$(find "${target}" -maxdepth 1 -type f -executable -not -iname lld -printf "%f\n")
  for f in ${binaries[@]}
  do
    ln -s "/$target/$f" "usr/bin/$f"
  done
}
