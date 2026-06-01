# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pylance
_pkgname=pylance
pkgver=7.0.0
pkgrel=1
pkgdesc="Python wrapper for the Lance columnar data format"
arch=('x86_64')
url="https://github.com/lance-format/lance"
license=('Apache-2.0')
depends=(
    'python'
    'python-pyarrow'
    'python-numpy'
    'python-lance-namespace'
    'zstd'
    'lz4'
    'bzip2'
    'xz'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-maturin'
    'rust'
    'protobuf'
    'cmake'
    'pkgconf'
    'openssl'
    'patchelf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/lance-format/lance/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8e34fbb8f2cc31cbf7d4116a890078ec62dc3bf9c06509bad7c86670d5b2c743')

prepare() {
    cd "lance-$pkgver"
    # Remove rust-toolchain.toml to use system Rust instead of downloading via rustup
    rm -f python/rust-toolchain.toml rust-toolchain.toml
    # Replace .cargo/config.toml: use fat LTO for proper static linking,
    # remove target-specific CPU flags and linker-plugin-lto
    cat > .cargo/config.toml << 'CARGOEOF'
[profile.release]
lto = "fat"
codegen-units = 1
CARGOEOF

    # Add a build script to the pylance crate that forces the linker to include
    # aws-lc-sys and ring static libraries (cargo doesn't propagate transitive
    # native static deps to cdylib targets)
    cat > python/build.rs << 'BUILDEOF'
use std::path::PathBuf;

fn main() {
    // Find and link the aws-lc-sys and ring static libraries.
    // These are built by their respective build scripts but cargo doesn't
    // propagate native static link directives to downstream cdylib crates.
    let out_dir = std::env::var("OUT_DIR").unwrap();
    // OUT_DIR is like .../target/release/build/pylance-<hash>/out
    // We need .../target/release/build/
    let build_dir = PathBuf::from(&out_dir)
        .parent().unwrap()  // pylance-<hash>
        .parent().unwrap()  // build/
        .to_path_buf();

    for entry in std::fs::read_dir(&build_dir).unwrap() {
        let entry = entry.unwrap();
        let name = entry.file_name().to_string_lossy().to_string();
        if name.starts_with("aws-lc-sys-") || name.starts_with("ring-") {
            let out_path = entry.path().join("out");
            if out_path.is_dir() {
                println!("cargo:rustc-link-search=native={}", out_path.display());
                // Find .a files in the out directory
                if let Ok(files) = std::fs::read_dir(&out_path) {
                    for f in files {
                        let f = f.unwrap();
                        let fname = f.file_name().to_string_lossy().to_string();
                        if fname.starts_with("lib") && fname.ends_with(".a") {
                            let lib_name = &fname[3..fname.len()-2]; // strip "lib" and ".a"
                            println!("cargo:rustc-link-lib=static={}", lib_name);
                        }
                    }
                }
            }
        }
    }
}
BUILDEOF
}

build() {
    cd "lance-$pkgver/python"
    # Use system compression libraries via pkg-config
    export ZSTD_SYS_USE_PKG_CONFIG=1
    export LZ4_SYS_USE_PKG_CONFIG=1
    python -m build --wheel --no-isolation
}

check() {
    cd "lance-$pkgver/python"
    local _wheelfile=$(ls dist/*.whl | head -1)
    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" "$_wheelfile"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    # Fix missing dynamic library references: lzma-sys and lz4-sys build scripts
    # find system libs via pkg-config but cargo doesn't propagate the dynamic link
    # to the final cdylib. Add them explicitly with patchelf.
    local _so="$srcdir/test-install$site_packages/lance/lance.abi3.so"
    patchelf --add-needed liblzma.so.5 "$_so"
    patchelf --add-needed liblz4.so.1 "$_so"
    PYTHONPATH="$srcdir/test-install$site_packages:$PYTHONPATH" python -c "
import lance
print(f'lance {lance.__version__} imported successfully')
"
}

package() {
    cd "lance-$pkgver/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
    # Fix missing dynamic library references (same as check)
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local _so="$pkgdir$site_packages/lance/lance.abi3.so"
    patchelf --add-needed liblzma.so.5 "$_so"
    patchelf --add-needed liblz4.so.1 "$_so"
    install -Dm644 "$srcdir/lance-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
