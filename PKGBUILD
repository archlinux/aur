pkgname=python-ezdxf
_commit=df5ef277fcc674d77580143212ec63dd981cc2b3
pkgver=1.4.3
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('x86_64')
url=https://github.com/mozman/ezdxf
license=('MIT')
depends=(
python-typing_extensions
python-pyparsing
python-numpy
python-fonttools
python-matplotlib
python-black
python-pillow
pyside6
python-pymupdf
python-pyqt5
)
makedepends=(
python-setuptools
python-build
python-installer
python-wheel
cython
git
)
checkdepends=(
python-pytest
)
source=("git+https://github.com/mozman/ezdxf.git#commit=${_commit}")
sha256sums=('eae2bc3ebd6ec3a168ec84032705831cc20d76db9fa660aaea5bec486cafaa78')

pkgver() {
  cd ezdxf
  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ezdxf
}

build() {
  cd ezdxf
  python -m build --wheel --no-isolation
}

check() {
  cd ezdxf
  cd src
  python -m pytest ../tests ../integration_tests -k 'not test_version and not test_audit_existing_file and not test_audit_file_not_found'
}

package() {
  cd ezdxf
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # install examples
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a examples "${pkgdir}/usr/share/${pkgname}"
  cp -a examples_dxf "${pkgdir}/usr/share/${pkgname}"

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
