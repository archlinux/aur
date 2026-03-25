# Maintainer: futpib <futpib@gmail.com>
pkgname=whitenoise-git
pkgver=r1.g0000000
pkgrel=1
pkgdesc="Secure, private, decentralized chat app built on Nostr using the MLS protocol (git, futpib-bot fork)"
arch=('x86_64')
url="https://whitenoise.chat"
license=('AGPL-3.0-only')
depends=('gtk3' 'libsecret' 'libglvnd' 'sqlcipher' 'openssl')
makedepends=('git' 'rust' 'cargo' 'cmake' 'ninja' 'clang' 'pkgconf' 'patchelf')
provides=('whitenoise')
conflicts=('whitenoise')
source=("whitenoise::git+https://github.com/futpib-bot/whitenoise.git#branch=master"
        "whitenoise.desktop"
        "flutter-sdk-3.41.4.tar.xz::https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.4-stable.tar.xz")
sha256sums=('SKIP'
            '80f0d4430f16214d9e7b5aaafdaa1541143c15e390ccff1c9a87bfe7d577a99a'
            'c9c4e741ebcf83ee88303404176f7e22c3b6abfc8e9d60781098b6d4104327a9')
noextract=('flutter-sdk-3.41.4.tar.xz')

pkgver() {
    cd "whitenoise"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Extract flutter SDK into srcdir
    if [ ! -d "${srcdir}/flutter" ]; then
        bsdtar -xf "${srcdir}/flutter-sdk-3.41.4.tar.xz" -C "${srcdir}"
    fi

    export FLUTTER_ROOT="${srcdir}/flutter"
    export PATH="${FLUTTER_ROOT}/bin:${PATH}"
    export DART_ROOT="${FLUTTER_ROOT}/bin/cache/dart-sdk"

    # Disable analytics and telemetry
    flutter --no-version-check config --no-analytics 2>/dev/null || true

    cd "whitenoise"

    # Remove fvm symlink/config - we use the bundled flutter version directly
    rm -f .fvm .fvmrc

    # Fetch Flutter pub dependencies
    flutter --no-version-check pub get
}

build() {
    export FLUTTER_ROOT="${srcdir}/flutter"
    export PATH="${FLUTTER_ROOT}/bin:${PATH}"
    # Ensure tool_backend.sh (called by cmake/ninja) finds the bundled dart
    export DART_ROOT="${FLUTTER_ROOT}/bin/cache/dart-sdk"

    # Use a cargo cache inside srcdir
    export CARGO_HOME="${srcdir}/cargo-home"
    mkdir -p "${CARGO_HOME}"

    # Force system pkg-config lookup for sqlcipher/sqlite3.
    # The whitenoise-rs crate depends on rusqlite with the "bundled-sqlcipher" feature,
    # which compiles SQLCipher. Without this flag, proc-macros (host-side) get
    # a bundled static sqlite3 that fails to link into a shared library.
    # With system sqlcipher available and this flag set, both host and target builds
    # use dynamic libsqlcipher, resolving the undefined-symbol error.
    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1

    # Strip -flto from CFLAGS: the secp256k1-sys crate (and other Rust build.rs C
    # compilations) use the cc crate to compile vendored C sources into static archives
    # that are then statically linked by rustc into the cdylib.  When -flto=auto is
    # present in CFLAGS the cc crate emits LTO bitcode objects (.a with IR), but rustc
    # does not invoke the GCC LTO plugin during the final link, leaving many secp256k1
    # symbols undefined in the resulting .so (the crash: "undefined symbol:
    # rustsecp256k1_v0_10_0_context_no_precomp").  Removing -flto forces plain object
    # files so rustc can resolve all symbols at link time.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CFLAGS="${CFLAGS//-flto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto/}"

    cd "whitenoise"

    # Pre-fetch Rust dependencies
    cd rust && cargo fetch --locked && cd ..

    flutter --no-version-check build linux --release --no-pub
}

package() {
    cd "whitenoise"

    # Install the bundle
    local _bundle="build/linux/x64/release/bundle"

    # Main executable
    install -Dm755 "${_bundle}/whitenoise" -t "${pkgdir}/usr/lib/${pkgname}/"

    # Data directory (flutter assets, ICU data, etc.)
    cp -r "${_bundle}/data" "${pkgdir}/usr/lib/${pkgname}/"

    # Shared libraries (flutter engine, Rust cdylib, plugins)
    cp -r "${_bundle}/lib" "${pkgdir}/usr/lib/${pkgname}/"

    # Set rpath in libs so they resolve each other relative to their own location
    find "${pkgdir}/usr/lib/${pkgname}/lib" -name '*.so' -exec \
        patchelf --set-rpath '$ORIGIN' {} \;

    # Symlink executable into /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Icons
    install -Dm644 "assets/svgs/whitenoise.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "assets/images/whitenoise-light.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    # Desktop entry
    install -Dm644 "${srcdir}/whitenoise.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
