# Maintainer: MopigamesYT <mopigames@proton.me>
pkgname=high-tide-launcher-git
pkgver=0.1.0.r3.g065d31d
pkgrel=1
pkgdesc='Native GTK4 launcher for Vape on Linux (git)'
arch=('x86_64')
url='https://github.com/MopigamesYT/High-Tide'
license=('LicenseRef-Unknown')
depends=('gtk4>=4.12' 'glib2' 'glibc' 'libgcc' 'cairo' 'hicolor-icon-theme'
         'python' 'bash' 'jdk17-openjdk' 'java-runtime>=17'
         'unzip' 'coreutils' 'findutils' 'gawk' 'sed' 'grep' 'procps-ng'
         'util-linux' 'fontconfig' 'freetype2' 'libx11' 'libxtst' 'libxi'
         'libxext' 'glu' 'libglvnd')
makedepends=('git' 'cargo' 'pkgconf')
checkdepends=('desktop-file-utils')
optdepends=('wine: account sign-in and payload extraction'
            'wireshark-cli: loopback capture and payload assembly'
            'nftables: Wine login network workaround'
            'polkit: desktop authentication for temporary capture access'
            'prismlauncher: launch Minecraft instances')
provides=('high-tide' 'high-tide-launcher')
conflicts=('high-tide' 'high-tide-launcher')
# Preserve the shipped native bridges byte-for-byte; they cannot be rebuilt from
# the source in this repository. The Rust binary is stripped by its own profile.
options=('!strip' '!debug')
# The checkout uses $pkgname, not "high-tide": the wrapper source file below
# claims that name in $srcdir, and the two would collide.
source=("$pkgname::git+https://github.com/MopigamesYT/High-Tide.git"
        'collect_backend.py'
        'high-tide'
        'test_workspace.py'
        'dev.hightide.Launcher.desktop'
        'dev.hightide.capture.policy'
        'LICENSE-NOTICE')
sha256sums=('SKIP'
            '7ee9ad1f396293bf4a8c6fb3bc84bc0d43b1ef26f036e83bfa70c37bd053a073'
            '5983bc035d91e5ca86a03cc7f59dcd3d50b6d88540dd09e811c26cdf45bf1b89'
            'e4a38ed610f8f85e1f58d1942b70102b718b2ad1d9773015881ba7e8496833db'
            'e61981f4f808990622b188b94f2c26de00bdd94b4909e3876218f70c7ebc11e0'
            '753eb991ac6f980fa1e349879d5c36982bffa0fac14297144090240f12572080'
            'b9f67d9e65ce8bd850f6eaf2a72e7bf58316cd7ef55d54b442465cc60a315698')

pkgver() {
    cd "$srcdir/$pkgname"
    local version
    version="$(sed -n '/^\[package\]/,/^\[/ s/^version *= *"\(.*\)"/\1/p' launcher/Cargo.toml | head -1)"
    printf '%s.r%s.g%s' "${version:-0.1.0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    cargo fetch --locked --manifest-path launcher/Cargo.toml
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    # Target baseline x86-64 rather than the build machine's CPU.
    export RUSTFLAGS='-C target-cpu=x86-64'
    # A reused makepkg build tree can hold a launcher from an older revision.
    CARGO_TARGET_DIR="$srcdir/target" cargo clean --release -p high-tide --manifest-path launcher/Cargo.toml
    CARGO_TARGET_DIR="$srcdir/target" cargo build --frozen --release --manifest-path launcher/Cargo.toml
    python3 "$srcdir/collect_backend.py" "$srcdir/$pkgname" "$srcdir"
}

check() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS='-C target-cpu=x86-64'
    CARGO_TARGET_DIR="$srcdir/target" cargo test --frozen --release --manifest-path launcher/Cargo.toml
    python3 "$srcdir/test_workspace.py"
    HIGH_TIDE_CAPTURE_TEST_ROOT="$srcdir/backend" python3 tools/test_capture_session.py
    desktop-file-validate "$srcdir/dev.hightide.Launcher.desktop"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$srcdir/target/release/high-tide" "$pkgdir/usr/lib/high-tide/high-tide"
    install -Dm755 "$srcdir/high-tide" "$pkgdir/usr/bin/high-tide"
    install -Dm755 tools/high-tide-capture-helper "$pkgdir/usr/lib/high-tide/high-tide-capture-helper"
    install -Dm644 "$srcdir/dev.hightide.capture.policy" \
        "$pkgdir/usr/share/polkit-1/actions/dev.hightide.capture.policy"
    # Install only the files the current manifest lists, never a directory
    # wholesale: a reused source tree can still hold an older revision's files.
    python3 - "$srcdir" "$pkgdir/usr/lib/high-tide/backend" <<'PY'
import json, pathlib, shutil, sys
staging, target = pathlib.Path(sys.argv[1]), pathlib.Path(sys.argv[2])
for name in json.loads((staging / 'backend-manifest.json').read_text()):
    destination = target / name
    destination.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(staging / 'backend' / name, destination)
PY
    install -Dm644 "$srcdir/backend-manifest.json" "$pkgdir/usr/lib/high-tide/backend-manifest.json"
    install -Dm644 "$srcdir/dev.hightide.Launcher.desktop" \
        "$pkgdir/usr/share/applications/dev.hightide.Launcher.desktop"
    install -Dm644 launcher/data/dev.hightide.Launcher.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.hightide.Launcher.svg"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 launcher/README.md "$pkgdir/usr/share/doc/$pkgname/launcher.md"
    install -Dm644 "$srcdir/LICENSE-NOTICE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-NOTICE"
}
