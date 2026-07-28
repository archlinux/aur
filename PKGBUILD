# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Martchus <martchus ät gmx dot net>
# Contributor: xgdgsc <xgdgsc @t gmail dot com>
# Contributor: mynacol <dc07d át mynacol dót xyz>

pkgname=android-sdk-build-tools
#_ver=$(cat "${srcdir}/$_android/source.properties" |grep ^Pkg.Revision=|sed 's/Pkg.Revision=\([0-9.]*\).*/\1/')
_major=37
_minor=0
_micro=0
_ver=37
_ver_install=$_ver.$_minor.$_micro
_displayversion=37
pkgver=r37.0.0
pkgrel=2
_sdk=android-sdk
_android=android-37.0

pkgdesc='Build-Tools for Google Android SDK (aapt, aidl, dexdump, dx, llvm-rs-cc)'
arch=('x86_64')
url="https://developer.android.com/studio/releases/build-tools"
license=('custom')
depends=('gcc-libs' 'zlib' 'bash')
optdepends=('lib32-gcc-libs' 'lib32-zlib' 'java-runtime'
            'ncurses5-compat-libs: necessary to run bcc_compat and llvm-rs-cc')
conflicts=('zipalign')
provides=('zipalign')

source=("https://dl.google.com/android/repository/build-tools_r${_ver}_linux.zip"
        "package.xml")
sha512sums=('0c1735b91da1088d824243bef3f5c070ee4d0b9ccc50d2c20d0c5afdeab41a0fd71f785b98d60579091bb48d1a703f9f5ea6775bab4781de51a9df570b9dba98'
            '501211771b02940010420a4003b8396d3d6599fb339c2f64959335ab1c3cf615811cc62acaa093c9f4e14bbc019a9e493835573a5136383617d8b5184509d3f8')
options=('!strip')

package() {
  cd "$pkgdir"

  install -d usr/share/licenses/$pkgname/
  ln -s /opt/$_sdk/build-tools/$_ver/NOTICE.txt usr/share/licenses/$pkgname/NOTICE.txt
  sed -i "s/@major@/$_major/g;s/@minor@/$_minor/g;s/@micro@/$_micro/g;s/@displayv@/$_ver_install/g;s/@pathv@/$_ver_install/g" "$srcdir/package.xml"
  install -Dm644 "${srcdir}/package.xml" opt/$_sdk/build-tools/$_ver_install/package.xml
  ln -s /opt/$_sdk/build-tools/$_ver_install/package.xml usr/share/licenses/$pkgname/package.xml

  target="opt/$_sdk/build-tools/$_ver_install"
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
