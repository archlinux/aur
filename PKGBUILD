# Maintainer: soloturn <soloturn@gmail.com>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=cosmic-epoch-git
pkgver=r118.5f2fd33
pkgrel=1
pkgdesc="Cosmic desktop environment from System76's Pop!_OS written in Rust utilizing Iced inspired by GNOME"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-epoch"
license=('GPL-3.0-or-later AND MPL-2.0 AND CC-BY-SA-4.0')
depends=(
  'cage'
  'fontconfig'
  'greetd'
  'gtk4'
  'libinput'
  'libglvnd'
  'libpipewire'
  'libpulse'
  'libseat.so'
  'libxkbcommon'
  'pop-icon-theme-git'
  'pop-launcher-git'
  'systemd-libs'
  'wayland'
  'xdg-desktop-portal'
  'xdg-utils'
)
makedepends=(
  'cargo'
  'clang'
  'flatpak'
  'git'
  'intltool'
  'just'
  'mold'
  'nasm'
)
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('flatpak: Flatpak support for Cosmic Store')

_submodules=(
  cosmic-applets
  cosmic-applibrary
  cosmic-bg
  cosmic-comp
  cosmic-edit
  cosmic-files
  cosmic-greeter
  cosmic-launcher
  cosmic-notifications
  cosmic-osd
  cosmic-panel
  cosmic-randr
  cosmic-screenshot
  cosmic-session
  cosmic-settings
  cosmic-settings-daemon
  cosmic-term
  cosmic-workspaces-epoch
  xdg-desktop-portal-cosmic
)

provides=(
  'cosmic-epoch'
  'cosmic-icons'
  'cosmic-store'
  'cosmic-workspaces'
  "${_submodules[@]}"
)
conflicts=(
  'cosmic-epoch'
  'cosmic-icons'
  'cosmic-store'
  'cosmic-workspaces'
  "${_submodules[@]}"
)
backup=('etc/cosmic-comp/config.ron')
options=('!lto')
source=(
  'git+https://github.com/pop-os/cosmic-epoch.git'
  'git+https://github.com/pop-os/cosmic-applets.git'
  'git+https://github.com/pop-os/cosmic-applibrary.git'
  'git+https://github.com/pop-os/cosmic-bg.git'
  'git+https://github.com/pop-os/cosmic-comp.git'
  'git+https://github.com/pop-os/cosmic-edit.git'
  'git+https://github.com/pop-os/cosmic-files.git'
  'git+https://github.com/pop-os/cosmic-greeter.git'
  'git+https://github.com/pop-os/cosmic-icons.git'
  'git+https://github.com/pop-os/cosmic-launcher.git'
  'git+https://github.com/pop-os/cosmic-notifications.git'
  'git+https://github.com/pop-os/cosmic-osd.git'
  'git+https://github.com/pop-os/cosmic-panel.git'
  'git+https://github.com/pop-os/cosmic-randr.git'
  'git+https://github.com/pop-os/cosmic-screenshot.git'
  'git+https://github.com/pop-os/cosmic-session.git'
  'git+https://github.com/pop-os/cosmic-settings.git'
  'git+https://github.com/pop-os/cosmic-settings-daemon.git'
  'git+https://github.com/pop-os/cosmic-store.git'
  'git+https://github.com/pop-os/cosmic-term.git'
  'git+https://github.com/pop-os/cosmic-workspaces-epoch.git'
  'git+https://github.com/pop-os/xdg-desktop-portal-cosmic.git'
  'git+https://github.com/jackpot51/appstream.git'
)
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
  cd cosmic-epoch
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cosmic-epoch
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  for submodule in "${_submodules[@]}"; do
    git submodule init
    git config submodule."${submodule#*::}".url "$srcdir/${submodule%::*}"
    git config submodule.cosmic-icons.url "$srcdir/cosmic-icons"
    git -c protocol.file.allow=always submodule update

    git config submodule.cosmic-store.url "$srcdir/cosmic-store"
    pushd cosmic-store
    git config submodule.appstream.url "$srcdir/appstream"
    git -c protocol.file.allow=always submodule update
    popd

    pushd "${submodule#*::}"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    popd

    pushd cosmic-store
    cargo fetch --target "$CARCH-unknown-linux-gnu"
    popd

  done

  # Use mold linker instead of lld
  for f in cosmic-launcher/justfile cosmic-notifications/justfile; do
    sed -i 's/lld/mold/g' "${f}"
  done

  # libexec > lib
  # see discussion: https://github.com/pop-os/cosmic-epoch/issues/87
  sed -i 's|libexecdir = $(prefix)/libexec|libexecdir = $(libdir)|g' \
    xdg-desktop-portal-cosmic/Makefile
  sed -i 's|libexec|lib|g' cosmic-osd/Makefile cosmic-session/{Justfile,src/main.rs}
  sed -i 's|libexec|lib/polkit-1|g' cosmic-osd/src/subscriptions/polkit_agent_helper.rs

  # Upstream completely broke the justfile
  git revert -n 5f2fd3324b997142fa10c8170fd6b53feb5f2673

  # Fix cosmic-screenshot .desktop file installation from justfile
  sed -i 's/Dm-644/Dm0644/g' cosmic-screenshot/justfile
}

build() {
  cd cosmic-epoch
  export CARGO_HOME="$srcdir/cargo-home"
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
  cd cosmic-epoch
  appstreamcli validate --no-net cosmic-sysext/usr/share/metainfo/*.metainfo.xml || :
  desktop-file-validate cosmic-sysext/usr/share/applications/*.desktop || :

#  export CARGO_HOME="$srcdir/cargo-home"
#  export RUSTUP_TOOLCHAIN=stable

#  _checklist=(
#    cosmic-applibrary
#    cosmic-bg
#    cosmic-edit
#    cosmic-files
#    cosmic-greeter
#    cosmic-launcher
#    cosmic-notifications
#    cosmic-panel
#    cosmic-randr
#    cosmic-screenshot
#    cosmic-settings
#    cosmic-store
#    cosmic-term
#  )

#  for item in "${_checklist[@]}"; do
#    pushd "${item}"
#    nice just check
#    popd
#  done
}

package() {
  cd cosmic-epoch
  cp -r cosmic-sysext/* "$pkgdir/"

  # Keybinding config
  # https://github.com/pop-os/cosmic-epoch#cosmic-comp
  install -Dm644 cosmic-comp/config.ron -t "$pkgdir/etc/cosmic-comp/"
}
