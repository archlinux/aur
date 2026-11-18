# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=kicad-routing-tools
_name=KiCadRoutingTools
pkgver=0.24.1
pkgrel=1
pkgdesc='Rust-accelerated autorouter and routing tools for KiCad (pcbnew plugin and CLI)'
arch=('x86_64' 'aarch64')
url='https://github.com/drandyhaas/KiCadRoutingTools'
license=('MIT')
depends=('gcc-libs' 'glibc' 'kicad' 'python' 'python-numpy' 'python-scipy' 'python-shapely')
makedepends=('cargo')
# makepkg's LTO turns the bundled mimalloc C objects into GCC bitcode the Rust link
# cannot use (undefined mi_malloc_aligned at import). Cargo.toml's own lto still applies.
options=('!lto')
# The bus routing step also needs OR-Tools (ortools), which Arch does not package.
optdepends=('python-pillow: board and placement rendering')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfb6a14066d4ade82f66c557ff37dcf2feaa567459a74a6e48e3ec5c4466e298')

prepare() {
    cd "$_name-$pkgver/rust_router"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$_name-$pkgver/rust_router"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    # pyo3 builds against the abi3 stable ABI, so one module works on any Python >= 3.9.
    cargo build --frozen --release
}

package() {
    cd "$_name-$pkgver"
    local _dst="$pkgdir/usr/share/kicad/scripting/plugins/$_name"
    install -d "$_dst"

    # Same file set as upstream's PCM package: the tree minus build/install tooling,
    # tests, docs and sample boards; of .claude/ only the routing skills.
    local _f
    for _f in * .claude; do
        case $_f in
            build_router.py | install_plugin.py | package_pcm.py | update_metadata.py | \
                metadata.json | tests | docs | kicad_files) continue ;;
        esac
        cp -r --no-preserve=ownership "$_f" "$_dst/"
    done
    find "$_dst/.claude" -mindepth 1 -maxdepth 1 ! -name skills -exec rm -rf {} +
    rm -rf "$_dst/rust_router/target" "$_dst/rust_router/Cargo.lock"

    # The plugin imports rust_router/grid_router.so; with it present it never writes there.
    install -Dm755 rust_router/target/release/libgrid_router.so "$_dst/rust_router/grid_router.so"

    python -m compileall -q -d "/usr/share/kicad/scripting/plugins/$_name" "$_dst"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
