# Maintainer: bageljr <bageljr 897 at protonmail dot com>
# Contributor: dmitmel <dmytro dot meleshko at gmail dot com>
# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb
_pkgname="$pkgname"
pkgver=1.9.1
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=(x86_64 arm7h aarch64)
url="https://github.com/vadimcn/codelldb"
license=(MIT)
provides=("$_pkgname" "vscode-lldb")
depends=(lldb)
makedepends=(cmake cargo npm python libc++)
options=(!debug strip) #Debug package is broken
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3a9e17f93a298e693a43509264358506f6a0572ece05482f73374068981ea84')

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS="-mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security"
  # Doesn't build with -fno-plt
  cd "$_pkgname-$pkgver/"
  cmake -B build -DLLDB_PACKAGE=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  cmake --build build --target adapter
}

package() {
  local reset_shopt="$(shopt -p globstar)"
  shopt -s globstar

  cd "$_pkgname-$pkgver"
  local libdir="$pkgdir/usr/lib/$_pkgname"

  #https://github.com/vadimcn/codelldb/blob/v1.9.0/CMakeLists.txt#L187-L200
  install -Dm644 -t "$libdir"             build/platform.ok
  install -Dm755 -t "$libdir"/adapter     build/adapter/{codelldb,*.so}
  install -Dm644 -t "$libdir"/adapter     build/adapter/scripts/**/*.py
  install -Dm644 -t "$libdir"/formatters  build/formatters/**/*.py

  install -d "$libdir"/lldb
  ln -s -t "$libdir"/lldb /usr/{bin,lib}

  install -d "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin /usr/lib/"$_pkgname"/adapter/codelldb

  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
  eval "$reset_shopt"
}
