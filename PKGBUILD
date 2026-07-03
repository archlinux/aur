# Maintainer: Wanxp <977741432@qq.com>
pkgname=rssh-git
_pkgname=rssh
pkgver=0.2.11.r0.gf87d752
pkgrel=2
pkgdesc="SSH client built to be an AI ops copilot (latest git)"
arch=('x86_64' 'aarch64')
url="https://github.com/shihuili1218/rssh"
license=('MIT')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'librsvg'
    'libsecret'
    'systemd-libs'
)
makedepends=(
    'git'
    'rust'
    'npm'
    'pkgconf'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!lto')
source=(
    "git+${url}.git"
    "${_pkgname}.desktop"
)
sha256sums=(
    'SKIP'
    '77d851d63f705d8e302e56645a948e710ef674beee130fdc1e67a129e285ee0a'
)

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags --match 'v[0-9]*' \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    local app_version
    app_version="$(git describe --tags --abbrev=0 --match 'v[0-9]*' | sed 's/^v//')"

    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="${srcdir}/npm-cache"

    RSSH_APP_VERSION="${app_version}" node <<'NODE'
const fs = require('fs');
const version = process.env.RSSH_APP_VERSION;

function updateJson(path, update) {
  const data = JSON.parse(fs.readFileSync(path, 'utf8'));
  update(data);
  fs.writeFileSync(path, `${JSON.stringify(data, null, 2)}\n`);
}

function updateText(path, pattern) {
  const input = fs.readFileSync(path, 'utf8');
  const output = input.replace(pattern, `$1${version}$2`);
  if (output === input) {
    throw new Error(`failed to update version in ${path}`);
  }
  fs.writeFileSync(path, output);
}

updateJson('package.json', data => {
  data.version = version;
});

updateJson('package-lock.json', data => {
  data.version = version;
  if (data.packages && data.packages['']) {
    data.packages[''].version = version;
  }
});

updateJson('src-tauri/tauri.conf.json', data => {
  data.version = version;
});

updateText('src-tauri/Cargo.toml', /^(\[package\]\nname = "rssh"\nversion = ")[^"]+(")/);
updateText('src-tauri/Cargo.lock', /(\[\[package\]\]\nname = "rssh"\nversion = ")[^"]+(")/);
NODE

    npm ci
    cargo fetch --locked --manifest-path src-tauri/Cargo.toml

    # Arch packages should not install into /usr/local.  Keep one public command
    # (`/usr/bin/rssh`) for the CLI and let it launch the GUI from /usr/lib.
    sed -e 's|/usr/bin/rssh|/usr/lib/rssh/rssh-gui|g' \
        -i src-tauri/src/bin/rssh/main.rs

    # Upstream's settings page checks /usr/local because its in-app installer
    # writes there.  The AUR package installs the CLI into /usr/bin, so teach the
    # packaged GUI to detect the package-managed binary.
    if ! grep -q 'PathBuf::from("/usr/bin").join(name)' src-tauri/src/commands/cli.rs; then
        sed -e '/PathBuf::from("\/usr\/local\/bin").join(name),/a\            PathBuf::from("/usr/bin").join(name),' \
            -i src-tauri/src/commands/cli.rs
    fi
}

build() {
    cd "${srcdir}/${_pkgname}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export npm_config_cache="${srcdir}/npm-cache"

    npm run build

    cd src-tauri
    cargo build --release --locked --features cli --bin rssh-cli
    cargo build --release --locked --features custom-protocol --bin rssh
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 src-tauri/target/release/rssh-cli "${pkgdir}/usr/bin/rssh"
    ln -s rssh "${pkgdir}/usr/bin/rssh-cli"
    install -Dm755 src-tauri/target/release/rssh "${pkgdir}/usr/lib/rssh/rssh-gui"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    if [[ -f src-tauri/icons/32x32.png ]]; then
        install -Dm644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
    fi
    if [[ -f src-tauri/icons/64x64.png ]]; then
        install -Dm644 src-tauri/icons/64x64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png"
    fi
    if [[ -f src-tauri/icons/128x128.png ]]; then
        install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
    fi
    if [[ -f src-tauri/icons/128x128@2x.png ]]; then
        install -Dm644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
    fi
}
