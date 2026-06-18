# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=proton-drive
pkgname=$_pkgname-cli
pkgver=0.4.6
pkgrel=1
pkgdesc='Official Proton Drive command-line client'
arch=(x86_64 aarch64)
url=https://github.com/protondriveapps/sdk
license=(MIT)

depends=('bun>=1.3.14' libsecret)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/cli/v$pkgver.tar.gz)
sha256sums=(c4c3f5364c00643c7e43b041bac5e031ec38fac88d69f245d337d85d1127bb8e)

build() {
    cd "$srcdir"/sdk-cli-v$pkgver/js/sdk
    bun install
    _sdkver=$(sed -n 's/^## js\/v\([0-9.]*\).*/\1/p' ../CHANGELOG.md | head -1)

    cd ../cli
    bun install --frozen-lockfile
    mkdir -p release

    NODE_ENV=production bun build \
        --target=bun \
        --format=esm \
        --minify \
        --sourcemap=inline \
        --define "APP_VERSION='cli-drive-archlinux@$pkgver'" \
        --define "SDK_VERSION='js@$_sdkver'" \
        --define "SENTRY_DSN=''" \
        src/proton-drive.ts \
        --outfile=release/proton-drive.js
}

package() {
    cd "$srcdir"/sdk-cli-v$pkgver/js/cli
    install -Dm644 -t "$pkgdir"/usr/lib/$pkgname release/proton-drive.js
    cat > $_pkgname << 'EOF'
#!/bin/sh
exec bun /usr/lib/proton-drive-cli/proton-drive.js "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin $_pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ../../LICENSE.md
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname CHANGELOG.md README.md
}
