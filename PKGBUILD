# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nathaniel Chin <thegamingorangutans+aur at gmail.com>
# Original: bitwave > https://aur.archlinux.org/packages/python-scenedetect/

pkgname=python-scenedetect-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=0.6.1.release.r0.gcd1d1b6
pkgrel=1
pkgdesc="Cross-platform, OpenCV-based video scene detection program and Python library."
license=('BSD')
arch=('any')
url="https://github.com/Breakthrough/PySceneDetect"
depends=('python-appdirs' 'python-click' 'python-opencv' 'python-numpy' 'python-tqdm')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=("python-pytest")
optdepends=('mkvtoolnix-cli: Splitting in copy mode.'
            'ffmpeg: Splitting in precise mode.'
            'python-av')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-${pkgver/.r*/}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
