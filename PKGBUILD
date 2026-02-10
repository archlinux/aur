# Maintainer: Antony-hash512 <https://github.com/Antony-hash512>
pkgname=zero-kelvin
pkgver=0.3.0
pkgrel=3
pkgdesc="Cold storage utility for SquashFS-based data offloading with LUKS encryption support"
arch=('x86_64')
url="https://github.com/Antony-hash512/Zero-Kelvin"
license=('GPL3')
depends=(
    'glibc'
    'gcc-libs'
    'squashfs-tools'       # mksquashfs, unsquashfs
    'squashfs-tools-ng'    # tar2sqfs
    'squashfuse'           # FUSE mount without root
    'cryptsetup'           # LUKS encryption
    'rsync'                # File synchronization for unfreeze
    'util-linux'           # mount/umount, findmnt, lsblk
)
makedepends=('cargo' 'git')
checkdepends=('fish' 'bats')
optdepends=(
    #'rclone: Stream SquashFS images directly to remote storage (NAS/cloud)' #(todo)
)
provides=('0k' '0k-core' '0k-safe-rm' 'zero-kelvin-core' 'zero-kelvin-safe-rm')
conflicts=('zero-kelvin-testing')
source=("$pkgname::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

options=(!debug !lto)

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable

    # Unit tests
    cargo test --release --locked --features testing

    # Integration tests (shell, no root)
    fish tests/run_shell_tests.fish --no-build-release --no-root
}

package() {
    cd "$pkgname"

    # Binaries
    install -Dm755 "target/release/0k"         "$pkgdir/usr/bin/0k"
    install -Dm755 "target/release/0k-core"    "$pkgdir/usr/bin/0k-core"
    install -Dm755 "target/release/0k-safe-rm" "$pkgdir/usr/bin/0k-safe-rm"

    # Alias symlinks
    ln -s 0k         "$pkgdir/usr/bin/zero-kelvin"
    ln -s 0k-core    "$pkgdir/usr/bin/zero-kelvin-core"
    ln -s 0k-safe-rm "$pkgdir/usr/bin/zero-kelvin-safe-rm"

    # License
    install -Dm644 LICENSE.GPLv3 "$pkgdir/usr/share/licenses/$pkgname/LICENSE.GPLv3"
    install -Dm644 LICENSE.docs "$pkgdir/usr/share/licenses/$pkgname/LICENSE.docs"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Man pages
    install -Dm644 man/0k.1      "$pkgdir/usr/share/man/man1/0k.1"
    install -Dm644 man/0k-core.1 "$pkgdir/usr/share/man/man1/0k-core.1"

    # Man page symlinks for aliases
    ln -s 0k.1      "$pkgdir/usr/share/man/man1/zero-kelvin.1"
    ln -s 0k-core.1 "$pkgdir/usr/share/man/man1/zero-kelvin-core.1"
}
