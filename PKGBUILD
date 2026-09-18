# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-git
pkgver=r4710.52e9d9c8
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS, BTRFS, or NILFS snapshots."
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
provides=('httm')
conflicts=('httm' 'httm-bin')
options=('!strip' '!emptydirs')
depends=('gcc-libs' 'mimalloc')
optdepends=('btrfs-progs: BTRFS support'
	    'zfs-utils: ZFS support'
            'nilfs-utils: NILFS2 support')
makedepends=('cargo' 'git' 'cmake')
source=("git+https://github.com/kimono-koans/httm.git")
sha512sums=('SKIP')

pkgver()
{
	cd "$srcdir/httm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/httm"
    git checkout Cargo.toml Cargo.lock 2>/dev/null || true

    # Prefetch dependencies to populate cargo cache
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

    # Unpack skim into a local directory for patching
    rm -rf "${srcdir}/skim"
    local skim_crate
    skim_crate=$(find "${CARGO_HOME:-$HOME/.cargo}/registry/cache" -name "skim-5.7.0.crate" | head -n1)
    mkdir -p "${srcdir}/skim"
    tar -xzf "$skim_crate" -C "${srcdir}/skim" --strip-components=1

    # Remove the entire mimalloc dependency section
    sed -i '/\[dependencies\.mimalloc\]/,/^\[/ { /\[dependencies\.mimalloc\]/d; /^\[/!d }' "${srcdir}/skim/Cargo.toml"

    # Remove the global allocator attribute and static definition
    sed -i '/#\[global_allocator\]/d' "${srcdir}/skim/src/lib.rs"
    sed -i '/GLOBAL_ALLOCATOR/d' "${srcdir}/skim/src/lib.rs"

    # Patch httm to use the unbundled local skim
    cat >> Cargo.toml <<EOF

[patch.crates-io]
skim = { path = "${srcdir}/skim" }
EOF
}

build() {
    cd "${srcdir}/httm"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release
}

package(){
	# install executable
	install -Dm755 "${srcdir}/httm/target/release/httm" "${pkgdir}/usr/bin/httm"

	# install helper scripts
	install -Dm755 "${srcdir}/httm/scripts/bowie.bash" "${pkgdir}/usr/bin/bowie"
	install -Dm755 "${srcdir}/httm/scripts/nicotine.bash" "${pkgdir}/usr/bin/httm-nicotine"

	[[ -z "$(
			command -v zfs
			exit 0
		)" ]] || install -Dm755 "${srcdir}/httm/scripts/ounce.bash" "${pkgdir}/usr/bin/ounce"

	[[ -n "$(
			command -v zfs
			exit 0
		)" ]] || echo "zfs not in path, helper script 'ounce' not installed"

	# install man page
	install -Dm644 "${srcdir}/httm/httm.1" "${pkgdir}/usr/share/man/man1/httm.1"

	# install README.md
	install -Dm644 "${srcdir}/httm/README.md" "${pkgdir}/usr/share/doc/httm/README.md"

	# install LICENSE
	install -Dm644 "${srcdir}/httm/LICENSE" "${pkgdir}/usr/share/licenses/httm/LICENSE"
}
