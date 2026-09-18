pkgname=python-ezdxf
_commit=dd7f6cc34983fdbf0b2b910f2497e0720d06dd16
pkgver=1.4.4
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
b2sums=('7af09d972dda0b06b658ea81059f957973cf7db837a16f1ca208c5e821b062e21a79a85763022fa54524030f5f4056d6fb636a63204b421fcb42b40e4e0b92ed')

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
