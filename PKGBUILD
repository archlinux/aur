# Maintainer: bianca <zhaoxiaokee@gmail.com>

pkgname=bili-live-hime
_upstream=bili-live-hime
pkgver=0.5.1
_tag="LiveHime-v${pkgver}"
pkgrel=1
pkgdesc="bilibili官方直播姬的轻量化替代工具"
arch=('x86_64')
url="https://github.com/Rsplwe/bili-live-hime"
license=('GPL-2.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libayatana-appindicator' 'openssl')
makedepends=('nodejs' 'npm' 'rust' 'cargo')
conflicts=('bili-live-hime-git')
source=("${_upstream}-${_tag}.tar.gz::https://github.com/Rsplwe/${_upstream}/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('29764e777de2670fe1bf1d36111ff13ea5ee1e2d5ea2466d4158122e48730fae')

prepare() {
    cd "${srcdir}/${_upstream}-${_tag}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export npm_config_cache="${srcdir}/npm-cache"

    sed -i 's/^lto = true$/lto = false/' src-tauri/Cargo.toml

    node <<'EOF_NODE'
const fs = require('fs');
const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8'));
delete pkg.overrides;
if (pkg.devDependencies) pkg.devDependencies.vite = '^6.0.0';
fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n');
EOF_NODE

    npm install
}

build() {
    cd "${srcdir}/${_upstream}-${_tag}"

    export CARGO_HOME="${srcdir}/cargo-home"
    export npm_config_cache="${srcdir}/npm-cache"
    export NODE_ENV=production
    export CC=gcc
    export CXX=g++

    unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS RUSTFLAGS
    export RUSTFLAGS='-C linker=gcc'

    local main_css
    main_css=$(find src -name '*.css' | head -n 1)
    if [[ -n "${main_css}" ]]; then
      sed -i '1i @source "./**/*.{ts,tsx,html}";' "${main_css}"
    fi

    npx vite build --base ./
    npx tauri build --no-bundle --config '{"build":{"beforeBuildCommand":""}}'
}

package() {
    cd "${srcdir}/${_upstream}-${_tag}"

    install -Dm755 "src-tauri/target/release/${_upstream}" "${pkgdir}/usr/bin/${_upstream}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for size in 32 128; do
      install -Dm644 "src-tauri/icons/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${_upstream}.png"
    done

    install -Dm644 "src-tauri/icons/128x128@2x.png" \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_upstream}.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_upstream}.desktop" <<EOF_DESKTOP
[Desktop Entry]
Name=Bili Live Hime
Exec=${_upstream}
Icon=${_upstream}
Type=Application
Categories=AudioVideo;Video;
Comment=${pkgdesc}
Terminal=false
EOF_DESKTOP
}
