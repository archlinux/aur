# Maintainer: Gabriel Chamon <gchamon@tuta.io>
pkgname=archie-cli
pkgver=0.2.4
pkgrel=1
_commit=448a20d82445219d0dd1541f4bfe591ef824541b
pkgdesc="Archlinux system operation and maintenance CLI/applet"
arch=(any)
url="https://gitlab.com/gabriel.chamon/archie"
license=(MIT)
depends=("python>=3.14" sqlite)
makedepends=(python-installer uv)
provides=(archie)
conflicts=(archie archie-cli-nightly)
source=("archie::git+https://gitlab.com/gabriel.chamon/archie.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/archie"
    sed -i "s/^version = \"[^\"]*\"/version = \"$pkgver\"/" pyproject.toml
    uv build --wheel --out-dir "$srcdir/dist"
}

package() {
    cd "$srcdir/archie"
    python -m installer --destdir="$pkgdir" "$srcdir"/dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 docs/user/KEYBOARD_SHORTCUTS.md "$pkgdir/usr/share/doc/$pkgname/KEYBOARD_SHORTCUTS.md"
    install -Dm644 deployment-packages/local/lib/zsh/README.md "$pkgdir/usr/share/doc/$pkgname/ZSH_COMMANDS.md"
    install -Dm644 packaging/archie-cli/_archie "$pkgdir/usr/share/zsh/site-functions/_archie"
    install -Dm644 packaging/archie-cli/archie.sysusers "$pkgdir/usr/lib/sysusers.d/archie.conf"
    install -Dm644 packaging/archie-cli/archie.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/archie.conf"
}
