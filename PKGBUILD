# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=listmonk-git
_pkgname=${pkgname%-git}
pkgver=1.0.0.r21.g44adcd4
pkgrel=1
pkgdesc='Self-hosted newsletter and mailing list manager with a modern dashboard'
arch=(x86_64)
url=https://listmonk.app
license=(AGPL3)
depends=(postgresql)
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=(git go node-gyp nodejs yarn)
backup=(etc/listmonk/config.toml)
install=$_pkgname.install
source=("$pkgname::git+https://github.com/knadh/$_pkgname.git"
        "$_pkgname.conf"
        "$_pkgname.service")
sha256sums=('SKIP'
            '5cfc186438df2408ed88a5bec3a9a4b5f2afb0d3aec41c4cc63b2f5eb810b3cb'
            '809ede70c932183889b2fa567b340fb82cce1ada76c7b0a0b9efb82b87c92fa0')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags --match="v*" |
        sed 's/-beta//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname/frontend"
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    yarn install --prefer-offline --frozen-lockfile
}

build() {
    cd "$pkgname"
    go build \
        -trimpath \
        -buildmode=pie \
        -mod=readonly \
        -modcacherw \
        -ldflags "-extldflags '$LDFLAGS' -X 'main.buildString=Arch Linux AUR v$pkgver-$pkgrel' -X 'main.versionString=v$pkgver'" \
        -o $_pkgname \
        cmd/*.go
    export YARN_CACHE_FOLDER="$srcdir/node_modules"
    export VUE_APP_VERSION="v$pkgver"
    pushd frontend
    yarn build --production --offline --frozen-lockfile
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" $_pkgname
    install -Dm644 config.toml.sample "$pkgdir/etc/$_pkgname/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "../$_pkgname.service"
    install -Dm644 -t "$pkgdir/usr/lib/sysusers.d/" "../$_pkgname.conf"
    install -Dm644 -t "$pkgdir/usr/share/$_pkgname/" \
        config.toml.sample \
        schema.sql \
        queries.sql
    install -Dm644 -t "$pkgdir/usr/share/$_pkgname/frontend/dist/" \
        frontend/dist/favicon.png
    cp -a frontend/dist/frontend "$pkgdir/usr/share/$_pkgname/frontend/dist/"
    cp -a static "$pkgdir/usr/share/$_pkgname/"
    cp -a i18n "$pkgdir/usr/share/$_pkgname/"
}
