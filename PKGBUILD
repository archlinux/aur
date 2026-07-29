# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=auto-cpufreq-rust-git
_pkgname=auto-cpufreq-rust
pkgver=3.2.1.r1.gec72edc
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer (Rust port)'
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Zamanhuseyinli/auto-cpufreq-rust"
license=('LGPL-3.0')
depends=('dmidecode' 'curl' 'openssl')
makedepends=('git' 'rust' 'cargo' 'pkg-config' 'gtk4')
provides=('auto-cpufreq')
conflicts=('auto-cpufreq' 'auto-cpufreq-git')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!strip !debug)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname/auto-cpufreq"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    true
}

package() {
    cd "$srcdir/$_pkgname"

    [ -d "$pkgdir/usr/local/bin" ] || mkdir -p "$pkgdir/usr/local/bin"
    [ -d "$pkgdir/usr/local/share/auto-cpufreq" ] || mkdir -p "$pkgdir/usr/local/share/auto-cpufreq"
    [ -d "$pkgdir/usr/share/applications" ] || mkdir -p "$pkgdir/usr/share/applications"
    [ -d "$pkgdir/usr/share/pixmaps" ] || mkdir -p "$pkgdir/usr/share/pixmaps"
    [ -d "$pkgdir/usr/share/polkit-1/actions" ] || mkdir -p "$pkgdir/usr/share/polkit-1/actions"
    [ -d "$pkgdir/usr/bin" ] || mkdir -p "$pkgdir/usr/bin"

    [ -d scripts ] && cp -ru scripts "$pkgdir/usr/local/share/auto-cpufreq/"
    [ -d images ] && cp -ru images "$pkgdir/usr/local/share/auto-cpufreq/"

    _install_custom() {
        local src=$1 dest=$2 mode=$3
        if [ -f "$src" ]; then
            if [ ! -f "$dest" ] || ! cmp -s "$src" "$dest"; then
                install -m"$mode" "$src" "$dest"
            fi
        fi
    }

    _install_custom "scripts/auto-cpufreq-gtk.desktop" "$pkgdir/usr/share/applications/auto-cpufreq-gtk.desktop" 644
    _install_custom "images/icon.png" "$pkgdir/usr/share/pixmaps/auto-cpufreq.png" 644
    _install_custom "scripts/org.auto-cpufreq.pkexec.policy" "$pkgdir/usr/share/polkit-1/actions/org.auto-cpufreq.pkexec.policy" 644
    _install_custom "scripts/cpufreqctl.sh" "$pkgdir/usr/local/bin/cpufreqctl.auto-cpufreq" 755

    cd "$srcdir/$_pkgname/auto-cpufreq"
    cargo build --frozen --release --all-features

    cd target/release
    for bin in auto-cpufreq auto-cpufreq-gtk auto-cpufreq-tray; do
        if [ -f "$bin" ]; then
            local dest_bin="$pkgdir/usr/local/bin/$bin"
            local link_path="$pkgdir/usr/bin/$bin"
            local target_in_sys="/usr/local/bin/$bin"

            if [ ! -f "$dest_bin" ] || ! cmp -s "$bin" "$dest_bin"; then
                install -m755 "$bin" "$dest_bin"
            fi

            if [ ! -L "$link_path" ] || [ "$(readlink "$link_path")" != "$target_in_sys" ]; then
                ln -sf "$target_in_sys" "$link_path"
            fi
        fi
    done

    local share_link="$pkgdir/usr/share/auto-cpufreq"
    local share_target="/usr/local/share/auto-cpufreq"
    if [ -d "$pkgdir$share_target" ]; then
        if [ ! -L "$share_link" ] || [ "$(readlink "$share_link")" != "$share_target" ]; then
            ln -sf "$share_target" "$share_link"
        fi
    fi
}
