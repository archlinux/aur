# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syn-vm-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell virtual machines on QEMU/KVM: wizard, built-in display, snapshots, USB and PCI passthrough, guest agent, CLI and MCP'
depends=('synshell-core')
optdepends=('qemu-desktop: the virtual machines themselves'
            'edk2-ovmf: UEFI'
            'swtpm: TPM 2.0 for Windows 11'
            'virtiofsd: virtiofs shared folder (Windows)'
            'samba: SMB shared folder'
            'virtio-win: Windows drivers and guest agent (AUR)'
            'libisoburn: syn-vm guest tools image (xorriso)')
provides=('syn-vm')
conflicts=('syn-vm' 'syn-vm-bin')
groups=('synshell-apps')
makedepends=('rustup' 'git' 'clang' 'pkgconf' 'mesa' 'libinput' 'seatd' 'libxkbcommon' 'libdrm' 'fontconfig' 'freetype2' 'dbus' 'ffmpeg' 'sqlite' 'libarchive' 'pipewire' 'alsa-lib' 'fuse3' 'mingw-w64-gcc')
options=('!lto')
source=("synshell::git+https://github.com/VitaminDB/synshell.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/synshell"
    if git describe --tags >/dev/null 2>&1; then
        git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '%s.r%s.g%s' '0.2.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable
    rustup toolchain install stable --profile minimal --no-self-update --target x86_64-pc-windows-gnu,x86_64-unknown-linux-musl
    # Без --locked: git-зависимости (syngui и др.) свежие, Cargo.lock обновится.
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')" --target x86_64-pc-windows-gnu --target x86_64-unknown-linux-musl
}

build() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p syn-vm
    cargo build --offline --release -p syn-vm-agent --bin syn-vm-agent --target x86_64-pc-windows-gnu
    install -Dm755 target/x86_64-pc-windows-gnu/release/syn-vm-agent.exe target/release/cross/x86_64-pc-windows-gnu/syn-vm-agent.exe
    cargo build --offline --release -p syn-vm-agent --bin syn-vm-agent --target x86_64-unknown-linux-musl
    install -Dm755 target/x86_64-unknown-linux-musl/release/syn-vm-agent target/release/cross/x86_64-unknown-linux-musl/syn-vm-agent
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/syn-vm" "$pkgdir/usr/bin/syn-vm"
    install -Dm644 "$_bins/cross/x86_64-pc-windows-gnu/syn-vm-agent.exe" "$pkgdir/usr/lib/syn-vm/agent/syn-vm-agent.exe"
    install -Dm755 "$_bins/cross/x86_64-unknown-linux-musl/syn-vm-agent" "$pkgdir/usr/lib/syn-vm/agent/syn-vm-agent"
    install -Dm644 'crates/syn-vm/data/syn-vm.desktop' "$pkgdir/usr/share/applications/syn-vm.desktop"
    install -Dm644 'crates/syn-vm/data/icons/syn-vm.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syn-vm.svg"
}
