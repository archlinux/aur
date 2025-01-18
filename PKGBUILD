# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=cppyy-cling
pkgname=python-$_name
pkgver=6.32.8
pkgrel=1
# ROOT version always has zero-padded two-digit patch version (e.g. 6.32.8 -> 6.32.08)
# check https://github.com/wlav/cppyy-backend/blob/master/cling/create_src_directory.py#L42
_root_version=$(printf "%s.%02d" ${pkgver%.*} ${pkgver##*.})
pkgdesc="Cling backend for cppyy"
arch=(x86_64)
url="https://github.com/wlav/cppyy-backend"
license=(
  BSD-3-Clause-LBNL   # cppyy-cling
  LGPL-2.1-or-later   # ROOT
  NCSA                # LLVM, Cling
)
depends=(
  clang
  gcc-libs
  glibc
  python
  zstd
)
makedepends=(
  cmake
  python-build
  python-installer
  python-setuptools
  python-wheel
)
# cppyy-cling and ROOT have a weird relationship: Cling is developed as part of ROOT without
# separate releases, so it is basically forked and patched in the cppyy-backend project.
# It also builds and installs some binaries provided by ROOT (rootcling, genreflex).
# On the other hand, ROOT has PyROOT which uses cppyy, so it forks it back to build it
# against the ROOT-provided Cling. There are also some licensing reasons...
# See details: https://github.com/wlav/cppyy-backend/issues/33#issuecomment-2598877502
conflicts=(root)
provides=($_name)
replaces=($_name)
source=(
  $url/archive/refs/tags/$_name-$pkgver.tar.gz
  https://root.cern.ch/download/root_v$_root_version.source.tar.gz
)
b2sums=('ce9b62bca2e31ba13bda8fde3f792b7926ea812380af38ef488c8b68dca1634d4c5d050f38ae0cd7be5d7d69219791294216f84ebd89bcdf1cb81ad56edd7aca'
        '8810322ea518607a81cddeec41645ced272ca0ddbb2bc36a7710d49b6d52a4d897fd369d4f201653a6c7a6ef278121a529b69e62e99c49f13dc0a9ca224ef07d')

# LTO breaks LLVM
options=(!lto)

prepare() {
  cd cppyy-backend-$_name-$pkgver/cling

  # patch out cmake dependency from pyproject.toml
  sed -i 's|requires = \["cmake", |requires = [|' pyproject.toml

  # copy the "interpreter" directory from ROOT, same as downloaded by the create_src_directory.py script
  cp -ar -t src "$srcdir"/root-$_root_version/interpreter

  # apply all patches same as the create_src_directory.py script
  # check https://github.com/wlav/cppyy-backend/blob/master/cling/create_src_directory.py#L116-L121
  local patch_files=('typedef_of_private' 'optlevel2_forced' 'explicit_template'
                     'alias_template' 'incomplete_types' 'clang_printing'
                     'improv_load' 'pch' 'win64rtti' 'win64s2' 'locales' 'build'
                     'system_dirs')
  local fdiff
  for fdiff in "${patch_files[@]}"; do
    patch -p1 -i "patches/$fdiff.diff"
  done
}

build() {
  cd cppyy-backend-$_name-$pkgver/cling
  python -m build --wheel --no-isolation
}

package() {
  cd cppyy-backend-$_name-$pkgver/cling
  python -m installer --destdir="$pkgdir" dist/*.whl

  # install licenses
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm 644 src/LGPL2_1.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -vDm 644 src/interpreter/cling/LICENSE.TXT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE_cling.txt
}
