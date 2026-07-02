# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=proton-drive
pkgname=$_pkgname-cli
pkgver=0.4.6
pkgrel=1
pkgdesc='Official Proton Drive command-line client'
arch=(x86_64 aarch64)
url=https://github.com/protondriveapps/sdk
license=(MIT)

_cliver=$pkgver
_jsver=0.19.1
# _tag=cli/v$_cliver
_tag=js/v$_jsver
depends=('bun>=1.3.14' libsecret)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz)
sha256sums=(10ca2837f71e2e6023aa9e3e488c74b0237e7d2386cb2e1c250b074a1d426549)

prepare() {
    mv "$srcdir"/sdk-* "$srcdir"/sdk
}

build() {
    cd "$srcdir"/sdk/client/js
    bun install

    cd ../../incubating/account/js
    bun install

    cd ../../../cli
    bun install --frozen-lockfile
    mkdir -p release

    CLI_APP_VERSION_NAME=cli-drive-archlinux \
    CLI_VERSION=$_cliver \
    JS_VERSION=$_jsver \
    SENTRY_DSN="" \
    bun run build:bundle
}

package() {
    cd "$srcdir"/sdk/cli
    install -Dm644 -t "$pkgdir"/usr/lib/$pkgname release/proton-drive.js
    cat > $_pkgname << 'EOF'
#!/bin/sh
exec bun /usr/lib/proton-drive-cli/proton-drive.js "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin $_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ../LICENSE.md
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname CHANGELOG.md README.md

    cd ../client/js
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG-sdk.md
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README-sdk.md
}
