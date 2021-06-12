# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=linode-cli-git
pkgver=5.4.2.r0.b212eef
pkgrel=1
pkgdesc="The Linode Command Line Interface (development version)"
arch=(any)
url="https://github.com/linode/linode-cli"
license=('BSD')
depends=('python-colorclass' 'python-terminaltables' 'python-requests' 'python-yaml')
optdepends=('python-boto: for obj plugin')
makedepends=('git' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::'git+https://github.com/linode/linode-cli.git'
	'linode-cli.patch')
md5sums=('SKIP'
         '0e3a7ea0d402c1a6e59f93fe3de6933a')

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
	install -dm755 "${pkgdir}/usr/share/bash-completion/completions/"
	mv -v "${pkgdir}/etc/bash_completion.d/linode-cli.sh" "${pkgdir}/usr/share/bash-completion/completions/linode-cli"
}
