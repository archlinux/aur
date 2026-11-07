# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=synshell-link-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell: computer and phone link — screen, input, files, notifications (synlink)'
depends=('synshell-core')
optdepends=('openssh: ssh to linked devices'
            'fuse3: archives as folders; files of linked devices')
provides=('synshell-link')
conflicts=('synshell-link' 'synshell-link-bin')
install=synshell-link.install
makedepends=('cargo' 'rust' 'git' 'clang' 'pkgconf' 'mesa' 'libinput' 'seatd' 'libxkbcommon' 'libdrm' 'fontconfig' 'freetype2' 'dbus' 'ffmpeg' 'sqlite' 'libarchive' 'pipewire' 'alsa-lib' 'fuse3')
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
    # Без --locked: git-зависимости (syngui и др.) свежие, Cargo.lock обновится.
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/synshell"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --offline --release -p syn-link -p syn-link-view
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/synlink" "$pkgdir/usr/bin/synlink"
    install -Dm755 "$_bins/synlink-view" "$pkgdir/usr/bin/synlink-view"
    install -Dm644 'crates/syn-link-view/data/synlink-view.desktop' "$pkgdir/usr/share/applications/synlink-view.desktop"
    install -dm755 "$pkgdir/etc/xdg/autostart/"
    for _f in 'crates/syn-link/autostart/synlink.desktop'; do
        [ -e "$_f" ] || { echo "нет crates/syn-link/autostart/synlink.desktop" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/etc/xdg/autostart/"; else install -m644 "$_f" "$pkgdir/etc/xdg/autostart/"; fi
    done
    install -dm755 "$pkgdir/usr/lib/systemd/network/"
    for _f in 'crates/syn-link/data/80-synlink-usb.network'; do
        [ -e "$_f" ] || { echo "нет crates/syn-link/data/80-synlink-usb.network" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/network/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/network/"; fi
    done
    install -dm755 "$pkgdir/usr/share/polkit-1/actions/"
    for _f in 'crates/syn-link/data/org.synshell.synlink.policy'; do
        [ -e "$_f" ] || { echo "нет crates/syn-link/data/org.synshell.synlink.policy" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/share/polkit-1/actions/"; else install -m644 "$_f" "$pkgdir/usr/share/polkit-1/actions/"; fi
    done
}
