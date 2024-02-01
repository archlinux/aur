# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

## The following variable can be customized at build time.
## Use env or export to change at your wish
##
##   Example: env _sccache=y makepkg -sc
##
## Default is: None => not use sccache
##
## More info: https://github.com/mozilla/sccache
: ${_sccache:=}

pkgname=niri
pkgver=0.1.0
pkgrel=6
pkgdesc="Scrollable-tiling Wayland compositor"
arch=(x86_64)
url="https://github.com/YaLTeR/${pkgname}"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libinput libpipewire libxkbcommon mesa pango pixman seatd)
makedepends=(clang rust)
[[ -n ${_sccache} ]] && makedepends+=(sccache)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
conflicts=(${pkgname}-git ${pkgname}-bin)
options=(!lto) # devtools issue
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        001.patch::${url}/commit/367e4955ea05044b0151e0a39ea7061788d73af9.patch # Mark Msg as pub
        002.patch::${url}/commit/64c85d865ed4e5b97e8941135c742fd390738c50.patch # winit: Don't remove output on CloseRequested
        003.patch::${url}/commit/0ebcc3e0d6ff7eda50d54fce312d0d1a42bd8224.patch # Create default config file if missing
        004.patch::${url}/commit/51243a0a505a533057e7326fbbae882420f0d363.patch # Show notification about creating a default config
        005.patch::${url}/commit/597ea62d179e51e45cbdd99085795567322ff2f7.patch # input: update keyboard led state
        006.patch::${url}/commit/b813f99abd2d6e09eb72e8c0083e92b486b4b210.patch # tty: reset surface state after changing monitor state
        007.patch::${url}/commit/59ff331597633dc66113e5070d672ba70035421b.patch # Implement wlr-foreign-toplevel-management
        008.patch::${url}/commit/deef52519a237a290bee6ded8aec7dbaac1e8e9a.patch # foreign_toplevel: Change activated to mean keyboard focus
        009.patch::${url}/commit/fefb1cccd6c3c7b92f8d4021fe5e38609760d1e4.patch # foreign_toplevel: Update the focused window last
        010.patch::${url}/commit/d3f4583c903dc36d93924ce3d2ec8c9ffc57dae5.patch # foreign_toplevel: Use OutputHandler to send output_enter on demand
        011.patch::${url}/commit/85eac9d9d028352e3b54d6944730fd2777918c5b.patch # chore: bump smithay
        012.patch::${url}/commit/11bff3a2f1aa069a998cd6710dd06467acb73920.patch # Update Smithay (rotation fix)
        013.patch::${url}/commit/962e159db61dc6c7822aa899b1d9dc86fb6a0de5.patch # Add option to rotate outputs
        014.patch::${url}/commit/7052f0129ef5d2fa5d38eef3dbb5c9296228e341.patch # Stop screencasts on size changes
        015.patch::${url}/commit/2e50f8dee0f877f8192d04cc2c910fd9efe8451b.patch # Hardcode winit transform for now
        016.patch::${url}/commit/89ac95867059340b80a37ef81ff32a589bffd185.patch # default-config: Document how focus ring and border draw behind
        017.patch::${url}/commit/0a715ce1553ec528dbb61172450d2944db7edb70.patch # default-config: Improve wording for focus-ring/border comment
        018.patch::${url}/commit/e51268a39eeffd56d016a8d25dc98a40ff045a9c.patch # Add actions to move the active workspace to another monitor
        019.patch::${url}/commit/9afd728ae98059c9405fe2430399ecb89fd1a7a9.patch # Add error messages to backend initialization
        020.patch::${url}/commit/2036116f169369e31f4fd8a280788c4267a7024b.patch # config: Premultiply alpha in Color when converting to f32
        #.patch::${url}/commit/.patch # sample
       )
b2sums=('b6160952c52033250922aaf7f7fc57094c678c9a3c0e54c2e63e33b5a8d46328f9cf58608b4b35b50078e953691d4ac448b5ac3e927833f757f23dba338e0847'
        'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'   # Skip checking hashsums of patches, Github issue
        'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
       )

prepare() {
  cd ${pkgname}-${pkgver}

  # Apply commits (fixies and new features) from source Github since last release, in proper order
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  #Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname}-${pkgver}/.cargo   # Download all to src folder, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname}-${pkgver}

  #Tuning rust compiler
  export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"        # Prevent warning: 'Package contains reference to $srcdir'
  [[ -n ${_sccache} ]] && export RUSTC_WRAPPER=sccache      # If $_sccache not empty, build using binary cache

  #Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname}-${pkgver}/.cargo   # Use downloaded earlier from src folder, not from ~/.cargo
  export CARGO_TARGET_DIR=target                            # Place the output in target relative to the current directory

  cargo build --frozen --release
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 target/release/${pkgname}                       -t ${pkgdir}/usr/bin/
  install -Dm755 resources/${pkgname}-session                    -t ${pkgdir}/usr/bin/
  install -Dm644 resources/${pkgname}.desktop                    -t ${pkgdir}/usr/share/wayland-sessions/
  install -Dm644 resources/${pkgname}-portals.conf               -t ${pkgdir}/usr/share/xdg-desktop-portal/
  install -Dm644 resources/${pkgname}{.service,-shutdown.target} -t ${pkgdir}/usr/lib/systemd/user/
}
