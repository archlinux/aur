# Maintainer: Daniel Bershatskit <bepshatsky@yandex.ru>

pkgname=shitty-git
pkgver=2026.07.28.r0.g042c60f
pkgrel=1
pkgdesc='Small, fast Wayland Vulkan-enabled terminal emulator'
arch=('x86_64' 'aarch64')
url='https://github.com/pg83/shitty'
license=('GPL-3.0-or-later' 'MIT')
depends=(
  'brotli'
  'fontconfig'
  'freetype2'
  'harfbuzz'
  'libutf8proc'
  'libxkbcommon'
  'simdutf'
  'vulkan-icd-loader'
  'wayland'
  'xxhash'
)
makedepends=(
  'clang'
  'git'
  'glslang'
  'pkgconf'
  'python'
  'ragel6'
  'vulkan-headers'
)
conflicts=('shitty')
provides=('shitty')
_commit=042c60fc3dfcb84d5a7dfb33c040a38a5eb94c64
_libstd_commit=6ab662255eb2c459e5e69e13248c964eef5eedc1
_glfw_commit=a2b295420d899be60c6a27ced21eb172bf51f675
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  "libstd::git+https://github.com/pg83/std.git#commit=$_libstd_commit"
  "glfw::git+https://github.com/pg83/glfw.git#commit=$_glfw_commit"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "$srcdir/$pkgname"

  rm -rf third_party/libstd third_party/glfw
  install -d third_party
  cp -a "$srcdir/libstd" third_party/libstd
  cp -a "$srcdir/glfw" third_party/glfw

  sed -i 's/date.today().strftime("%Y.%m.%d")/"2026.07.28"/' build.py
}

build() {
  cd "$srcdir/$pkgname"

  # The bundled libstd uses Clang compiler builtins. It also automatically uses
  # xxhash when its headers are installed, but does not add its library to the
  # final link itself.
  CPPFLAGS+=" -ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}"
  LDFLAGS+=" -lxxhash"
  CC=clang CXX=clang++ AR=ar python3 ./build -B .build
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 .build/st "$pkgdir/usr/bin/st"
  install -Dm644 shitty.desktop "$pkgdir/usr/share/applications/shitty.desktop"
  install -Dm644 shitty.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shitty.svg"
}
