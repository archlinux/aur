# Maintainer: Damien Nguyen <damien1@huawei.com>

_name=openfermionprojectq
pkgbase=python-${_name}
pkgname=(${pkgbase} python-${_name}-hiq)

pkgver=0.2
pkgrel=1
pkgdesc="A plugin allowing OpenFermion to interaface with ProjectQ."
arch=('any')
url="https://github.com/quantumlib/OpenFermion-ProjectQ/"
license=('Apache')
makedepends=('python-pip'
	     'python-setuptools')
checkdepends=(# AUR dependencies
              'python-openfermion'
	      'python-h5py'
	      'jupyter-nbformat'
	      'python-projectq')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"fix-failing-test.patch"
	"openfermion-0.11.0.patch")
sha256sums=('bbaf9d2906a2f5893fa4ea49ce16a3dad640063ec365b21c8970bc88216820fd'
            '56753a2b5237e7e6194bb964dba6a17350828b6321078cc3a217a2bac59d06ef'
            'b20875b96e7eaed9db2871986043677fa8243c3dad6e10fb4302a03c22dace38')
groups=(python-hiq)

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -p1 -i "$srcdir/fix-failing-test.patch"
  patch -p1 -i "$srcdir/openfermion-0.11.0.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python -m pytest --color=yes -x
}

package_python-openfermionprojectq() {
  conflicts=(python-openfermionprojectq-hiq)
  depends+=('python-openfermion'
	    'python-projectq')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python-openfermionprojectq-hiq() {
  pkgdesc="A plugin allowing OpenFermion to interaface with HiQ-ProjectQ."
  conflicts=(python-openfermionprojectq)
  depends+=('python-openfermion'
	    'python-hiq-projectq')
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
