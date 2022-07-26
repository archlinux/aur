# Maintainer: bageljr <bageljr 897 at protonmail dot com>
# Contributor: dmitmel <dmytro dot meleshko at gmail dot com>
# Maintainer: Mahor1221 <mahor1221 at pm dot me>

pkgname=codelldb-git
_pkgname="${pkgname%-git}"
_reponame=vscode-lldb
pkgver=v1.7.3.r1032.557451d
pkgrel=1
pkgdesc="A native debugger extension for VSCode based on LLDB. Also known as vscode-lldb (NOT lldb-vscode)"
arch=("x86_64" "arm7h" "aarch64")
url="https://github.com/vadimcn/$_reponame"
license=("MIT")
provides=("$_pkgname" "$_reponame")
depends=(lldb)
makedepends=(git cmake cargo npm python)
options=(!debug strip) #Debug package is broken
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_reponame"
  printf "%s.r%s.%s"\
    "$(git describe --tags | cut -d"-" -f1)"\
    "$(git rev-list --count HEAD)"\
    "$(git rev-parse --short HEAD)"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CFLAGS="-mtune=generic -O2 -pipe -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -Wformat -Werror=format-security"
  # Doesn't build with -fno-plt
  cd "$_reponame"
  cmake -B build -DLLDB_PACKAGE=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  cmake --build build --target codelldb
}

package() {
  local reset_shopt="$(shopt -p globstar)"
  shopt -s globstar

  cd "$_reponame"
  local _lib_dir="$pkgdir/usr/lib/$_pkgname"

  # <https://github.com/vadimcn/vscode-lldb/blob/v1.7.0/CMakeLists.txt#L173-L186>
  install -Dm644 -t "$_lib_dir" build/platform.ok
  install -Dm755 -t "$_lib_dir"/adapter build/adapter/{codelldb,*.so}
  install -Dm644 -t "$_lib_dir"/adapter build/adapter/*.py
  install -Dm644 -t "$_lib_dir"/formatters build/formatters/**/*.py

  install -d "$_lib_dir"/lldb
  ln -s -t "$_lib_dir"/lldb /usr/{bin,lib}

  install -d "$pkgdir"/usr/bin
  ln -s -t "$pkgdir"/usr/bin /usr/lib/"$_pkgname"/adapter/codelldb

  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$_pkgname" LICENSE
  eval "$reset_shopt"
}
