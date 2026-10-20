# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=mailflow
pkgver=4.0.2
pkgrel=1
pkgdesc='Self-hosted unified webmail client'
arch=('x86_64')
url='https://github.com/maathimself/mailflow'
license=('AGPL-3.0-only')
_nodever=22.23.3
depends=('glibc' 'gcc-libs')
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
sha512sums=('91faca835d454c6bb3d99e36cf450c8f5ccc5d2eb8c61ab604a1a3128bd0aad3b9d2199b999322580d9ccf7b0f68bba31f3bdf8b41d0fd082d2405d554aeabcb'
            '1ec6fa4942d64b0b58f357a40cfc7ef2b9bccfb23025b6e2160b4241c17469862c57fe320189bb45072d75438f625c29882071fa61c702ade48b8c1df1bb633f'
            '9497cc71fabd85126821ee2c13a5a5c5247c336704bad24d56f39b6dafad6e79a4249671c3811a0ede2fe45272711ac5e2b87cf7bf6daeaba4b1005f222a884f'
            '28a031baab898730af2377cbce2f840f166d8df38113b07f2a5a817aed48fa06f7e126d7e54c7b02866bcbac9fc09260d70c233f0a16800856700c459de95dba'
            'fa50340c2e6687ae9952ed215484baca088a1cf83485f90a5daf2c69edfac7bf346ceb251c9609d3c22658c0f9cbae46d4822b4fcb882ed23282994c34d690aa'
            '2f909e2c3c91000ebd0eccc0e25f2755c2d0452a85782a0c80435ab2f39fae2709366e59960250b44499b298d37ad2c695bc12358f631dd700d8070147cc7bee'
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
    # sharp is required at startup (the mail routes import it). Its linux-x64
    # library ships as an optional package, chosen by os/cpu/libc. Omitting
    # optional dependencies leaves `import sharp` unable to load. Arch is
    # glibc; the upstream Docker image pins musl instead.
    npm ci --omit=dev --os=linux --cpu=x64 --libc=glibc
    node --input-type=module -e "
      import sharp from 'sharp';
      const out = await sharp({
        create: { width: 8, height: 8, channels: 3, background: { r: 255, g: 0, b: 0 } }
      }).webp().toBuffer();
      if (out.length < 8) throw new Error('sharp produced an empty image');
    "
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
    # Those prebuilds are ELF files for other platforms. sharp's binaries live
    # under @img and are not in a prebuilds directory; leave them in place.
    find "$appdir/node_modules" -type d -name prebuilds \
        ! -path '*/@img/*' -prune -exec rm -rf {} +
    # sharp records glibc vs musl in config, not in npm's libc field, so both
    # optional builds are unpacked. This package runs on glibc x64. sharp loads
    # @img/sharp-linux-x64 there and does not need the musl or wasm copies.
    find "$appdir/node_modules/@img" -mindepth 1 -maxdepth 1 -type d \
        ! -name 'colour' \
        ! -name 'sharp-linux-x64' \
        ! -name 'sharp-libvips-linux-x64' \
        -exec rm -rf {} +
    find "$appdir/node_modules" -type d -empty -delete
    local sharp_bin vips_lib
    sharp_bin=$(find "$appdir/node_modules/@img/sharp-linux-x64" -type f -name '*.node' -print -quit)
    vips_lib=$(find "$appdir/node_modules/@img/sharp-libvips-linux-x64" -type f -name 'libvips*.so*' -print -quit)
    if [[ -z "$sharp_bin" || -z "$vips_lib" ]]; then
        echo "sharp linux-x64 library is missing from the package" >&2
        return 1
    fi
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
