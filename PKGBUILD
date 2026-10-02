# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=cloudflare-cf
_npmname=cf
pkgver=1.0.0_beta.11
_npmver=${pkgver/_/-}
pkgrel=1
pkgdesc="Agentic command-line interface for the entire Cloudflare API"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudflare/cf"
license=('MIT OR Apache-2.0')
# workerd (via miniflare) and sharp ship prebuilt ELF files linked against
# glibc, libgcc_s and libstdc++.
depends=('nodejs>=22' 'glibc' 'libgcc' 'libstdc++')
makedepends=('npm')
optdepends=('cloudflared: use the system binary for tunnels instead of a downloaded copy'
            'xdg-utils: open the browser for OAuth login')
# Both Cloud Foundry CLI packages install /usr/bin/cf.
conflicts=('cloudfoundry-cli' 'cloudfoundry6-cli')
source=("$_npmname-$_npmver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz")
noextract=("$_npmname-$_npmver.tgz")
sha256sums=('34a313543d0f20a54be3a238137cc6c71faa6210d279e9fe34e854158d5aae4c')
# Keep the bundled prebuilt workerd and sharp binaries untouched.
options=('!strip' '!debug')

package() {
    # Isolated cache keeps the build user's ~/.npm untouched.
    npm install -g \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache" \
        --no-audit --no-fund --loglevel=warn \
        "$srcdir/$_npmname-$_npmver.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to the build user.
    # See https://bugs.archlinux.org/task/63396 for details.
    chown -R root:root "$pkgdir"

    rm -rf "$pkgdir/usr/etc"

    local _moddir="$pkgdir/usr/lib/node_modules/$_npmname"
    install -Dm644 "$_moddir/LICENSE-MIT" "$_moddir/LICENSE-APACHE" \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
