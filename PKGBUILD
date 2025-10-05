# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-comp-git
pkgver=1.0.0.beta.1.1.r32.g3465ce7
pkgrel=1
pkgdesc="Compositor for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-comp"
license=('GPL-3.0-only')
depends=(
  'fontconfig'
  'libdisplay-info'
  'libseat.so'
  'libinput'
  'libxcb'
  'libxkbcommon'
  'mesa'
  'pixman'
  'systemd'
  'wayland'
)
makedepends=(
  'cargo'
  'git'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-comp.git'
        'update_to_libdisplay-info_3.patch')
sha256sums=('SKIP'
            'a5ebecc919a1e0a60585a9f579aef39e35377d36c4585fd8a8c563d3c6d13cd0')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Update dependencies to libdisplay-info/libdisplay-info-sys to v0.3.0
  patch -Np1 -i "$srcdir/update_to_libdisplay-info_3.patch"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use mold instead of lld to speed up build
  RUSTFLAGS+=" -C link-arg=-fuse-ld=mold"

  # use nice to build with lower priority
  ARGS+=" --frozen" nice make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
