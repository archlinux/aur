# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=cloudflare-wrangler
_npmname=wrangler
pkgver=4.114.0
pkgrel=1
# Source-of-truth commit on cloudflare/workers-sdk for this npm publish,
# extracted from the npm provenance (sigstore) attestation. Used to fetch
# LICENSE files reproducibly because upstream `wrangler@<ver>` tags often
# lag the npm publish by hours/days.
_license_commit=16b3d5a48005c7d92112470119ba96019071e59e
pkgdesc="Command-line interface for building and deploying Cloudflare Workers"
arch=('x86_64' 'aarch64')
url="https://github.com/cloudflare/workers-sdk/tree/main/packages/wrangler"
license=('MIT' 'Apache-2.0')
depends=('nodejs>=22')
makedepends=('npm')
optdepends=('git: required by `wrangler init` and template scaffolding')
provides=('wrangler2')
# Both packages would install /usr/bin/wrangler.
# The legacy AUR `wrangler` is the Erlang Refactorer (unrelated software);
# we still declare the file-level conflict so pacman warns the user.
conflicts=('wrangler')
# Upstream npm tarball ships no LICENSE; fetch dual-license files from the
# monorepo pinned to the provenance commit so updates remain reproducible.
source=("$_npmname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
        "LICENSE-APACHE-$pkgver::https://raw.githubusercontent.com/cloudflare/workers-sdk/$_license_commit/LICENSE-APACHE"
        "LICENSE-MIT-$pkgver::https://raw.githubusercontent.com/cloudflare/workers-sdk/$_license_commit/LICENSE-MIT")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('6a3c24556331642111a1ae96f01f46494b909608ff8fc799d0b9c0818cb9df2b'
            '62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a'
            '9bb3b077cc8628334bab25961223dd8207252c8a56aa054195be38f1c042aaf4')
# wrangler bundles platform-specific native binaries (workerd, esbuild).
# Disable stripping so the prebuilt binaries remain functional.
options=('!strip')

package() {
    # Install the npm tarball into $pkgdir with an isolated cache to avoid
    # touching the build user's $HOME/.npm and to keep the build reproducible.
    npm install -g \
        --prefix "$pkgdir/usr" \
        --cache "$srcdir/npm-cache" \
        --no-audit --no-fund --loglevel=warn \
        "$srcdir/$_npmname-$pkgver.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "$pkgdir/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to the build user.
    # See https://bugs.archlinux.org/task/63396 for details.
    chown -R root:root "$pkgdir"

    # Remove stray /usr/etc that npm may have produced.
    rm -rf "$pkgdir/usr/etc"

    # Install dual licenses (MIT or Apache-2.0).
    install -Dm644 "$srcdir/LICENSE-APACHE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 "$srcdir/LICENSE-MIT-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
