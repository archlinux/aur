pkgname=python-ezdxf
_commit=8240df5793daf2fd7db95d118a78e17ec92043ec
pkgver=1.4.2
pkgrel=1
pkgdesc="Python interface to DXF"
arch=('x86_64')
url=https://ezdxf.mozman.at/
license=('MIT')
depends=(
python-typing_extensions
python-pyparsing
python-numpy
python-fonttools
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
python-pillow
)
source=("git+https://github.com/mozman/ezdxf.git#commit=${_commit}")
sha256sums=('0c13114b34418fc5b50a182d9b8ec7cc1c7249c62e6e119989bb9a9077d77a55')

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
}

# vim:ts=2:sw=2:et:
