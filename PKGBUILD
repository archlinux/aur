# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=e2b-dockerfile-utils
pkgname=python-$_name
pkgver=0.1.1
pkgrel=1
pkgdesc='E2B Dockerfile utils - Dockerfile parser, shell lexer and .dockerignore matcher ported from BuildKit and Moby.'
arch=('any')
_repo='https://github.com/e2b-dev/E2B'
url="$_repo/tree/main/packages/dockerfile-utils-python"
license=('Apache-2.0')
depends=('python')
makedepends=('python-uv-build'
             'python-build'
             'python-installer'
             'git')
checkdepends=('python-pytest')
source=("$_name::git+$_repo.git#tag=@e2b/dockerfile-utils@$pkgver")
sha256sums=('b6c9cf2da0ece5a905ea4062f4e82e607b9e74131417ea9d72441438060af963')

prepare() {
  cd "$srcdir"/$_name/packages/dockerfile-utils-python
  # Use the uv_build version shipped by Arch
  sed -i 's/uv_build>=0.10.0,<0.11.0/uv_build/' pyproject.toml
}

build() {
  cd "$srcdir"/$_name/packages/dockerfile-utils-python
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name/packages/dockerfile-utils-python
  python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name/packages/dockerfile-utils-python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
