# Maintainer: Luis Miguel García-Cuevas González <luismiguelgcg at gmail dot com>

pkgname='python-coolprop-git'
_pkgname='python-coolprop'
pkgver=r5799.d5eecbb4
pkgrel=1
arch=('any')
pkgdesc='Python wrapper over CoolProp, the open-source thermodynamic and transport properties database'
url='https://github.com/CoolProp/CoolProp'
license=('MIT')
source=("$_pkgname::git+https://github.com/CoolProp/CoolProp"
)
depends=('python' 'python-numpy')
makedepends=('git'
             'cython'
             'python-scikit-build-core')
b2sums=('SKIP')

pkgver() {

  cd "$srcdir/$_pkgname/" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {

  cd "$srcdir/$_pkgname/" || exit
  python -m build --wheel --no-isolation

}

package() {

  cd "$srcdir/$_pkgname/" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

prepare() {

  cd "$srcdir/$_pkgname/" || exit
  git submodule update --init --recursive

  python dev/generate_headers.py

  local ABSOLUTE_Z_FILE="${srcdir}/${_pkgname}/dev/all_fluids.json.z"

  if [ ! -f "$ABSOLUTE_Z_FILE" ]; then
    echo "Critical file not found: $ABSOLUTE_Z_FILE"
    return 1
  fi

  find src/ -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) \
    -exec sed -i "s|all_fluids.json.z|${ABSOLUTE_Z_FILE}|g" {} +

}
