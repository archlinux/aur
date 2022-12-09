# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: trakt-scrobbler


pkgname=trakt-scrobbler
pkgver=1.6.0
pkgrel=9
pkgdesc="Automatically scrobble TV show episodes and movies you are watching to Trakt.tv! It keeps a history of everything you've watched!"

arch=(any)
url=https://github.com/iamkroot/trakt-scrobbler
license=(GPL2)
depends=(
	"systemd"
	'python-requests<3.0.0' #auto-deps
	'python-requests>=2.25.1' #auto-deps
	'python-urllib3<2.0.0' #auto-deps
	'python-urllib3>=1.26.0' #auto-deps
	'python-guessit<4.0.0' #auto-deps
	'python-guessit>=3.3.1' #auto-deps
	'python-appdirs<2.0.0' #auto-deps
	'python-appdirs>=1.4.4' #auto-deps
	'python-cleo-v0<0.9.0' #auto-deps
	'python-cleo-v0>=0.8.1' #auto-deps
	'python-confuse<3.0' #auto-deps
	'python-confuse>=2.0' #auto-deps
	'python-urlmatch<2.0.0' #auto-deps
	'python-urlmatch>=1.0.1' #auto-deps
	'python-pydantic<2.0.0' #auto-deps
	'python-pydantic>=1.10.2' #auto-deps
	'python-toml<0.11.0' #auto-deps
	'python-toml>=0.10.2' #auto-deps
	'python-desktop-notifier<4.0.0' #auto-deps
	'python-desktop-notifier>=3.4.0' #auto-deps
)

_overrides=(
	'append:cleo:-v0'
	'replace:desktop-notifier:/(3\.4)\..+/\1.0/'
)

makedepends=(
    git
    python-poetry-core
    python-build
    python-installer
    python-wheel
)
source=("$pkgname::git+https://github.com/iamkroot/trakt-scrobbler.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"

	sed -i 's/cleo\s/cleo_v0 /' \
		trakt_scrobbler/console.py \
		trakt_scrobbler/commands/command.py
}

build() {
    python -m build --no-isolation --wheel "$srcdir/$pkgname"
}

package()
{
    _py=$(python --version)
    _py=${_py%%.*}

    python -m installer --destdir="$pkgdir" \
        "$srcdir/$pkgname/dist/${pkgname//-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"
    install -Dm755 "$srcdir/$pkgname/completions/trakts.zsh" "$pkgdir/usr/share/zsh/site-functions/_trakts"
}
