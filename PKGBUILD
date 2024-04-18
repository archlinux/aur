# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk
pkgver=1.1.0
pkgrel=2
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard'
arch=(x86_64)
url=https://listmonk.app
license=(AGPL3)
depends=(postgresql)
makedepends=(go node-gyp nodejs-lts-fermium yarn)
backup=(etc/listmonk/config.toml)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/knadh/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.conf"
        "$pkgname.service")
sha256sums=('aff006dccf87bc588ebd53651accffdfda3e05cd5b0b6172a7129ebf06303054'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '809ede70c932183889b2fa567b340fb82cce1ada76c7b0a0b9efb82b87c92fa0')

prepare() {
    cd "$pkgname-$pkgver/frontend"
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    yarn install --frozen-lockfile
}

build() {
    cd "$pkgname-$pkgver"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags '$LDFLAGS' -X 'main.buildString=Arch Linux AUR v$pkgver-$pkgrel' -X 'main.versionString=v$pkgver'" \
        -o $pkgname \
        cmd/*.go
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    export VUE_APP_VERSION="v$pkgver"
    pushd frontend
    yarn build
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin" $pkgname
    install -Dm644 config.toml.sample "$pkgdir/etc/$pkgname/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../$pkgname.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "../$pkgname.conf"
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/" \
        config.toml.sample \
        schema.sql \
        queries.sql
    install -Dm644 -t "$pkgdir/usr/share/$pkgname/frontend/dist/" \
        frontend/dist/favicon.png
    cp -a frontend/dist/frontend "$pkgdir/usr/share/$pkgname/frontend/dist/"
    cp -a static "$pkgdir/usr/share/$pkgname/"
    cp -a i18n "$pkgdir/usr/share/$pkgname/"
}
