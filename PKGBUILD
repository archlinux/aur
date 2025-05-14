# Maintainer: Neboer <rubinposter@gmail.com>
# Contributor: Neboer <rubinposter@gmail.com>

pkgname=uptime-kuma-git
pkgver=2.0.0+beta.2+temp+31+gcd6dc144
pkgver() {
    cd "$srcdir/uptime-kuma"
    local v
    v="$(git describe --tags)"
    v="${v#v}"
    printf %s "${v//-/+}"
}

pkgrel=3
pkgdesc='A fancy self-hosted monitoring tool'

arch=('any')
url="https://github.com/louislam/${pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('uptime-kuma')
provides=('uptime-kuma')
backup=('etc/uptime-kuma.env')

source=(
    "git+https://github.com/louislam/uptime-kuma.git"
    "uptime-kuma.service"
    "uptime-kuma.env"
)

b2sums=('SKIP'
        '19d542c0a7b4faf2124ea3e88420a325b5729371a41803ce0c6ba959f80237d6a79cad0963f09fe18da3b8a48ef9f04535557a49fda2a8d99ad21ba3e27fd549'
        'd5e40af358ace62bb063dd965f09dacd65272eb5f0d411576703c0834488b705ad9e5d7437708953f3abdab20cb8cfff097b9c81b1a3927142d875cae7b020c2')

build() {
    cd "$srcdir/uptime-kuma"
    npm install
    npm run build # generate dist folder
    # npx --yes esbuild server/server.js --bundle --outdir=esbuild-dist --minify --platform=node --packages=external
    # npx --yes esbuild server/server.js --bundle --outdir=esbuild-dist --minify --platform=node --log-limit=9999 --external:aws-sdk --external:better-sqlite3 --external:deasync --external:mock-aws-s3 --external:mysql --external:nock --external:oracledb --external:pg-query-stream --external:sqlite3 '--external:*.html'
}

package() {

    install-include() {
        local relpath="$1"
        local src="$srcdir/uptime-kuma/$relpath"
        local dest="$pkgdir/usr/lib/node_modules/uptime-kuma/$relpath"

        if [ -d "$src" ]; then
            mkdir -p "$(dirname "$dest")"
            cp -r "$src" "$dest"
        else
            install -Dm644 "$src" "$dest"
        fi
    }

    mkdir -p "$pkgdir"/usr/lib/node_modules/uptime-kuma

    install-include server
    install-include src/util.js
    install-include db
    install-include dist
    install-include node_modules
    install-include package.json
    install -D -m 644 "${srcdir}/uptime-kuma.service" ${pkgdir}/usr/lib/systemd/system/uptime-kuma.service
    install -D -m 644 "${srcdir}/uptime-kuma.env" ${pkgdir}/etc/uptime-kuma.env
}
