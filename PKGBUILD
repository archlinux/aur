# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mailflow
pkgver=3.8.2
pkgrel=1
pkgdesc='Self-hosted unified webmail client'
arch=('x86_64')
url='https://github.com/maathimself/mailflow'
license=('AGPL-3.0-only')
_nodever=22.23.3
depends=('glibc')
makedepends=('nvm')
optdepends=(
    'postgresql>=16: local database server'
    'redis: local session store'
    'nginx: reverse proxy and static frontend'
)
backup=('etc/mailflow/mailflow.env')
install=mailflow.install
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
    'listen-host.patch'
    'mailflow.service'
    'mailflow.sysusers'
    'mailflow.tmpfiles'
    'mailflow.env'
    'mailflow.nginx.conf'
    "node-v${_nodever}-linux-x64.tar.xz::https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.xz"
)
noextract=("node-v${_nodever}-linux-x64.tar.xz")
sha512sums=('ac2a2b7e5c7c6c1aee5191dbbbe65a4e83be3683b035f5b682afbd07e94536bf87d58dbbe2220e19991c9d1158b88a695ee440cdbe3fb5badc2f473f4207d276'
            '1ec6fa4942d64b0b58f357a40cfc7ef2b9bccfb23025b6e2160b4241c17469862c57fe320189bb45072d75438f625c29882071fa61c702ade48b8c1df1bb633f'
            '82bfb4572f22f4cdd0603e0e276d8009f0fcc49c2460e449822abe1b50f8e1187922dd9294e988ce273ba9c93778d85ba55fc2d268704c0951b56da0ca16f7ed'
            '28a031baab898730af2377cbce2f840f166d8df38113b07f2a5a817aed48fa06f7e126d7e54c7b02866bcbac9fc09260d70c233f0a16800856700c459de95dba'
            '6eb1876c58b01dd5cef329e612a8ffefaf24f71927b49ab7fc3ed0bb2022f5b907670eeadf47426ae069e92dc8265cadf4eb805e34dbb0ca3a0c4581cb58df8f'
            '1406c85323f37eed7830e9e89ab3991151ddf47732480352e2e48bdb9783478af94e0e036d42756a6db8462fc3104ffca6ca9777bb3bea9e4e641628840ab2db'
            '737b706277e08d3fd04623881922f0c1e0700136981ef96051839a42e38b9a58d80c0b150e9d3f889186699c96d5313ef9e952f1bce681f825d738630eca9646'
            '2328e1770768d2ed352d6434b4465cce0af280c41f5417224fbd1d81a2d6063eb4ed41938c2dec8e0dabcd38361695643796b8765c495cbf4bfefd020f81f925')

_use_node() {
    export NVM_DIR="$srcdir/.nvm"
    local dest="$NVM_DIR/versions/node/v${_nodever}"
    if [[ ! -x "$dest/bin/node" ]]; then
        mkdir -p "$NVM_DIR/versions/node"
        tar -xJf "$srcdir/node-v${_nodever}-linux-x64.tar.xz" -C "$NVM_DIR/versions/node"
        mv "$NVM_DIR/versions/node/node-v${_nodever}-linux-x64" "$dest"
    fi
    source /usr/share/nvm/init-nvm.sh
    nvm install --offline --skip-default-packages "${_nodever}"
    nvm use "${_nodever}"
}

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="$srcdir/listen-host.patch"
}

build() {
    _use_node

    cd "$pkgname-$pkgver"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export npm_config_cache="$srcdir/npm-cache"
    export npm_config_audit=false
    export npm_config_fund=false

    cd frontend
    npm ci
    npm run build
    cd ../backend
    npm ci --omit=dev --omit=optional
}

package() {
    cd "$pkgname-$pkgver"

    local appdir="$pkgdir/usr/share/webapps/mailflow"
    local node_prefix

    node_prefix="$srcdir/.nvm/versions/node/v${_nodever}"
    install -Dm755 "$node_prefix/bin/node" "$pkgdir/usr/lib/mailflow/node"
    strip --strip-all "$pkgdir/usr/lib/mailflow/node"
    install -Dm644 "$node_prefix/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-node"

    install -Dm644 backend/package.json "$appdir/package.json"
    printf '{"version":"%s"}\n' "$pkgver" > "$appdir/build-meta.json"
    cp -a backend/migrations "$appdir/migrations"
    cp -a backend/src "$appdir/src"
    find "$appdir/src" -name '*.test.js' -delete
    cp -a backend/node_modules "$appdir/node_modules"
    # tar-stream depends on bare-* for the Bare runtime. Node uses its own fs.
    # Those prebuilds are ELF files for other platforms.
    find "$appdir/node_modules" -type d -name prebuilds -prune -exec rm -rf {} +
    find "$appdir/node_modules" -type d -empty -delete
    install -dm755 "$appdir/frontend"
    cp -a frontend/dist/. "$appdir/frontend/"

    install -Dm644 "$srcdir/mailflow.service" \
        "$pkgdir/usr/lib/systemd/system/mailflow.service"
    install -Dm644 "$srcdir/mailflow.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/mailflow.conf"
    install -Dm644 "$srcdir/mailflow.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/mailflow.conf"
    install -Dm640 "$srcdir/mailflow.env" \
        "$pkgdir/etc/mailflow/mailflow.env"
    install -Dm644 "$srcdir/mailflow.nginx.conf" \
        "$pkgdir/usr/share/mailflow/nginx.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
