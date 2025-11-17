# Maintainer:
# Contributor: VoodaGod <l33tjas.0n@gmail.com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>

_pkgname="dxvk"
pkgname="$_pkgname-async-git"
pkgver=2.7.1.r231.g3924944
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 - Windows DLL version"
url="https://gitlab.com/Ph42oN/dxvk-gplasync/"
license=('Zlib')
arch=('x86_64')

depends=(
  'bash'
  'vulkan-icd-loader'
)
makedepends=(
  'git'
  'glslang'
  'meson'
  'mingw-w64-gcc'
  'wine'
)
optdepends=(
  'lib32-vulkan-icd-loader: for 32-bit support'
)

provides=("dxvk=$pkgver")
conflicts=('dxvk')

options=('!strip' '!buildflags')

_pkgsrc="$_pkgname"
_dxvk_gplasync="dxvk-gplasync-master-$(\date +%Y%m%d.%H)"
source=(
  "$_pkgsrc"::"git+https://github.com/doitsujin/dxvk.git"
  "$_dxvk_gplasync.patch"::"https://gitlab.com/Ph42oN/dxvk-gplasync/-/raw/main/patches/dxvk-gplasync-master.patch"
  'setup_dxvk.sh' # from aur/dxvk-bin
)
sha256sums=(
  'SKIP'
  'SKIP'
  '1feb5c6cfd0f97402893f4bef3496b07ee76438c3b50a0d4b58aeb5c3c27bc82'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1

  patch -Np1 -F100 -i "$srcdir/$_dxvk_gplasync.patch"
}

build() {
  local _meson_args=(
    --buildtype=release
    --bindir "" --libdir ""
    --strip
  )

  local _meson_x64=(
    "${_meson_args[@]}"
    --cross-file "$_pkgsrc"/build-win64.txt
    --prefix "/usr/share/dxvk/x64"
    "$_pkgsrc" "build/x64"
  )

  local _meson_x32=(
    "${_meson_args[@]}"
    --cross-file "$_pkgsrc"/build-win32.txt
    --prefix "/usr/share/dxvk/x32"
    "$_pkgsrc" "build/x32"
  )

  echo "### Building dxvk for win64..."
  arch-meson "${_meson_x64[@]}"
  meson compile -C build/x64

  echo "### Building dxvk for win32..."
  arch-meson "${_meson_x32[@]}"
  meson compile -C build/x32
}

package() {
  meson install -C build/x32 --destdir "$pkgdir"
  meson install -C build/x64 --destdir "$pkgdir"

  find "$pkgdir" -name "*.dll.a" -delete

  install -Dm755 "setup_dxvk.sh" "$pkgdir/usr/share/dxvk/setup_dxvk.sh"

  mkdir -pm755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/dxvk/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk"

  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
