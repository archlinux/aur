# Maintainer: Groctel <aur@taxorubio.com>
pkgname=manimce
pkgver=0.1.0
pkgrel=1
pkgdesc="Animation engine for explanatory math videos (community edition)."
arch=('any')
url="https://github.com/ManimCommunity/manim/"
license=('MIT' 'custom')
depends=(
	'cairo'
	'ffmpeg'
	'python'
	'python-cairocffi'
	'python-colour'
	'python-numpy'
	'python-pillow'
	# 'python-progressbar' Doesn't work, must be installed with pip
	'python-pygments'
	'python-rich'
	'python-scipy'
	'python-tqdm'
	'python-watchdog'

	# AUR package
	'python-pydub'
)
makedepends=(
	'python-pip'
	'python-wheel'
)
optdepends=(
	'texlive-most: latex support'
)
provides=()
conflicts=('python-manimlib')
source=("https://files.pythonhosted.org/packages/f9/17/5b538d8350983c9a3baaaaa0345a0def774be463c909f61d56798a275089/manimce-0.1.0.tar.gz")
sha256sums=('402c0c91efe29375ba2a6306d48147b827922f34a3f5e3bef792829751dce550')

prepare() {
	pip install pip --upgrade
	# This line may seem redundant but pangocairocffi refuses to install if
	# pangocffi isn't already installed (and then must be installed again because
	# the upgrading strategies always upgrade pangocffi). I'm keeping and eye on
	# this step to make it more polite or replace it with actual arch packages
	pip install --no-cache --force --use-feature=2020-resolver pangocffi==0.6.0
	pip install --no-cache --force --use-feature=2020-resolver \
		grpcio \
		grpcio-tools \
		pangocffi==0.6.0 \
		pangocairocffi \
		progressbar
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 LICENSE.community "$pkgdir/usr/share/licenses/$pkgname/LICENSE.community"
}
