# Maintainer: bageljr <bageljr 897 at protonmail dot com>
# Maintainer: dmitmel <dmytro dot meleshko at gmail dot com>
# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=codelldb-git
_pkgname="${pkgname%-git}"
pkgver=v1.10.1.r1174.fe108b5
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=(x86_64 arm7h aarch64)
url=https://github.com/vadimcn/codelldb
license=(MIT)
provides=("$_pkgname" "vscode-lldb")
depends=(lldb)
makedepends=(cmake cargo npm python libc++ git)
options=(!debug strip) #Debug package is broken
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s"\
    "$(git describe --tags | cut -d"-" -f1)"\
    "$(git rev-list --count HEAD)"\
    "$(git rev-parse --short HEAD)"
}

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
  cd "$_pkgname"
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
