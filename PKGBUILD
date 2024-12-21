# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Hao Long <aur@esd.cc>

pkgname=archivebox
_pkgname=ArchiveBox
pkgver=0.7.3
pkgrel=1
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
  python-pdm-backend
  python-setuptools
  python-wheel
)
checkdepends=(
  python-bottle
  python-pytest
)
_django_version=3.1.14
_django_extensions_version=3.1.5
source=(
  "git+$url.git#tag=v$pkgver"
  "git+https://github.com/jbittel/base32-crockford.git"
  "git+https://github.com/jazzband/django-taggit.git"
  "git+https://github.com/tapanpandita/pocket.git"
  "git+https://github.com/untitaker/python-atomicwrites.git"
  "django-$_django_version::https://github.com/django/django/archive/$_django_version.tar.gz"
  "django-extensions-$_django_extensions_version::https://github.com/django-extensions/django-extensions/archive/$_django_extensions_version.tar.gz"
)
sha256sums=(
  '5a530b3e86332db33b24b675e98d9b8b3d0bd9148095aa3025495952c1d16834'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'fe5a93c64d37f4dec49b7535ae405c0b87c1eb3d40979a33955a3631b5a6a00a'
  'a29b022fb6728678ec5f769d78eff4d8b0c0f4beb15f9b8392726d4f0bda9031'
)

prepare() {
  cd "$_pkgname"
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

  rm -vrf venv
  python -m venv --system-site-packages --without-pip venv
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation ../django-$_django_version
  ./venv/bin/python -m installer ../django-$_django_version/dist/*.whl

  python -m build --wheel --no-isolation ../django-extensions-$_django_extensions_version
  ./venv/bin/python -m installer ../django-extensions-$_django_extensions_version/dist/*.whl

  python -m build --wheel --no-isolation
  ./venv/bin/python -m installer dist/*.whl
}

check() {
  cd "$_pkgname"
  rm -vrf venv-test
  cp -va venv venv-test
  sed -i "s|#!/bin/python|#!$PWD/venv-test/bin/python|" venv-test/bin/archivebox
  PATH="$PWD/venv-test/bin:$PATH" ./venv-test/bin/python -m pytest tests
}

package() {
  cd "$_pkgname"
  install -vdm755 "$pkgdir/opt/archivebox"
  cp -va -t "$pkgdir/opt/archivebox" venv/*
  sed -i 's|#!/usr/bin/python|#!/opt/archivebox/bin/python|' "$pkgdir/opt/archivebox/bin/archivebox"

  install -vdm755 "$pkgdir/usr/bin"
  ln -vs /opt/archivebox/bin/archivebox "$pkgdir/usr/bin/archivebox"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Silence namcap warning
  rm -vr "$pkgdir/opt/archivebox/include"
}
