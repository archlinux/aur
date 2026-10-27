# Maintainer: An Nguyen (stk) <an@linux.com>
PACKAGER='An Nguyen (stk) <an@linux.com>'
pkgname=lurker-git
pkgver=0.1.0.r19.g2e8371c
pkgrel=1
pkgdesc='LUKS and VeraCrypt CLI/desktop with privileged and unprivileged Linux workflows'
arch=('x86_64')
url='https://github.com/annguyenfoss/lurker'
license=('GPL-3.0-only' 'GPL-2.0-only' 'Apache-2.0' 'LicenseRef-TrueCrypt-3.0')
depends=('cryptsetup' 'btrfs-progs' 'util-linux' 'polkit' 'libxkbcommon'
         'libxkbcommon-x11' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxrandr' 'wayland'
         'fontconfig' 'freetype2' 'gcc-libs' 'fuse3' 'wxwidgets-common')
makedepends=('cargo' 'git' 'python' 'bc' 'bison' 'flex' 'libelf' 'wxwidgets-gtk3')
optdepends=('veracrypt: create VeraCrypt volumes in privileged mode'
            'sudo: CLI privilege escalation and desktop terminal fallback')
provides=('lurker')
conflicts=('lurker')
source=('lurker::git+https://github.com/annguyenfoss/lurker.git#branch=main'
        'veracrypt-userspace::git+https://github.com/veracrypt/VeraCrypt.git#commit=8172bc55f834485f67be271e02c1167981423621'
        'lkl-userspace::git+https://github.com/lkl/linux.git#commit=d0f76a77e8c2ca68bd7d96190b8da09040eab072')
sha256sums=('SKIP' 'SKIP' 'SKIP')
options=('!lto')

pkgver() {
    cd "$srcdir/lurker"
    local version
    version=$(sed -n '/^\[workspace.package\]/,/^\[/s/^version = "\([^"]*\)"/\1/p' Cargo.toml)
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/lurker"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
    # makepkg resets tracked Git sources on extraction but retains untracked
    # stamps. Recheck/apply the patches against those freshly reset sources.
    rm -f "$srcdir/veracrypt-userspace/.lurker-patch-sha256" \
        "$srcdir/lkl-userspace/.lurker-patch-sha256"
    mkdir -p "$srcdir/native"
    ln -sfn "$srcdir/veracrypt-userspace" "$srcdir/native/veracrypt"
    ln -sfn "$srcdir/lkl-userspace" "$srcdir/native/lkl"
}

build() {
    cd "$srcdir/lurker"
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
    cd "$srcdir/lurker"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"
    if [[ ${RUSTFLAGS:-} != *"--remap-path-prefix=$srcdir=/usr/src/debug/lurker"* ]]; then
        export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/debug/lurker"
    fi
    cargo test --release --locked --offline --workspace
}

package() {
    cd "$srcdir/lurker"
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
