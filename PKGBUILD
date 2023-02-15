# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=cosmic-epoch-git
pkgver=r37.74091a9
pkgrel=2
pkgdesc="Next generation Cosmic desktop environment (Currently an incomplete pre-alpha)"
arch=('x86_64')
url="https://github.com/pop-os/cosmic-epoch"
license=('GPL3')
depends=('gtk4' 'libinput' 'libpulse' 'libxkbcommon' 'mesa' 'pipewire'
         'systemd-libs' 'wayland')
makedepends=('cargo' 'clang' 'desktop-file-utils' 'git' 'just' 'llvm' 'meson'
             'mold' 'seatd')
provides=("${pkgname%-git}" 'cosmic-applets' 'cosmic-applibrary' 'cosmic-bg'
          'cosmic-comp' 'cosmic-launcher' 'cosmic-osd' 'cosmic-panel'
          'cosmic-session' 'cosmic-settings-daemon' 'xdg-desktop-portal-cosmic')
conflicts=("${pkgname%-git}" 'cosmic-applets' 'cosmic-applibrary' 'cosmic-bg'
           'cosmic-comp' 'cosmic-launcher' 'cosmic-osd' 'cosmic-panel'
           'cosmic-session' 'cosmic-settings-daemon' 'xdg-desktop-portal-cosmic')
options=('!lto')
source=('git+https://github.com/pop-os/cosmic-epoch.git'
        'git+https://github.com/pop-os/cosmic-applets.git'
        'git+https://github.com/pop-os/cosmic-applibrary.git'
        'git+https://github.com/pop-os/cosmic-bg.git'
        'git+https://github.com/pop-os/cosmic-comp.git'
        'git+https://github.com/pop-os/cosmic-launcher.git'
        'git+https://github.com/pop-os/cosmic-osd.git'
        'git+https://github.com/pop-os/cosmic-panel.git'
        'git+https://github.com/pop-os/cosmic-session.git'
        'git+https://github.com/pop-os/cosmic-settings-daemon.git'
        'git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_submodules=(
  cosmic-applets
  cosmic-applibrary
  cosmic-bg
  cosmic-comp
  cosmic-launcher
  cosmic-osd
  cosmic-panel
  cosmic-session
  cosmic-settings-daemon
  xdg-desktop-portal-cosmic
)

prepare() {
  cd "$srcdir/${pkgname%-git}"
  for submodule in "${_submodules[@]}"; do
    git submodule init "${submodule#*::}"
    git config submodule."${submodule#*::}".url "$srcdir"/"${submodule%::*}"
    git -c protocol.file.allow=always submodule update "${submodule#*::}"
  done

  export RUSTUP_TOOLCHAIN=stable
  for submodule in "${_submodules[@]}"; do
    pushd "${submodule#*::}"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    popd
  done
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  nice just sysext
}

package() {
  cd "$srcdir/${pkgname%-git}"
  cp -r cosmic-sysext/* "$pkgdir/"

  mv "$pkgdir/usr/libexec/xdg-desktop-portal-cosmic" "$pkgdir/usr/lib/"
  rm -rf "$pkgdir/usr/libexec/"
}
