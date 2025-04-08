# Maintainer: Neboer <rubinposter@gmail.com>
pkgname=deepseek-free-api-git
pkgver=0.0.21
pkgrel=1
pkgdesc="DeepSeek V3 Free Service API"
arch=('x86_64')
url="https://github.com/LLM-Red-Team/deepseek-free-api"
license=('GPL-3.0-only')
depends=('nodejs')
makedepends=('yarn')
backup=('etc/deepseek-free-api/config.env' 'etc/deepseek-free-api/system.yml')
provides=("deepseek-free-api")
conflicts=("deepseek-free-api")
options=()
install=deepseek-free-api.install
source=("git+https://github.com/LLM-Red-Team/deepseek-free-api.git"
        "deepseek-free-api.sysusers"
        "deepseek-free-api.service"
        "config.env"
        "system.yml")
sha256sums=('SKIP'
            '3727d2e895c683c85b654a5370210983a6d822289a994725f5bbe470fc356277'
            '8bcaa4a2111835e65b1172f0642a03e934b06eec64485fa0934ab5b75dd59306'
            'c91381085b14292783c04b178f8c457f13b249b5ee4039e32a07cc398a2d8576'
            '1625d8a79fb0963c1769c8d9a82690e79ad67f3cd16c229f52ee47921a691578')

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
}

package() {
    cd "$srcdir/deepseek-free-api"
    
    # Install the binary
    mkdir -p "$pkgdir/usr/lib/deepseek-free-api"

    install -Dm644 "dist/index.js" "$pkgdir/usr/lib/deepseek-free-api/index.js"
    install -Dm644 "package.json" "$pkgdir/usr/lib/deepseek-free-api/package.json"

    cp -r "node_modules" "$pkgdir/usr/lib/deepseek-free-api"
    cp -r "public" "$pkgdir/usr/lib/deepseek-free-api/"

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
