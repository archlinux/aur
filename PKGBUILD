# Maintainer: Neboer <rubinposter@gmail.com>
pkgname=deepseek-free-api-git
pkgver=0.0.21
pkgrel=2
pkgdesc="DeepSeek V3 Free Service API"
arch=('x86_64')
url="https://github.com/LLM-Red-Team/deepseek-free-api"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('yarn' 'npm')
backup=('etc/deepseek-free-api/config.env' 'etc/deepseek-free-api/system.yml')
provides=("deepseek-free-api")
conflicts=("deepseek-free-api")
options=()
source=("git+https://github.com/LLM-Red-Team/deepseek-free-api.git"
        "deepseek-free-api.sysusers"
        "deepseek-free-api.service"
        "config.env"
        "system.yml")

sha256sums=('SKIP'
            '4806233295ce40630f0bdd9226ef27eab8083594d8faf5f01ceb5900f636acd6'
            '8d1115e202ec9f2be8d163c6fc149dac56d1c5d3a522ec9df2140822d6b51d02'
            'c91381085b14292783c04b178f8c457f13b249b5ee4039e32a07cc398a2d8576'
            'b4025f93844adbb98df9d877e6ce092f63ddf8fb50cf53167e1f9192164eedb0')

pkgver() {
    cd "$srcdir/deepseek-free-api"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

build() {
    cd "$srcdir/deepseek-free-api"
    
    # Build in release mode. Do not use --prod, as it will not install tsup, this is a mistake.
	yarn install --frozen-lockfile
	yarn run build
    npx --yes @vercel/ncc build dist/index.js --minify --out ncc-dist --asset-builds
}

package() {
    cd "$srcdir/deepseek-free-api"
    
    # Install the binary
    mkdir -p "$pkgdir/usr/lib/deepseek-free-api"

    install -Dm644 "ncc-dist/index.js" "$pkgdir/usr/lib/deepseek-free-api"
    install -Dm644 "package.json" "$pkgdir/usr/lib/deepseek-free-api/package.json"
    # install -Dm644 "*.wasm" "$pkgdir/usr/lib/deepseek-free-api"
    find . -name '*.wasm' -maxdepth 1 -exec install -Dm644 {} "$pkgdir/usr/lib/deepseek-free-api" \;

    # skip node_modules, as it is not needed for the package. we have already use ncc to bundle the package.
    # cp -r "node_modules" "$pkgdir/usr/lib/deepseek-free-api"
    cp -r "public" "$pkgdir/usr/lib/deepseek-free-api"

    # create config dir, will install config files here.
    mkdir -p "$pkgdir/usr/lib/deepseek-free-api/configs/prod"

 
    # Install the LICENSE and README
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/deepseek-free-api/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/deepseek-free-api/README.md"
    
    # Install the configuration file
    install -Dm644 "$srcdir/config.env" "$pkgdir/etc/deepseek-free-api/config.env"
    install -Dm644 "$srcdir/system.yml" "$pkgdir/etc/deepseek-free-api/system.yml"
    # Create a symbolic link for system.yml
    ln -s "/etc/deepseek-free-api/system.yml" "$pkgdir/usr/lib/deepseek-free-api/configs/prod/system.yml"

 
    # Install User, Service
    install -Dm644 "$srcdir/deepseek-free-api.sysusers" "$pkgdir/usr/lib/sysusers.d/deepseek-free-api.conf"
    install -Dm644 "$srcdir/deepseek-free-api.service" "$pkgdir/usr/lib/systemd/system/deepseek-free-api.service"
}
