# Maintainer: Amber <amber@mail.cyborgtrees.com>
pkgname=pypy3-samson-crypto-git
pkgver=r259.fffbb7c
pkgrel=1
pkgdesc="a cryptanalysis and attack library"
arch=(any)
url="https://github.com/wildcardcorp/samson"
license=('custom')
#depends=('python' 'python-jedi' 'python-tqdm' 'python-dill' 'z3' 'ipython' 'python-pyasn1' 'python-pyasn1-modules' 'python-sortedcontainers' 'python-rich' 'python-mpmath' 'python-pytest-celery' 'python-celery' 'pypy3')
depends=('pypy3' )
makedepends=('python-sphinx' 'git' 'pypy3-setuptools')
optdepends=()
provides=('pypy3-samson-crypto')
replaces=('python-samson-crypto-git')
backup=()
options=()
install=
changelog=
source=("git+https://github.com/wildcardcorp/samson.git")
md5sums=('SKIP')


pkgver() {
  cd "samson"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	/usr/bin/pypy3 -m ensurepip
	export PATH="$PATH:$HOME/.local/bin"
	pypy3 -m pip install --user --upgrade pip
	pypy3 -m pip install --user pyasn1 pyasn1-modules jedi ipython tqdm z3-solver sortedcontainers rich dill mpmath pytest celery
}

build() {
	cd "$srcdir/samson"
	bash scripts/make_man.sh
#	python -m build --no-isolation --wheel
	pypy3 setup.py build
#	bash ./make_doc.sh #i'll probably make this into a seperate package
}

package() {
	cd "$srcdir/samson"
	#TODO: licence
	pypy3 setup.py install --root="$pkgdir" --optimize=1
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/pypy3/bin/samson "$pkgdir/usr/bin/samson"
	ln -s /opt/pypy3/bin/samson-py "$pkgdir/usr/bin/samson-py"
}
