# Maintainer: Derek J. Clark <derekjohn.clark@gmail.com>
pkgname=handygccs-git
_gitdir=HandyGCCS
pkgver=23.08.r166.f9979f2
pkgrel=1
pkgdesc="Handheld Game Console Controller Support."
arch=('any')
url="https://github.com/ShadowBlip/HandyGCCS"
license=('GPL')
groups=()
depends=('python' 'python-evdev')
optdepends=()
makedepends=('git' 'python' 'python-evdev' 'python-installer' 'python-build' 'python-wheel')
_tag=f9979f2b47ac5d217b789583bae4c3b9bb4070e9
source=("${_gitdir}::git+https://github.com/ShadowBlip/${_gitdir}.git#tag=${_tag}")
sha256sums=('SKIP')
pkgver() {
	cd "$srcdir/${_gitdir}"
	printf "%s.r%s.%s" $(date '+%y.%m') "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_gitdir}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_gitdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	mkdir -p ${pkgdir}/usr/lib/systemd/system
	install -m644 usr/lib/systemd/system/handycon.service ${pkgdir}/usr/lib/systemd/system

	mkdir -p ${pkgdir}/usr/lib/udev/hwdb.d
	install -m644 usr/lib/udev/hwdb.d/59-handygccs-ayaneo.hwdb ${pkgdir}/usr/lib/udev/hwdb.d

	mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	install -m644 usr/lib/udev/rules.d/60-handycon.rules ${pkgdir}/usr/lib/udev/rules.d
	}
