# shellcheck disable=SC2034,SC2148,SC2154,SC2164

# Maintainer: Alessandro Cerruti
# Contributor: Alessandro Cerruti

_pkgbase=i3bard
pkgname=i3bard-git
pkgver=r54.a7109db
pkgrel=1
pkgdesc='async i3bar status_command generator that can synchronize multiple instances'
arch=('any')
url='https://gitlab.com/chrooti/i3bard'
license=('MIT')
depends=(python)
makedepends=(
	git
	python-build
	python-installer
	python-setuptools
	python-wheel
)
source=('i3bard::git+https://gitlab.com/chrooti/i3bard.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgbase}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgbase}"

	python -m installer --destdir="$pkgdir" dist/*.whl

	find cmdlets \
		-type f \
		-name '*.py' \
		-exec install -D --mode=644 {} "${pkgdir}"/usr/lib/i3bard/{} \;

	install -D -m 644 i3bard.service "$pkgdir"/usr/lib/systemd/user/i3bard.service
	install -D -m 644 i3bard.socket "$pkgdir"/usr/lib/systemd/user/i3bard.socket
}
