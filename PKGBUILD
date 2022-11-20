# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=graphviz
pkgname=python38-graphviz
pkgver=0.20.1
pkgrel=2
pkgdesc='Simple Python interface for Graphviz'
arch=(any)
url="https://github.com/xflr6/$_pkgname"
license=(MIT)
depends=(graphviz
         python38)
makedepends=(python38-{build,installer,wheel}
             python38-setuptools)
checkdepends=(python38-pytest
              python38-pytest-mock)
#source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip")
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('815346b8c2fcd8ccede29623a67bfc30abdbb75749e96128b9d414573d6d8f04')
b2sums=('65d0b993e01492894b6d245c0869412b4956e5d55f9d8d490505c8f3477dc5ab98739cf0bf1aa1a15c4bacb2db4c2807659ce410ca65503c5876ffdc278e959f')

prepare() {
	cd "$_archive"
	# do not run python38-coverage in unittests :/
	sed -i 's/--cov --cov-report=term --cov-report=html//' setup.cfg
	# don't add pointless dependency on python38-mock needed on python 3.5
	sed -i '/mock_use_standalone_module/d' setup.cfg
}

build(){
	cd "$_archive"
	python3.8 -m build -wn
}

check() {
	cd "$_archive/tests"
	python3.8 -m pytest
}

package() {
	cd "$_archive"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
