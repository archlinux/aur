# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=linode-cli-git
pkgver=5.5.0.r0.b212eef
pkgrel=1
pkgdesc="The Linode Command Line Interface (development version)"
arch=(any)
url="https://github.com/linode/linode-cli"
license=('BSD')
depends=('python-colorclass' 'python-terminaltables' 'python-requests' 'python-yaml')
optdepends=('python-boto: for obj plugin')
makedepends=('git' 'python-pip' 'python-wheel')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::'git+https://github.com/linode/linode-cli.git'
	'linode-cli.patch')
sha256sums=('SKIP'
            'dfa08b4bd58203ba34ce7a65139a16ffcb1b1730300a114cecf22c8c191aed04')

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
	rm -rv "${pkgdir}/etc/"
}
