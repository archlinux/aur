# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='python-dbzero-git'
_pkgname="${pkgname/-git/}"
_srcname="${_pkgname/python-/}"
_srcdir="${_srcname}"
pkgver=0.1.2.r2.gb28a84b5
pkgrel=1
epoch=1
pkgdesc='Durable, Infinite, Shared, Transactional, Isolated, Composable (DISTIC) memory system for Python (development/alpha version)'
arch=('aarch64' 'x86_64')
url='https://github.com/dbzero-software/dbzero'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
makedepends=(
  'git'
  'meson-python'
  'python-build'
  'python-installer'
  'python-wheel'
)
depends=(
  'gcc-libs'
  'glibc'
  'python>=3.9'
  'python-fasteners'  # mentioned in pyproject.toml, apparently unused
)
source=("git+$url.git")
provides=("$_pkgname")
conflicts=("${provides[@]}")
sha256sums=('SKIP')

pkgver() {
  cd "$_srcdir"

  git describe --long --tags \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_srcdir"

  # Regenerate meson files
  python scripts/generate_meson.py ./src/dbzero/ core
  python scripts/generate_meson_tests.py tests/
  python scripts/generate_meson_dbzero.py dbzero/

  local _pyver='<VOID>'
  _pyver=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
  export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/include/python$_pyver"

  _nproc=$(nproc 2>/dev/null || echo 1)
  case "$_nproc" in
    1|2) _jobs="$_nproc" ;;
      3) _jobs=2 ;;
      *) _jobs=$((_nproc - 2))
  esac
  export cores="$_jobs" # mentioned in scripts/build.sh, is it used at all?
  export MAKEFLAGS="-j$_jobs"  # meson doesn't seem to care…

  _meson_opts=(
    '-Denable_debug_exceptions=false'
    '-Denable_sanitizers=false'
    '-Dbuild_tests=false'
  )
  mkdir -p build
  meson setup --buildtype=release "${_meson_opts[@]}" build/release

  # ninja
  # meson install
  python -m build --wheel --no-isolation
}

package() {
  cd "$_srcdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md
  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    NOTICE THIRD_PARTY_LICENSES/*LICENSE*

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" || continue
    ln -vrsf "$pkgname" "$_pkgname"
  done

  local _site_packages='<VOID>'
  _site_packages=$(
    python -c 'import site; print(site.getsitepackages()[0])'
  )
  # Remove libs/libpyzero.a and licenses
  rm -vrf "$pkgdir/$_site_packages/$_srcname/libs/"
  rm -vf  "$pkgdir/$_site_packages/$_srcname/NOTICE"
  rm -vf  "$pkgdir/$_site_packages/$_srcname"/*LICENSE*
}

# eof
