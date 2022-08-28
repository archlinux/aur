# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: git
# deps: pyproject

pkgname=trakt-scrobbler-git
pkgver=1.5.0.r1.gb2b4d44
pkgrel=2
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
    "systemd"
	'python-appdirs<2.0.0' #auto-deps
	'python-appdirs>=1.4.4' #auto-deps
	'python-cleo<1.0.0' #auto-deps
	'python-cleo>=0.8.1' #auto-deps
	'python-confuse<3.0.0' #auto-deps
	'python-confuse>=2.0.0' #auto-deps
	'python-guessit<4.0.0' #auto-deps
	'python-guessit>=3.3.1' #auto-deps
	'python-jeepney<1.0.0' #auto-deps
	'python-jeepney>=0.8.0' #auto-deps
	'python-pysocks<2.0.0' #auto-deps
	'python-pysocks>=1.7.1' #auto-deps
	'python-requests<3.0.0' #auto-deps
	'python-requests>=2.25.1' #auto-deps
	'python-urllib3<2.0.0' #auto-deps
	'python-urllib3>=1.26.0' #auto-deps
	'python-urlmatch<2.0.0' #auto-deps
	'python-urlmatch>=1.0.1' #auto-deps
)
makedepends=(
    git
    python-poetry-core
    python-build
    python-installer
    python-wheel
    go-md2man
    gzip
)

provides=("${pkgname%*-git}")
conflicts=("${pkgname%*-git}")

source=(
    "${pkgname%*-git}::git+https://github.com/iamkroot/trakt-scrobbler.git"
    "trakts-man.md"
)
sha256sums=('SKIP'
            '81c3fb93bf01c0e6c0bbc9b2ef853da3f691bc3c50b4a87a68072b11ba72691c')

pkgver() {
    cd ${pkgname%*-git}
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/${pkgname%*-git}"
    python -m build --no-isolation --wheel
    go-md2man -in "$srcdir/trakts-man.md" 2>/dev/null|gzip -n > trakts.1.gz
}

package()
{
    _pkgname=${pkgname%*-git}
    _py=$(python --version)
    _py=${_py%%.*}

    cd "$srcdir/${pkgname%*-git}"
    python -m installer --destdir="$pkgdir" \
        "dist/${_pkgname//-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"

	# Completions
    install -Dm755 "$srcdir/${pkgname%*-git}/completions/trakts.zsh" "$pkgdir/usr/share/zsh/site-functions/_trakts"

    install -Dm644 "trakts.1.gz" "$pkgdir/usr/share/man/man1/trakts.1.gz"
}
