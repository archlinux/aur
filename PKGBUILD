# Maintainer: SimPilotAdamT <adam_tazil@outlook.com>

_name=xpwn
_fork=nyuszika7h
_forkpkgname=$_name-${_fork,,}
pkgname=$_forkpkgname-git
_pkgver=1.1
pkgver=1.1
pkgrel=0
pkgdesc="A cross-platform custom NOR firmware loader and custom IPSW generator for the iPhone"
arch=('x86_64')
url="https://github.com/$_fork/$_name"
license=('GPL3')
depends=('openssl>=3.0.0')
makedepends=('git' 'cmake' 'unzip' 'python')
source=("$_name::git+$url.git"
        "install.py"
        "CMakeLists.txt"
)
sha512sums=('SKIP'
            'c611573896949221e8ade486347a13b547789e370cbb30fee34b5c19ed0509be9d70e86ecad3803562be5f350956ca610bc58cefca786a6f99829e4f1fd92b62'
            'd062f2638b38326c4db7e147f0cc4b3a4e7e64e21ca7c44a99cfbba2355a8370a83e54748221cbec9d426ac22d7a3d3e041cf3af4c1fa26dcb577c0fc3c3fe6d'
)

pkgver() {
  cd "$srcdir"/"$_name"
  __pkgver=$(echo "$_pkgver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)" | rev | cut -c 2- | rev)
  echo "$__pkgver"
}

prepare() {
  rm -rf "$srcdir"/"$_name"/install.py
  rm -rf "$srcdir"/"$_name"/CMakeLists.txt
  mv "$srcdir"/install.py "$srcdir"/"$_name"
  mv "$srcdir"/CMakeLists.txt "$srcdir"/"$_name"
}

build() {
  cd "$srcdir"/"$_name"
  #bash -c "cmake -DOPENSSL_ROOT_DIR=/usr/local/ssl -DOPENSSL_LIBRARIES=/usr/local/ssl/lib ."
  #make libxpwn.a
  #mkdir headers
  #unzip xpwn-modifies-headers.zip -d headers
  if [ ! -d "headers" ]
  then
    mkdir headers
  fi
  python install.py
}

package() {
  mkdir -p "$pkgdir"/usr/local/lib/
  mkdir -p "$pkgdir"/usr/local/include/xpwn
  install -Dm644 "$srcdir"/"$_name"/build/common/libcommon.a "$pkgdir"/usr/local/lib/libcommon.a
  install -Dm644 "$srcdir"/"$_name"/build/ipsw-patch/libxpwn.a "$pkgdir"/usr/local/lib/libxpwn.a
  install -Dm644 "$srcdir"/"$_name"/headers/* "$pkgdir"/usr/local/include/xpwn/
}
