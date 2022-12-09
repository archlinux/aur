# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: git
# deps: pyproject

pkgname=trakt-scrobbler-git
pkgver=1.6.1b1.r0.g8cd46d9
pkgrel=6
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
    "systemd"
	'python-appdirs<2.0.0' #auto-deps
	'python-appdirs>=1.4.4' #auto-deps
	'python-cleo-v0<1.0.0' #auto-deps
	'python-cleo-v0>=0.8.1' #auto-deps
	'python-confuse<3.0.0' #auto-deps
	'python-confuse>=2.0.0' #auto-deps
	'python-desktop-notifier<4.0.0' #auto-deps
	'python-desktop-notifier>=3.4.0' #auto-deps
	'python-guessit<4.0.0' #auto-deps
	'python-guessit>=3.3.1' #auto-deps
	'python-pydantic<2.0.0' #auto-deps
	'python-pydantic>=1.10.2' #auto-deps
	'python-pysocks<2.0.0' #auto-deps
	'python-pysocks>=1.7.1' #auto-deps
	'python-requests<3.0.0' #auto-deps
	'python-requests>=2.25.1' #auto-deps
	'python-setuptools<1:66.0.0' #auto-deps
	'python-setuptools>=1:65.5.1' #auto-deps
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
)

_overrides=(
    'append:cleo:-v0'
    'replace:desktop-notifier:/(3\.4)\..+/\1.0/'
    'epoch:setuptools:1'
)

provides=("${pkgname%*-git}")
conflicts=("${pkgname%*-git}")

source=(
    "${pkgname%*-git}::git+https://github.com/iamkroot/trakt-scrobbler.git"
)
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname%*-git}
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;s/.beta/b/' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/${pkgname%*-git}"

	sed -i 's/cleo\s/cleo_v0 /' \
		trakt_scrobbler/console.py \
		trakt_scrobbler/commands/command.py
}
build() {
    python -m build --no-isolation --wheel "$srcdir/${pkgname%*-git}"
}

package()
{
    _pkgname=${pkgname%*-git}
    _py=$(python --version)
    _py=${_py%%.*}

    python -m installer --destdir="$pkgdir" \
        "$srcdir/${pkgname%*-git}/dist/${_pkgname//-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"
    install -Dm755 "$srcdir/${pkgname%*-git}/completions/trakts.zsh" "$pkgdir/usr/share/zsh/site-functions/_trakts"
}
