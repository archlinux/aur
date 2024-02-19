# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Hao Long <aur@esd.cc>

pkgname=archivebox
_pkgname=ArchiveBox
pkgver=0.7.2
pkgrel=3
pkgdesc="Open source self-hosted web archiving"
arch=(any)
url="https://github.com/ArchiveBox/ArchiveBox"
license=(MIT)
depends=(
  chromium
  curl
  git
  nodejs
  postlight-parser
  python
  python-asgiref
  python-chardet
  python-dateparser
  python-mypy_extensions
  python-python-crontab
  python-pytz
  python-requests
  python-sqlparse
  python-urllib3
  python-w3lib
  readability-extractor
  ripgrep
  single-file
  wget
  yt-dlp
)
makedepends=(
  python-build
  python-installer
  python-pdm
  python-setuptools
  python-wheel
)
checkdepends=(
  python-bottle
  python-pytest
)
_commit=315c9f3844d63f897e1c73c3bbbab7bf9f3e0c11
_django_version=3.1.14
_django_extensions_version=3.1.5
source=(
  "git+$url.git#commit=$_commit"
  "git+https://github.com/jbittel/base32-crockford.git"
  "git+https://github.com/jazzband/django-taggit.git"
  "git+https://github.com/tapanpandita/pocket.git"
  "git+https://github.com/untitaker/python-atomicwrites.git"
  "django-$_django_version::https://github.com/django/django/archive/refs/tags/$_django_version.tar.gz"
  "django-extensions-$_django_extensions_version::https://github.com/django-extensions/django-extensions/archive/refs/tags/$_django_extensions_version.tar.gz"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'fe5a93c64d37f4dec49b7535ae405c0b87c1eb3d40979a33955a3631b5a6a00a'
  'a29b022fb6728678ec5f769d78eff4d8b0c0f4beb15f9b8392726d4f0bda9031'
)

_archive="$_pkgname"

prepare() {
  cd "$_archive"

  git submodule init
  git config --remove-section submodule.docs
  git config --remove-section submodule.deb_dist
  git config --remove-section submodule.brew_dist
  git config --remove-section submodule.pip_dist
  git config --remove-section submodule.docker
  git config submodule.archivebox/vendor/base32-crockford.url "$srcdir/base32-crockford"
  git config submodule.archivebox/vendor/pocket.url "$srcdir/pocket"
  git config submodule.archivebox/vendor/django-taggit.url "$srcdir/django-taggit"
  git config submodule.archivebox/vendor/python-atomicwrites.url "$srcdir/python-atomicwrites"
  git -c protocol.file.allow=always submodule update -- \
    archivebox/vendor/base32-crockford \
    archivebox/vendor/pocket \
    archivebox/vendor/django-taggit \
    archivebox/vendor/python-atomicwrites

  {
    echo '[tool.pdm.build]'
    echo 'excludes = ['
    echo '  "archivebox/vendor/base32-crockford",'
    echo '  "archivebox/vendor/django-taggit",'
    echo '  "archivebox/vendor/pocket",'
    echo '  "archivebox/vendor/python-atomicwrites",'
    echo ']'
  } >> pyproject.toml

  rm -rf venv
  python -m venv --system-site-packages --without-pip venv
}

build() {
  cd "$srcdir/django-$_django_version"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$srcdir/$_archive/venv" --prefix=/ dist/*.whl

  cd "$srcdir/django-extensions-$_django_extensions_version"
  python -m build --wheel --no-isolation
  python -m installer --destdir="$srcdir/$_archive/venv" --prefix=/ dist/*.whl

  cd "$srcdir/$_archive"
  python -m build --wheel --no-isolation
  python -m installer --destdir=venv --prefix=/ dist/*.whl
}

check() {
  cd "$_archive"

  rm -rf test_venv
  cp --archive --no-preserve=ownership venv test_venv
  sed -i "s|#!/bin/python|#!$PWD/test_venv/bin/python|" test_venv/bin/archivebox
  export PATH="$PWD/test_venv/bin:$PATH"
  export PYTHONPATH="$PWD/test_venv/lib/python3.11/site-packages:$PYTHONPATH"

  pytest tests
}

package() {
  cd "$_archive"

  install -dm755 "$pkgdir/opt/archivebox"
  cp --archive --no-preserve=ownership venv/* "$pkgdir/opt/archivebox"
  sed -i 's|#!/bin/python|#!/opt/archivebox/bin/python|' "$pkgdir/opt/archivebox/bin/archivebox"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/archivebox/bin/archivebox "$pkgdir/usr/bin/archivebox"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Silence namcap warning
  rm -r "$pkgdir/opt/archivebox/include"
}
