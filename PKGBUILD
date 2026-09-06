# Maintainer: SCDevel <root@scevel.net>

pkgname=whatisit-git
pkgver=r180.gf9c3e79
pkgrel=1
pkgdesc="Local natural-language-to-shell command generator"
arch=('any')
url="https://github.com/ThorOdinson246/whatisit-nl2sh"
license=('Apache-2.0')

depends=(
    'python'
)

optdepends=(
    'llama-cpp: local LLM inference backend'
)

makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)

provides=('whatisit')
conflicts=('whatisit')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/whatisit-nl2sh"

    printf "r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/whatisit-nl2sh/whatisit_pkg"

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/whatisit-nl2sh/whatisit_pkg"

    python -m installer \
        --destdir="$pkgdir" \
        dist/*.whl

    install -Dm644 \
        "$srcdir/whatisit-nl2sh/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 \
        "$srcdir/whatisit-nl2sh/NOTICE" \
        "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
