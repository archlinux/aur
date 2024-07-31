# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.5.3'
pkgrel='1'
pkgdesc='Video download tool that automatically downloads newly posted videos from channels on supported websites'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('python>=3.8.0' 'python-argcomplete' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('bash-completion: Tab completion support for bash')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1bb29ae35e76e26758263009e3fe171f24c3f287bf50c8b23222864f2e57df6551c1dcabc38852f259842b0d7804caca1e5a242cf4c5d135722e823e3bf90199')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	_checkoutput="$(python "$srcdir/$_sourcedirectory/cli.py" --version)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q "^$pkgver$"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/bash-completion/completions/"
	echo 'eval "$(register-python-argcomplete --shell bash kahlo)"' > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d/"
	echo 'eval "$(register-python-argcomplete --shell fish kahlo)"' > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
