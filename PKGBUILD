# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=linode-cli-git
pkgver=5.24.0.r6.9381b19
pkgrel=1
pkgdesc="The Linode Command Line Interface (development version)"
arch=('any')
url="https://github.com/linode/linode-cli"
license=('BSD')
depends=('python-terminaltables' 'python-requests' 'python-yaml' 'python-setuptools')
makedepends=('git')
optdepends=('python-boto: for obj plugin')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::'git+https://github.com/linode/linode-cli.git'
        ${pkgname%-git}-openapi.yaml::'https://www.linode.com/docs/api/openapi.yaml')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	python -m linodecli bake ../${pkgname%-git}-openapi.yaml --skip-config
	cp data-3 linodecli/
	python setup.py build
}

package() {
	cd "${pkgname%-git}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
	install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -vDm755 "${pkgdir}/etc/bash_completion.d/linode-cli.sh" "${pkgdir}/usr/share/bash-completion/completions/linode-cli"
	rm -rv "${pkgdir}/etc/"
}
