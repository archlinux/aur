# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=auto-cpufreq-rust-git
_pkgname=auto-cpufreq-rust
pkgver=r579.1536aae
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer (Rust port)'
arch=('x86_64' 'aarch64')
url="https://github.com/Zamanhuseyinli/auto-cpufreq-rust"
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

    mkdir -p "$pkgdir/usr/local/bin"
    mkdir -p "$pkgdir/usr/local/share/auto-cpufreq"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/polkit-1/actions"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share"

    cp -r scripts "$pkgdir/usr/local/share/auto-cpufreq/"
    cp -r images "$pkgdir/usr/local/share/auto-cpufreq/"

    [ -f scripts/auto-cpufreq-gtk.desktop ] && \
        install -m644 scripts/auto-cpufreq-gtk.desktop "$pkgdir/usr/share/applications/"

    [ -f images/icon.png ] && install -m644 images/icon.png "$pkgdir/usr/share/pixmaps/auto-cpufreq.png"
    
    [ -f scripts/org.auto-cpufreq.pkexec.policy ] && \
        install -m644 scripts/org.auto-cpufreq.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/"
    
    [ -f scripts/cpufreqctl.sh ] && \
        install -m755 scripts/cpufreqctl.sh "$pkgdir/usr/local/bin/cpufreqctl.auto-cpufreq"

    ln -sf /usr/local/share/auto-cpufreq "$pkgdir/usr/share/auto-cpufreq"
    ln -sf /usr/local/bin/auto-cpufreq "$pkgdir/usr/bin/auto-cpufreq"
    ln -sf /usr/local/bin/auto-cpufreq-gtk "$pkgdir/usr/bin/auto-cpufreq-gtk"
    ln -sf /usr/local/bin/auto-cpufreq-tray "$pkgdir/usr/bin/auto-cpufreq-tray"

    cd "$srcdir/$_pkgname/auto-cpufreq"
    cargo build --frozen --release --all-features

    cd target/release
    install -m755 auto-cpufreq "$pkgdir/usr/local/bin/auto-cpufreq"
    
    [ -f auto-cpufreq-gtk ] && install -m755 auto-cpufreq-gtk "$pkgdir/usr/local/bin/auto-cpufreq-gtk"
    [ -f auto-cpufreq-tray ] && install -m755 auto-cpufreq-tray "$pkgdir/usr/local/bin/auto-cpufreq-tray"
}
