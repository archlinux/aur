# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=syndroid-git
pkgver=0.2.0.r0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/VitaminDB/synshell'
license=('GPL-3.0-only')
pkgdesc='synshell Android container: run Android apps on the desktop'
depends=('synshell-core')
provides=('syndroid')
conflicts=('syndroid' 'syndroid-bin')
groups=('synshell-apps')
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
    cargo build --offline --release -p syn-droid
}

package() {
    local _root="$srcdir/synshell" _bins="$srcdir/synshell/target/release"
    cd "$_root"
    install -Dm755 "$_bins/syndroidd" "$pkgdir/usr/bin/syndroidd"
    install -Dm755 "$_bins/syndroid" "$pkgdir/usr/bin/syndroid"
    install -Dm644 'crates/syn-droid/data/syndroid.desktop' "$pkgdir/usr/share/applications/syndroid.desktop"
    install -Dm644 'crates/syn-droid/data/icons/syndroid.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/syndroid.svg"
    install -dm755 "$pkgdir/usr/lib/systemd/system/"
    for _f in 'crates/syn-droid/systemd/syndroid.service'; do
        [ -e "$_f" ] || { echo "нет crates/syn-droid/systemd/syndroid.service" >&2; return 1; }
        if [ -d "$_f" ]; then cp -r --no-preserve=ownership "$_f" "$pkgdir/usr/lib/systemd/system/"; else install -m644 "$_f" "$pkgdir/usr/lib/systemd/system/"; fi
    done
}
