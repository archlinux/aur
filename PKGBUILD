# Maintainer: futpib-bot2 <futpib-bot2@users.noreply.github.com>

pkgname=filestr-git
pkgver=r39.6fc553f
pkgrel=1
pkgdesc="Friend-to-friend file sharing over iroh (DC++-style social model); daemon + CLI, built without the nostr chat plane"
arch=('x86_64')
url="https://github.com/futpib/filestr"
license=('MIT')
makedepends=('rust' 'cargo' 'git')
provides=('filestr' 'filestrd' 'filestrctl')
conflicts=('filestr')
options=('!lto')
source=("git+https://github.com/futpib/filestr.git")
install="$pkgname.install"
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/filestr"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/filestr"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/filestr"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # --no-default-features drops the nostr/MLS chat plane entirely: a pure
    # iroh file-peering daemon. (The optional loopback HTTP/Grayjay gateway is
    # also off; enable it by adding `--features grayjay` here if wanted.)
    cargo build --frozen --release --no-default-features -p filestrd -p filestrctl
}

package() {
    cd "$srcdir/filestr"

    install -Dm755 "target/release/filestrd" "$pkgdir/usr/bin/filestrd"
    install -Dm755 "target/release/filestrctl" "$pkgdir/usr/bin/filestrctl"

    # Run as a per-user service (not system-wide): the daemon keeps each user's
    # identity, grants and shares under their own XDG dirs. Point ExecStart at
    # the packaged binary instead of the in-repo ~/.cargo/bin path.
    sed 's|ExecStart=.*|ExecStart=/usr/bin/filestrd|' filestrd.service \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/filestrd.service"

    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
