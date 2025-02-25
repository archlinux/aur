# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>
# Contributor: Douglas Creager <dcreager@dcreager.net>
# -*- sh -*-

pkgname='offpunk'
_pkgname='offpunk'
pkgver=2.6
pkgrel=1
pkgdesc='Fork of the command-line Gemini client AV-98 with added offline capabilities'
arch=('any')
url='https://git.sr.ht/~lioploum/offpunk'
license=('AGPL')
depends=(
  'python'
  'file'
  'less'
)
makedepends=(
  'coreutils'
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'chafa: chafa and ansiwrap are required to render images in terminal'
  'python-beautifulsoup4: conversion of HTML'
  'python-chardet: detect text encoding'
  'python-cryptography: better support of TOFU client certificates'
  'python-feedparser: required to parse RSS and Atom feeds'
  'python-lxml-html-clean: conversion of HTML'
  'python-readability-lxml: conversion of HTML'
  'python-requests: for HTTP support'
  'python-setproctitle: allows offpunk to change its process title'
  'timg: view images and videos in the terminal'
  'xdg-utils: xdg-open opens a URL in the preferred application'
  'xsel: copies text to and from the clipboard'
)
provides=('offpunk')
conflicts=(
  'offpunk'
  'av-98-offline'
)
source=("git+$url#tag=v$pkgver")
noextract=("$_pkgname")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "$_pkgname" || exit 1
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl

  test -f man/offpunk.1 && \
  install -Dm0644 man/offpunk.1 "$pkgdir/usr/share/man/man1/offpunk.1"
  install -Dm0644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 CHANGELOG     "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"
  install -Dm0644 CONTRIBUTORS  "$pkgdir/usr/share/doc/$pkgname/CONTRIBUTORS"
}

# eof
