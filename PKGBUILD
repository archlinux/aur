# dank-niri-git - Complete Dank Material Shell Environment with built-in niri
: ${_sccache:=}
pkgname='dank-niri-git'
pkgver=0.0.1
pkgrel=4
pkgdesc='Complete niri desktop environment with DankMaterialShell, themes, and all dependencies'
arch=(x86_64 aarch64)
url='https://github.com/bbedward/DankMaterialShell'
license=('GPL-3.0')
depends=('dankmaterialshell-git'
         'ghostty'
         'matugen-bin'
         'wl-clipboard'
         'cliphist'
         'cava'
         'qt5ct'
         'qt6ct'
         'xdg-desktop-portal-gtk'
         'xdg-desktop-portal-gnome'
         'gnome-keyring'
         'polkit-gnome'
         # niri dependencies
         'makepkg-git-lfs-proto'
         'cairo'
         'glib2'
         'libdisplay-info'
         'libinput'
         'libpipewire'
         'libxkbcommon'
         'mesa'
         'pango'
         'pixman'
         'accountsservice'
         'seatd')
makedepends=('git' 'clang' 'rust' 'makepkg-git-lfs-proto' 'git-lfs')
[[ -n ${_sccache} ]] && makedepends+=(sccache)
provides=('dank-niri' 'niri')
conflicts=('dank-niri' 'niri' 'niri-git' 'niri-bin')
options=(!debug !lto !strip)
backup=('etc/xdg/kdeglobals'
        'etc/xdg/ghostty/config')
source=("niri::git-lfs+https://github.com/YaLTeR/niri.git"
        "niri-config.kdl"
        "ghostty-config"
        "kdeglobals")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd niri
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd niri
    
    # Replace default niri config with our Dank config
    cp "${srcdir}/niri-config.kdl" resources/default-config.kdl
    
    # Tuning cargo
    export CARGO_HOME=${srcdir}/niri/.cargo
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd niri
    # Tuning rust compiler
    export RUSTFLAGS="--remap-path-prefix=${srcdir}=/"
    [[ -n ${_sccache} ]] && export RUSTC_WRAPPER=sccache
    # Tuning cargo
    export CARGO_HOME=${srcdir}/niri/.cargo
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    # Install niri
    cd niri
    install -Dm755 target/release/niri                       -t "${pkgdir}"/usr/bin/
    install -Dm755 resources/niri-session                    -t "${pkgdir}"/usr/bin/
    install -Dm644 resources/default-config.kdl             -t "${pkgdir}"/usr/share/doc/niri/
    install -Dm644 resources/niri.desktop                    -t "${pkgdir}"/usr/share/wayland-sessions/
    install -Dm644 resources/niri-portals.conf               -t "${pkgdir}"/usr/share/xdg-desktop-portal/
    install -Dm644 resources/niri{.service,-shutdown.target} -t "${pkgdir}"/usr/lib/systemd/user/
    
    cd "${srcdir}"
    
    # Install XDG-compliant system-wide configuration defaults
    # These will be used by applications if user configs don't exist
    install -Dm644 ghostty-config "${pkgdir}"/etc/xdg/ghostty/config
    install -Dm644 kdeglobals "${pkgdir}"/etc/xdg/kdeglobals
    
    # Install documentation
    install -dm755 "${pkgdir}"/usr/share/doc/dank-niri
    cat > "${pkgdir}"/usr/share/doc/dank-niri/README << 'EOF'
# Dank Niri Configuration

This package provides system-wide defaults for the Dank Material environment.
Configuration files are installed to /etc/xdg/ and will be used automatically
by applications that support XDG Base Directory specification.

## User Configuration Override

Users can override any system defaults by creating their own configuration files:
- niri: Built-in defaults (users can create ~/.config/niri/config.kdl)
- ghostty: ~/.config/ghostty/config
- GTK: ~/.config/gtk-3.0/settings.ini and ~/.config/gtk-4.0/settings.ini
- KDE: ~/.config/kdeglobals

## Environment Variables

QT_QPA_PLATFORMTHEME=qt5ct is automatically set system-wide to enable Qt theming.
Log out and back in after installation for this to take effect.

## Theme Customization

Administrators can modify the system-wide defaults in /etc/xdg/ as needed.
These files are preserved during package upgrades.
EOF
}
