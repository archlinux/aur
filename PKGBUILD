# Maintainer:
# Contributor: VoodaGod <l33tjas.0n@gmail.com>
# Contributor: Andrius Lukosevicius <niobium93@gmail.com>
# Contributor: giantdwarf <17hoehbr@gmail.com>

_pkgname="dxvk"
pkgname="$_pkgname-async-git"
pkgver=2.4.1.r422.g62970d2
pkgrel=1
pkgdesc="A Vulkan-based compatibility layer for Direct3D 9/10/11 - Windows DLL version)"
url="https://gitlab.com/Ph42oN/dxvk-gplasync/"
license=('Zlib')
arch=('x86_64')

depends=(
  'lib32-vulkan-icd-loader'
  'vulkan-icd-loader'
)
makedepends=(
  'git'
  'glslang'
  'meson'
  'mingw-w64-gcc'
  'wine'
)

provides=(
  'd9vk'
  "dxvk=$pkgver"
)
conflicts=(
  'd9vk'
  'dxvk'
)

options=('!strip' '!buildflags' 'staticlibs')

backup=('etc/environment.d/dxvk-async-env.conf')

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+https://github.com/doitsujin/dxvk.git"
  "git+https://github.com/Joshua-Ashton/mingw-directx-headers.git"
  "git+https://github.com/KhronosGroup/Vulkan-Headers.git"
  "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
  "git+https://gitlab.com/Ph42oN/dxvk-gplasync.git"
  "dxvk-async-env.conf"
  "setup_dxvk.sh"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  '2bce3bf5dc5a3c7312bbaae96daf82e0fe6c370e96017ce5a0c49f40901866e3'
  '0f688815530ab5e8cc89b9b45d9b1d66cd8cd5a7770fb8249339af555a30dfe7'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "$_pkgsrc"

  git submodule init include/{native/directx,vulkan,spirv}
  git config submodule.include/native/directx.url "$srcdir/mingw-directx-headers"
  git config submodule.include/vulkan.url "$srcdir/Vulkan-Headers"
  git config submodule.include/spirv.url "$srcdir/SPIRV-Headers"
  git -c protocol.file.allow=always submodule update include/{native/directx,vulkan,spirv}

  patch -Np1 -F100 -i "$srcdir/dxvk-gplasync/patches/dxvk-gplasync-master.patch"
}

build() {
  local _meson_args=(
    --buildtype=release
    --bindir "" --libdir ""
    --strip
  )

  local _meson_x64=(
    --cross-file "$_pkgsrc"/build-win64.txt
    --prefix "/usr/share/dxvk/x64"
    "$_pkgsrc" "build/x64"
  )

  meson setup "${_meson_args[@]}" "${_meson_x64[@]}"
  meson compile -C build/x64

  local _meson_x32=(
    --cross-file "$_pkgsrc"/build-win32.txt
    --prefix "/usr/share/dxvk/x32"
    "$_pkgsrc" "build/x32"
  )

  meson setup "${_meson_args[@]}" "${_meson_x32[@]}"
  meson compile -C build/x32
}

package() {
  meson install -C build/x64 --destdir "$pkgdir"
  meson install -C build/x32 --destdir "$pkgdir"

  install -Dm755 "$srcdir/setup_dxvk.sh" "$pkgdir/usr/share/dxvk/setup_dxvk.sh"

  install -dm755 "$pkgdir/usr/bin"
  ln -srf "$pkgdir/usr/share/dxvk/setup_dxvk.sh" "$pkgdir/usr/bin/setup_dxvk"

  # Async environment variable
  install -Dm644 "$srcdir/dxvk-async-env.conf" "$pkgdir/etc/environment.d/dxvk-async-env.conf"
}
