# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.5.3'
pkgrel='4'
pkgdesc='Video download tool that automatically downloads newly posted videos from channels on supported websites'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-or-later')
depends=('python>=3.8.0' 'python-argcomplete' 'yt-dlp' 'yt-dlp-ejs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('43d0d4eb38a6ed81af838f4e3a27d6063baae7f6169be2ffc451d6f8bbbd97743dea16db8a825a21736974331e88ba9adc70fc784d13e16a436305efe26701a8')

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
