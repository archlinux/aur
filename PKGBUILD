# Maintainer: Cyril Levis <pkgbuilds AT levis DOT name>

pkgname=exegol-git
pkgver=r873.1246458
pkgrel=1
pkgdesc="Fully featured and community-driven hacking environment."
arch=('any')
url="https://github.com/ShutdownRepo/Exegol"
license=('Apache License, Version 2.0')
groups=()
depends=('python' 'docker' 'git')
makedepends=('python-setuptools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
	"${pkgname%-git}::git+https://github.com/ShutdownRepo/Exegol.git#branch=dev"
	"git+https://github.com/ShutdownRepo/Exegol-images.git"
	"git+https://github.com/ShutdownRepo/Exegol-resources"
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	# Git, no tags available
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.sources.url "$srcdir/Exegol-images"
	git config submodule.exegol-resources.url "$srcdir/Exegol-resources"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root "${pkgdir}/"
	rm -rf "${pkgdir}/usr/exegol-docker-build"
}
