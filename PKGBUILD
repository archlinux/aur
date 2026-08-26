# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=sqlite-vec
pkgname=python-$_name
pkgver=0.1.9
pkgrel=2
pkgdesc='A vector search SQLite extension.'
arch=('x86_64' 'aarch64')
url='https://github.com/asg017/sqlite-vec'
license=('MIT OR Apache-2.0')
depends=('python' 'python-numpy' 'glibc' 'sqlite')
makedepends=('python-installer' 'gcc' 'git')
checkdepends=('python-pytest' 'python-syrupy')
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('d15838d73835fd0410ed60f8dec3aaa1129ec33342c42a5ba260dc92eca604e2')

build_wheel() {
  local outdir=distx/pip extra=bindings/python/extra_init.py stem=vec0
  local tag staging distinfo f

  case "$CARCH" in
    x86_64)  tag='manylinux_2_17_x86_64.manylinux2014_x86_64.manylinux1_x86_64' ;;
    aarch64) tag='manylinux_2_17_aarch64.manylinux2014_aarch64' ;;
  esac

  staging=$(mktemp -d)
  distinfo=${_name//-/_}-$pkgver.dist-info
  mkdir -p $staging/${_name//-/_} $staging/$distinfo

  printf '%s' "
from os import path
import sqlite3

__version__ = \"$pkgver\"
__version_info__ = tuple(__version__.split(\".\"))

def loadable_path():
  \"\"\" Returns the full path to the $_name loadable SQLite extension bundled with this package \"\"\"

  loadable_path = path.join(path.dirname(__file__), \"$stem\")
  return path.normpath(loadable_path)

def load(conn: sqlite3.Connection)  -> None:
  \"\"\" Load the $_name SQLite extension into the given database connection. \"\"\"

  conn.load_extension(loadable_path())

" > $staging/${_name//-/_}/__init__.py
  cat $extra >> $staging/${_name//-/_}/__init__.py

  install -m644 dist/linux-$CARCH/$stem.so $staging/${_name//-/_}/$stem.so

  { printf '%s' "Metadata-Version: 2.1
Name: $_name
Version: $pkgver
Home-page: https://alexgarcia.xyz/sqlite-vec
Author: Alex Garcia
License: MIT License, Apache License, Version 2.0
Description-Content-Type: text/markdown

"
    cat README.md
  } > $staging/$distinfo/METADATA

  printf '%s' "Wheel-Version: 1.0
Generator: sqlite-dist 0.0.1-alpha.22
Root-Is-Purelib: false
Tag: py3-none-$tag" > $staging/$distinfo/WHEEL

  printf '%s\n' "${_name//-/_}" > $staging/$distinfo/top_level.txt

  local -a members=(
    ${_name//-/_}/__init__.py
    ${_name//-/_}/$stem.so
    $distinfo/METADATA
    $distinfo/WHEEL
    $distinfo/top_level.txt
  )

  : > $staging/$distinfo/RECORD
  for f in "${members[@]}"; do
    printf '%s,sha256=%s,%s\n' $f $(sha256sum $staging/$f | cut -d' ' -f1 | tr 'a-f' 'A-F' | basenc --base16 -d | basenc --base64url -w0 | tr -d '=') $(stat -c%s $staging/$f) >> $staging/$distinfo/RECORD
  done
  printf '%s,,\n' $distinfo/RECORD >> $staging/$distinfo/RECORD
  members+=($distinfo/RECORD)

  mkdir -p $outdir
  outdir=$(realpath $outdir)
  cd $staging
  bsdtar -cf $outdir/${_name//-/_}-$pkgver-py3-none-$tag.whl --format zip --options zip:compression=store "${members[@]}"

  rm -rf "$staging"
}

prepare() {
  cd "$srcdir"/$_name
  DATE=$(date -r VERSION +'%FT%TZ%z') \
  SOURCE=$(git log -n 1 --pretty=format:%H -- VERSION)
  VERSION_MAJOR=$(echo $pkgver | cut -d. -f1)
  VERSION_MINOR=$(echo $pkgver | cut -d. -f2)
  VERSION_PATCH=$(echo $pkgver | cut -d. -f3)
  mv sqlite-vec.h.tmpl sqlite-vec.h
  sed -i "s/\${VERSION}/$pkgver/g" sqlite-vec.h
  sed -i "s/\${DATE}/$DATE/g" sqlite-vec.h
  sed -i "s/\${SOURCE}/$SOURCE/g" sqlite-vec.h
  sed -i "s/\${VERSION_MAJOR}/$VERSION_MAJOR/g" sqlite-vec.h
  sed -i "s/\${VERSION_MINOR}/$VERSION_MINOR/g" sqlite-vec.h
  sed -i "s/\${VERSION_PATCH}/$VERSION_PATCH/g" sqlite-vec.h
  grep -rl "dist/vec0" tests/ | xargs sed -i "s|dist/vec0|dist/linux-$CARCH/vec0|g"
}

build(){
  cd "$srcdir"/$_name
  mkdir -p dist/linux-$CARCH
  gcc -fPIC -shared -Wall -Wextra -O3 -lm sqlite-vec.c -o dist/linux-$CARCH/vec0.so
  build_wheel
}

check(){
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer distx/pip/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests/test-*.py
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" distx/pip/*.whl
}
