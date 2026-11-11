# Maintainer: An Nguyen (stk) <an@linux.com>
PACKAGER='An Nguyen (stk) <an@linux.com>'
pkgname=lurker
pkgver=0.1
pkgrel=1
pkgdesc='LUKS and VeraCrypt CLI/desktop with privileged and unprivileged Linux workflows'
arch=('x86_64')
url='https://github.com/annguyenfoss/lurker'
license=('GPL-3.0-only' 'GPL-2.0-only' 'Apache-2.0' 'LicenseRef-TrueCrypt-3.0')
depends=('cryptsetup' 'btrfs-progs' 'util-linux' 'polkit' 'libxkbcommon'
         'libxkbcommon-x11' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxrandr' 'wayland'
         'fontconfig' 'freetype2' 'gcc-libs' 'fuse3' 'wxwidgets-common')
makedepends=('cargo' 'python' 'bc' 'bison' 'flex' 'libelf' 'wxwidgets-gtk3')
optdepends=('veracrypt: create VeraCrypt volumes in privileged mode'
            'sudo: CLI privilege escalation and desktop terminal fallback')
conflicts=('lurker-git')
# Match the GitHub release tag; the Rust workspace version is 0.1.0.
_veracrypt_rev=8172bc55f834485f67be271e02c1167981423621
_lkl_rev=d0f76a77e8c2ca68bd7d96190b8da09040eab072
source=("lurker-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "veracrypt-$_veracrypt_rev.tar.gz::https://github.com/veracrypt/VeraCrypt/archive/$_veracrypt_rev.tar.gz"
        "lkl-$_lkl_rev.tar.gz::https://github.com/lkl/linux/archive/$_lkl_rev.tar.gz")
sha256sums=('2f84fc3b57e0030e442111ab229a8764b41a0d76ebfe807d2a327180680c6254'
            'fc286de07d0ac88b48c65cade34bac932b30a93cd1719a22f9fef3b69feedfc4'
            'ef6e5b7cd66c023bc16193013fdacbc1285b9eb86df864b8c6cefe0ad4e0e168')
options=('!lto')

prepare() {
    cd "$srcdir/lurker-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
    # Re-extraction restores pristine files but can retain patch stamps.
    rm -f "$srcdir/VeraCrypt-$_veracrypt_rev/.lurker-patch-sha256" \
        "$srcdir/linux-$_lkl_rev/.lurker-patch-sha256"
    mkdir -p "$srcdir/native"
    ln -sfn "$srcdir/VeraCrypt-$_veracrypt_rev" "$srcdir/native/veracrypt"
    ln -sfn "$srcdir/linux-$_lkl_rev" "$srcdir/native/lkl"
}

build() {
    cd "$srcdir/lurker-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"
    if [[ ${RUSTFLAGS:-} != *"--remap-path-prefix=$srcdir=/usr/src/debug/lurker"* ]]; then
        export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/lurker"
    fi
    cargo build --release --locked --offline --workspace
    python scripts/build-linux-userspace.py --offline --source-dir "$srcdir/native" \
        --output-dir "$srcdir/target/release/userspace"
}

check() {
    cd "$srcdir/lurker-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"
    if [[ ${RUSTFLAGS:-} != *"--remap-path-prefix=$srcdir=/usr/src/debug/lurker"* ]]; then
        export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/lurker"
    fi
    cargo test --release --locked --offline --workspace
}

package() {
    cd "$srcdir/lurker-$pkgver"
    install -Dm755 "$srcdir/target/release/lurker" "$pkgdir/usr/bin/lurker"
    install -Dm755 "$srcdir/target/release/lurker-desktop" "$pkgdir/usr/bin/lurker-desktop"
    install -Dm755 "$srcdir/target/release/lurker-helper" "$pkgdir/usr/bin/lurker-helper"
    install -Dm755 "$srcdir/target/release/userspace/lurker-veracrypt" "$pkgdir/usr/lib/lurker/userspace/lurker-veracrypt"
    install -Dm755 "$srcdir/target/release/userspace/lurker-fs" "$pkgdir/usr/lib/lurker/userspace/lurker-fs"
    cp -r "$srcdir/target/release/userspace/licenses" "$pkgdir/usr/lib/lurker/userspace/"
    install -Dm644 "$srcdir/target/release/userspace/licenses/VeraCrypt.txt" "$pkgdir/usr/share/licenses/$pkgname/VeraCrypt.txt"
    install -Dm644 "$srcdir/target/release/userspace/sources.json" "$pkgdir/usr/lib/lurker/userspace/sources.json"
    install -Dm644 extras/linux/io.lurker.desktop.desktop "$pkgdir/usr/share/applications/io.lurker.desktop.desktop"
    install -Dm644 extras/assets/lurker.png "$pkgdir/usr/share/pixmaps/lurker.png"
    install -Dm644 README.md "$pkgdir/usr/share/doc/lurker/README.md"
    install -Dm644 docs/linux-validation.md "$pkgdir/usr/share/doc/lurker/docs/linux-validation.md"
    install -Dm644 docs/linux-userspace.md "$pkgdir/usr/share/doc/lurker/docs/linux-userspace.md"
}
