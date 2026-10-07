# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-deploydiff-git
_pkgname=deploydiff
pkgver=r134.acb3fc1
pkgrel=1
pkgdesc="Preview infrastructure changes (Terraform, CloudFormation, Pulumi) with cost impact"
arch=('any')
url="https://github.com/Coding-Dev-Tools/deploydiff"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-yaml' 'python-jinja' 'python-tomli')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
checkdepends=('python-pytest')
provides=("python-deploydiff")
conflicts=("python-deploydiff")
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	PYTHONPATH="$PWD/src" python -m pytest tests -v
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
