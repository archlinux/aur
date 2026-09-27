# Maintainer: grimish@protonmail.com 
pkgname=mesa-kraid-git
pkgver=26.3.0_devel.r230400.g61f259049cf
pkgrel=1
pkgdesc="Mesa (git main): Panfrost OpenGL + PanVK Vulkan with the KRAID shader compiler, for Arm Mali Valhall (RK3588 / Mali-G610)"
arch=('aarch64')
url="https://gitlab.freedesktop.org/mesa/mesa"
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')
depends=('libdrm' 'libglvnd' 'vulkan-icd-loader' 'expat' 'zstd' 'zlib' 'wayland'
         'libx11' 'libxext' 'libxfixes' 'libxdamage' 'libxshmfence' 'libxxf86vm'
         'libxrandr' 'libxcb' 'llvm-libs' 'spirv-tools' 'libelf')
makedepends=('git' 'meson' 'ninja' 'python-mako' 'python-yaml' 'python-packaging' 'python-ply'
             'bison' 'flex' 'glslang' 'wayland-protocols' 'llvm' 'clang' 'libclc'
             'spirv-llvm-translator' 'rust' 'rust-bindgen' 'cbindgen')
provides=("mesa=1:${pkgver%%_*}" "vulkan-panfrost=1:${pkgver%%_*}"
          "vulkan-mesa-layers=1:${pkgver%%_*}" "vulkan-mesa-implicit-layers=1:${pkgver%%_*}"
          "mesa-libgl=1:${pkgver%%_*}" 'opengl-driver' 'vulkan-driver')
conflicts=('mesa' 'vulkan-panfrost' 'mesa-git' 'vulkan-mesa-layers' 'vulkan-mesa-implicit-layers')
backup=('etc/profile.d/mesa-kraid.sh')
options=('!lto')
source=("mesa::git+https://gitlab.freedesktop.org/mesa/mesa.git#branch=main"
        'mesa-kraid.sh'
        '60-mesa-kraid.conf')
sha256sums=('SKIP'
            'bc1d1878130a64d1c8006fec6455418256c1cf259ec9cc09209868d3b4f4e97f'
            'c009ee43740dacad9fd350f6595a5b6cc941e2f138e989d541c3b0831c4bdd52')

pkgver() {
  cd "$srcdir/mesa"
  printf '%s.r%s.g%s' "$(tr - _ < VERSION)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  grep -q "'panfrost-rust'" "$srcdir/mesa/meson.options" || {
    echo "this Mesa revision has no -Dpanfrost-rust option (KRAID not present)" >&2
    return 1
  }
}

build() {
  local meson_opts=(
    -Dprefix=/usr -Dlibexecdir=lib -Dsbindir=bin -Dlibdir=lib
    -Dsysconfdir=/etc -Dlocalstatedir=/var
    -Dbuildtype=release -Db_ndebug=true
    -Dgallium-drivers=panfrost,zink -Dvulkan-drivers=panfrost
    -Dvulkan-layers=device-select,overlay
    -Dplatforms=wayland,x11 -Dglvnd=enabled -Dgbm=enabled -Degl=enabled
    -Dgles1=disabled -Dgles2=enabled
    -Dshader-cache=enabled -Dgallium-extra-hud=false
    -Dllvm=enabled -Dmesa-clc=enabled -Dprecomp-compiler=enabled
    -Dpanfrost-rust=true
    -Dvalgrind=disabled -Dlibunwind=disabled
  )
  meson setup build mesa "${meson_opts[@]}"
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
  install -Dm644 mesa-kraid.sh      "$pkgdir/etc/profile.d/mesa-kraid.sh"
  install -Dm644 60-mesa-kraid.conf "$pkgdir/usr/lib/environment.d/60-mesa-kraid.conf"
  install -Dm644 mesa/docs/license.rst "$pkgdir/usr/share/licenses/$pkgname/license.rst"
}
