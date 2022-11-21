# Maintainer: SimPilotAdamT <adam_tazil@outlook.com>

_name=xpwn
_fork=nyuszika7h
_forkpkgname=$_name-${_fork,,}
pkgname=$_forkpkgname-git
_pkgver=1
pkgver=1
pkgrel=1
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
            '6f1226a44657885d45c6dd106bcaa63f4d73435df32125abb32b848a652b20b1327372386c72f63baa1e2ba5687cca0ba679456a8723bfed21d7293470591b97'
            'd062f2638b38326c4db7e147f0cc4b3a4e7e64e21ca7c44a99cfbba2355a8370a83e54748221cbec9d426ac22d7a3d3e041cf3af4c1fa26dcb577c0fc3c3fe6d'
)

pkgver() {
  cd "$_name"
  printf "$_pkgver" 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -Dm644 "$srcdir"/"$_name"/common/libcommon.a "$pkgdir"/usr/local/lib/libcommon.a
  install -Dm644 "$srcdir"/"$_name"/ipsw-patch/libxpwn.a "$pkgdir"/usr/local/lib/libxpwn.a
  install -Dm644 "$srcdir"/"$_name"/headers/* "$pkgdir"/usr/local/include/xpwn/
}
