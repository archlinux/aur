# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Evert Vorster <evorster@gmail.com>
# Contributor: Emir-Eins <emir-eins@outlook.com>
# Contributor: Wuxxin <wuxxin@gmail.com>

pkgname=openclaw
pkgver=2026.5.12
pkgrel=1
pkgdesc='Multi-channel AI gateway with extensible messaging integrations'
arch=(x86_64 aarch64)
url=https://github.com/openclaw/openclaw
license=(MIT)

depends=('nodejs>=22')
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha256sums=(1cae4d1d4132e5fd548478ab3ad3c578627a9c78e37e67379dde7659c674bf1e)
options=(!debug !strip)
install=$pkgname.install
noextract=($pkgname-$pkgver.tgz)

package() {
    export SHARP_IGNORE_GLOBAL_LIBVIPS=1
    npm install --silent --global --cache "$srcdir"/npm-cache \
        --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz

    cat > $pkgname <<'EOF'
#!/bin/sh
export SHARP_IGNORE_GLOBAL_LIBVIPS=1
exec node /usr/lib/node_modules/openclaw/openclaw.mjs "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname

    cd "$pkgdir"/usr/lib/node_modules/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md CHANGELOG.md
    for f in docs/*
    do ln -s /usr/lib/node_modules/$pkgname/"$f" "$pkgdir"/usr/share/doc/$pkgname/
    done
}
