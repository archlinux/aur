# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=sqlite-vec
pkgname=python-$_name
pkgver=0.1.9
pkgrel=1
pkgdesc='A vector search SQLite extension.'
arch=('x86_64' 'aarch64')
url='https://github.com/asg017/sqlite-vec'
license=('MIT OR Apache-2.0')
depends=('python' 'python-numpy' 'glibc' 'sqlite')
makedepends=('python-installer' 'gcc' 'sqlite-dist' 'git')
checkdepends=('python-pytest' 'python-syrupy')
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('d15838d73835fd0410ed60f8dec3aaa1129ec33342c42a5ba260dc92eca604e2')

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
  sqlite-dist sqlite-dist.toml --input dist/ --output distx/ --version $pkgver
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
