# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: dobedobedo <dobe0331 at gmail dot com>
_pkgname='kealib'
pkgname=("python-$_pkgname")
_kea=1.5.3
pkgver=0.1_"$_kea"
pkgrel=1
pkgdesc="Python library to access parts of kealib not exposed by GDAL"
arch=('x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('cmake' 'python-setuptools')
depends=("kealib=$_kea" 'pybind11' 'python-numpy' 'python-awkward<2')
options=(!emptydirs)
_awkward_ver=1.10.2  # Headers are the same in 1.10.3
_awkward_raw=https://raw.githubusercontent.com/scikit-hep/awkward
_awkward_path=src/awkward/_v2/cpp-headers/awkward/
_github=https://github.com/ubarsc/kealib
source=(
  "$_github/releases/download/$_pkgname-$_kea/$_pkgname-$_kea.tar.gz"
  "$_awkward_raw/v$_awkward_ver/$_awkward_path/LayoutBuilder.h"
  "$_awkward_raw/v$_awkward_ver/$_awkward_path/BuilderOptions.h"
  "$_awkward_raw/v$_awkward_ver/$_awkward_path/GrowableBuffer.h"
  "$_awkward_raw/v$_awkward_ver/$_awkward_path/utils.h"
  "setup.py"
)
sha256sums=(
  '32b2e3c90553a03cf1e8d03781c3710500ca919bca674bc370e86f15338ee93e'
  '945b19124fadc60c99c60fb263d75ef31e9c4dda6980a5fe96353c3f20d9b330'
  'a78fc19e9cc9d4096b377e1e99f33fd908b25c3f2cf57dd889893f8042ddb883'
  '8112164e16f7de7d8f6da3335f2f62c0f629d606ebb7326b2a499b576f85d579'
  'eb5957ca6d56eeab8601940b92d018fce3906c50958a85622faad66e0d17a4b6'
  'SKIP'
)

prepare() {
  cd "$srcdir/$_pkgname-$_kea"

  # Patch kealib.extrat to work with awkward < 2
  sed -i \
    -e '55i\using namespace pybind11::literals;' \
    -e 's/= to_buffers([^)]*/&, "key_format"_a="{form_key}-{attribute}"/' \
    -e 's/from_buffers(.*c[^)]*/&, "key_format"_a="{form_key}-{attribute}"/' \
    -e '/to_dict/i\pybind11::str form_json = form.attr("tojson")();' \
    -e '/to_dict/i\auto json = pybind11::module_::import("json");' \
    -e '/to_dict/i\auto json_loads = json.attr("loads");' \
    -e '/to_dict/i\pybind11::dict formDict = json_loads(form_json);' \
    -e '/to_dict/d' \
    -e 's/\(classType\) != \("ListOffsetArray"\)/\1.rfind(\2, 0) != 0/' \
    python/extrat.cpp

  # Patch kealib.testpython to work with awkward < 2
  sed -i \
    -e '/def check/{N;N;N;' \
    -e 'a\    awkward.CharBehavior.register(str)' \
    -e '}' \
    python/testpython.py

  # Let testpython assume fakegdal is a module of the package
  # and that a compiled "testseg" is in the package directory
  sed -i \
    -e 's/import fakegdal/from kealib &/' \
    -e "s-'./testseg'-__file__.rsplit('/', 1)[0] + '/testseg'-" \
    python/testpython.py

  # Fix a test bug, addBoolField no longer exists (it's addField now)
  sed -ri 's/addBool(Field.*)(False)/add\1extrat.KEAFieldDataType.Bool, \2/' \
    python/run_test.py

  # Add the setuptools alternative to the CMake config of this package
  ln -fs "$srcdir/setup.py" .

  # Create the "awkward" include directory, its license is BSD 3-clause
  # (Check first line of these header files for more information)
  # These files are not installed, and this assumes awkward < 2
  mkdir -p python/include/awkward
  ln -fs "$srcdir/LayoutBuilder.h" python/include/awkward/
  ln -fs "$srcdir/BuilderOptions.h" python/include/awkward/
  ln -fs "$srcdir/GrowableBuffer.h" python/include/awkward/
  ln -fs "$srcdir/utils.h" python/include/awkward/
}

build() {
  cd "$srcdir/$_pkgname-$_kea"
  python setup.py build

  py3_suffix=$(python -V | sed -r 's/.*3\.([0-9]+)\..*/3\1/')
  g++ -O3 -lkea python/testseg.cpp \
    -o "build/lib.linux-$arch-cpython-$py3_suffix/kealib/testseg"
}

check() {
  py3_suffix=$(python -V | sed -r 's/.*3\.([0-9]+)\..*/3\1/')
  cd "$srcdir/$_pkgname-$_kea/build/lib.linux-$arch-cpython-$py3_suffix"
  echo Testing with run_test.py
  python -m kealib.run_test
  echo Finished run_test.py tests
  echo Testing with testpython.py
  KEALIB_LIBGDAL="kealib/fakegdal.cpython-$py3_suffix-$arch-linux-gnu.so" \
    python -m kealib.testpython
  echo Finished testpython.py tests
  rm *.kea
}

package() {
  cd "$srcdir/$_pkgname-$_kea"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
