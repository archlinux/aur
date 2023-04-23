# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=cosmic-epoch-git
pkgver=r62.bdf225c
pkgrel=1
pkgdesc="desktop environment in Rust, Iced. GNOME inspired, by System76, Pop! OS."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-epoch"
license=('GPL3')
depends=('fontconfig' 'gtk4' 'libinput' 'libglvnd' 'libpipewire' 'libpulse' 'libseat.so'
         'libxkbcommon' 'pop-icon-theme' 'pop-launcher' 'systemd-libs' 'wayland')
makedepends=('cargo' 'clang' 'desktop-file-utils' 'git' 'just' 'mold')
checkdepends=('appstream-glib')
optdepends=('ksnip: Screenshots' # See https://github.com/pop-os/cosmic-epoch#screenshots
            'qt5-wayland: Screenshots')
provides=('cosmic-epoch' 'cosmic-applets' 'cosmic-applibrary' 'cosmic-bg'
          'cosmic-comp' 'cosmic-launcher' 'cosmic-osd' 'cosmic-panel'
          'cosmic-session' 'cosmic-settings' 'cosmic-settings-daemon'
          'cosmic-workspaces-epoch' 'xdg-desktop-portal-cosmic')
conflicts=('cosmic-epoch' 'cosmic-applets' 'cosmic-applibrary' 'cosmic-bg'
           'cosmic-comp' 'cosmic-launcher' 'cosmic-osd' 'cosmic-panel'
           'cosmic-session' 'cosmic-settings' 'cosmic-settings-daemon'
           'cosmic-workspaces-epoch' 'xdg-desktop-portal-cosmic')
backup=('etc/cosmic-comp/config.ron'
        'etc/cosmic-panel/config.ron')
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
        'git+https://github.com/pop-os/cosmic-settings.git'
        'git+https://github.com/pop-os/cosmic-settings-daemon.git'
        'git+https://github.com/pop-os/cosmic-workspaces-epoch.git'
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
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/cosmic-epoch"
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
  cosmic-settings
  cosmic-settings-daemon
  cosmic-workspaces-epoch
  xdg-desktop-portal-cosmic
)

prepare() {
  cd "$srcdir/cosmic-epoch"
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

  # Use mold linker instead of lld
  sed -i 's/lld/mold/g' cosmic-settings/justfile

  # libexec > lib
  # see discussion: https://github.com/pop-os/cosmic-epoch/issues/87
  sed -i 's|libexecdir = $(prefix)/libexec|libexecdir = $(libdir)|g' \
    xdg-desktop-portal-cosmic/Makefile
  sed -i 's|libexec|lib|g' cosmic-session/src/main.rs
  sed -i 's|libexec|lib/polkit-1|g' cosmic-osd/src/subscriptions/polkit_agent_helper.rs
}

build() {
  cd "$srcdir/cosmic-epoch"
  export RUSTUP_TOOLCHAIN=stable
  # note, consider rust build time optimisations: 
  # https://matklad.github.io/2021/09/04/fast-rust-builds.html, 
  # later. for now, ignore warnings, and build with lower priority 
  # to not block user installing this pkg. to speed up build, use "mold" linker, see 
  # https://stackoverflow.com/questions/67511990/how-to-use-the-mold-linker-with-cargo
  RUSTFLAGS="-A warnings -C link-arg=-fuse-ld=mold"
  nice just sysext
}

check() {
  cd "$srcdir/cosmic-epoch"
  appstream-util validate-relax --nonet cosmic-sysext/usr/share/metainfo/*.metainfo.xml || :
  desktop-file-validate cosmic-sysext/usr/share/applications/*.desktop || :

#  export RUSTUP_TOOLCHAIN=stable
#  for p in cosmic-applibrary cosmic-bg cosmic-settings do;
#    pushd ${p}
#    nice just test
#    popd
#  done
}

package() {
  cd "$srcdir/cosmic-epoch"
  cp -r cosmic-sysext/* "$pkgdir/"

  # Keybinding config
  # https://github.com/pop-os/cosmic-epoch#cosmic-comp
  install -Dm644 cosmic-comp/config.ron -t "$pkgdir/etc/cosmic-comp/"

  # Panel config
  # https://github.com/pop-os/cosmic-epoch#panel-configuration
  install -Dm644 cosmic-panel/cosmic-panel-config/config.ron -t \
    "$pkgdir/etc/cosmic-panel/"
}
