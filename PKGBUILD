# Maintainer: murkl <murkl@users.noreply.github.com>
# Stamped by tools/aur.sh at a release, which fills the placeholders.

pkgname=arch-os-manager
pkgver=2.2.0
pkgrel=1
pkgdesc='Update, maintain and repair Arch Linux from one place'
arch=('x86_64')
url='https://github.com/murkl/arch-os-manager'
# The program, then Fira Code and the Nerd Fonts symbols it carries.
license=('GPL-3.0-or-later' 'OFL-1.1' 'MIT')
# checkupdates needs fakeroot, which pacman-contrib only suggests, and a terminal finds the
# icons in ttf-nerd-fonts-symbols.
depends=('glibc' 'libgcc' 'sudo' 'pacman-contrib' 'fakeroot' 'ttf-nerd-fonts-symbols')
makedepends=('cargo')
optdepends=(
    'paru: builds and updates packages from the AUR'
    'yay: builds and updates packages from the AUR'
    'flatpak: updates and cleans up Flatpak apps'
    'reflector: ranks the mirrors by speed'
    'fwupd: updates the firmware of the device'
    'libnotify: desktop notifications about new updates'
    'meld: merges configuration updates side by side'
)
provides=('system-manager')
conflicts=('system-manager')
install=arch-os-manager.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bf2fb7d18fc8c83694a43a48135458c1d8d89828fcb9e4b9a5a9655e9c9d37b1')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

# Built as the release is, for its version.
build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    SM_VERSION="$pkgver" cargo build --frozen --release
}

# What ships answers with the version it was built for.
check() {
    cd "${pkgname}-${pkgver}"
    [ "$(target/release/system-manager --version)" = "system-manager ${pkgver}" ]
}

# The menu entry and the update notification are set up by the program for the user who
# runs it, at its first start or with `system-manager init`.
package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/system-manager "${pkgdir}/usr/bin/system-manager"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 assets/fonts/OFL.txt assets/fonts/NerdFonts-LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
