# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=linode-cli-git
pkgver=3.1.3.r4.d7bd3b4
pkgrel=2
pkgdesc="The Linode Command Line Interface"
arch=(any)
url="https://github.com/linode/linode-cli"
license=('BSD')
depends=('python-colorclass'
	 'python-terminaltables'
	 'python-requests'
	 'python-yaml')
optdepends=('python-boto: for obj plugin')
makedepends=('git' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::'git+https://github.com/linode/linode-cli.git'
	'linode-cli.patch')
md5sums=('SKIP'
	'c5e322d5f84f00e212f0b021c2b6dcf3')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
