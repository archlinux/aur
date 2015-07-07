#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python2-fbx-sdk'
pkgver=2015.1
pkgrel=1
pkgdesc='Platform and API toolkit to transfer existing content into the FBX format, Python binding.'
arch=('i686' 'x86_64')
url='http://www.autodesk.com/products/fbx/overview'
license=('custom')
install='python2-fbx-sdk.install'
depends=('python2' 'fbx-sdk')
#_verstr="${pkgver:0:4}${pkgver:5:1}_${pkgver:7:1}"
_verstr="${pkgver:0:4}${pkgver:5:1}"
source=("http://images.autodesk.com/adsk/files/fbx${_verstr}_fbxpythonsdk_linux.tar.gz")
md5sums=('6cc89bc9532449c7c95c27cd0f2e881c')

build() {
  cd "$srcdir"

  rm -rf "fbx-sdk"
  mkdir "fbx-sdk"
  chmod +x "./fbx${_verstr}_fbxpythonsdk_linux"
  printf "yes\nn\n" | "./fbx${_verstr}_fbxpythonsdk_linux" "$srcdir/fbx-sdk"
}

package() {
  cd "$srcdir/fbx-sdk"

  if [ "$CARCH" = "x86_64" ]; then
    fbxarch="x64"
  else
    fbxarch="x86"
  fi

  target="$pkgdir/`python2 -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()'`"
  install -D "lib/Python27_ucs4_$fbxarch/FbxCommon.py" "$target/FbxCommon.py"
  install -D "lib/Python27_ucs4_$fbxarch/fbxsip.so" "$target/fbxsip.so"
  install -D "lib/Python27_ucs4_$fbxarch/fbx.so" "$target/fbx.so"

  install -d "$pkgdir/usr/share/doc/fbx-sdk/python"
  cp -r samples "$pkgdir/usr/share/doc/fbx-sdk/python"
  install -D "License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

