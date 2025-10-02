# Maintainer: DeepChirp <DeepChirp@outlook.com>

pkgname=rustnet-git
_pkgname=${pkgname%-git}
_reponame=${pkgname%-git}
pkgver=r223.df38754
pkgrel=1
pkgdesc="Real-time network monitoring TUI with process identification via eBPF and deep packet inspection"
arch=('x86_64' 'armv7h' 'aarch64')
_author=domcyrus
url="https://github.com/${_author}/${_reponame}"
license=('Apache-2.0')
depends=('libpcap' 'libelf' 'zlib' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo' 'pkgconf' 'clang' 'llvm' 'lld' 'libbpf')
provides=(${pkgname%-git})
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
install=$_pkgname.install
source=("git+https://github.com/${_author}/${_reponame}.git"
        "rustnet-setcap.hook")
sha256sums=('SKIP'
            'b14ba212f2a589ca327a2e59563a4fdd3787c022baf43b6dc249b03814757cc4')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable

    # https://github.com/briansmith/ring/issues/1444#issuecomment-1763272308
    # So we use Clang instead of GCC.
    export CC="$(command -v clang)"
    export AR="$(command -v llvm-ar)"
    export NM="$(command -v llvm-nm)"
    export RANLIB="$(command -v llvm-ranlib)"
    _LD_LLD="$(command -v ld.lld)"

    export RUSTFLAGS="-Clinker=$CC -Clink-arg=-fuse-ld=${_LD_LLD}"
    export RUSTDOCFLAGS="$RUSTFLAGS"

    export CARGO_PROFILE_RELEASE_LTO=thin
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    # Use ebpf for better performance
    CFLAGS='-flto=auto' cargo build --frozen --release --features ebpf
}

check() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable
    export CC="$(command -v clang)"
    export AR="$(command -v llvm-ar)"
    export NM="$(command -v llvm-nm)"
    export RANLIB="$(command -v llvm-ranlib)"
    _LD_LLD="$(command -v ld.lld)"

    export RUSTFLAGS="-Clinker=$CC -Clink-arg=-fuse-ld=${_LD_LLD}"
    export RUSTDOCFLAGS="$RUSTFLAGS"

    export CARGO_PROFILE_RELEASE_LTO=thin
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    CFLAGS='-flto=auto' cargo test --frozen --release --features ebpf
}

package() {
    cd "$srcdir/$_reponame"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/$_pkgname/hooks/" "$srcdir/rustnet-setcap.hook"
}
