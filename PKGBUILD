# Maintainer: bageljr <bageljr 897 at protonmail dot com>
# Maintainer: dmitmel <dmytro dot meleshko at gmail dot com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb
_pkgname="$pkgname"
pkgver=1.11.5
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
sha256sums=('87ff4a444dbd0c6c9bcf1ac5527485355a400e9bee2386d7b0d33c70eeca188e')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS="-mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security"
  # Doesn't build with -fno-plt
  cd "$_pkgname-$pkgver/"
  cmake -B build -DLLDB_PACKAGE=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  cmake --build build --target adapter
}

package() {
  cd "$_pkgname-$pkgver"
  local libdir="$pkgdir/usr/lib/$_pkgname"

  (
    cd build
    shopt -s globstar nullglob

    # Files that need to be installed:
    # https://github.com/vadimcn/codelldb/blob/v1.11.0/CMakeLists.txt#L200-L213

    install -Dm644 -t "$libdir" platform.ok

    local file; for file in adapter/codelldb adapter/*.so; do
      install -Dm755 "$file" "$libdir/$file"
    done

    local file; for file in adapter/scripts/**/*.py formatters/**/*.py; do
      install -Dm644 "$file" "$libdir/$file"
    done
  )

  install -d "$libdir"/lldb
  ln -s -t "$libdir"/lldb /usr/{bin,lib}

  install -d "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin /usr/lib/"$_pkgname"/adapter/codelldb

  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
}
