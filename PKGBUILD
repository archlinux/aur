#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname='python2-fbx-sdk'
pkgver=2016.1.1
pkgrel=1
pkgdesc='Platform and API toolkit to transfer existing content into the FBX format, Python binding.'
arch=('i686' 'x86_64')
url='http://www.autodesk.com/products/fbx/overview'
license=('custom')
install='python2-fbx-sdk.install'
depends=('python2' 'fbx-sdk')
_verstr=`echo ${pkgver:0:4}${pkgver:5} | sed 's/\./_/g'`
source=("http://download.autodesk.com//us/fbx_release_older/${pkgver}/fbx${_verstr}_fbxpythonsdk_linux.tar.gz")
md5sums=('4d810f459c47611a6cb4c7d26292b682')

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

