# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>

pkgname='offpunk-git'
_pkgname='offpunk'
pkgdesc='Command-line and offline-first smolnet browser/feed reader for Gemini, Gopher, Spartan and web (development version)'
pkgver=3.1.r23.ga61f6f7
pkgrel=1
epoch=7
url='https://git.sr.ht/~lioploum/offpunk'
install="$pkgname.install"
arch=('any')
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
makedepends=(
  'coreutils'
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
depends=(
  'curl'
  'file'
  'less'
  'python'
  'python-beautifulsoup4'
  'python-charset-normalizer'
  'python-cryptography'
  'python-feedparser'
  'python-readability-lxml'
  'python-setproctitle'
)
optdepends=(
  'chafa: render images in terminal'
  'ftr-site-config: Full-Text-RSS site-specific text extraction rules'
  'wl-clipboard: copies text to the Wayland clipboard'
  'xclip: copies text to the X11 clipboard'
  'xdg-utils: xdg-open opens a URL in the preferred application'
  'xsel: copies text to the X11 clipboard (alternative)'
)
provides=(
  'ansicat'
  'netcache'
  'offpunk'
  'openk'
  'unmerdify'
  'xkcdpunk'
)
conflicts=("${provides[@]}")
noextract=("$_pkgname")
options=('!strip')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long --tags --abbrev=7 \
  | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG CONTRIBUTORS README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/tutorial" \
    tutorial/*.{gmi,html,py}
  install -Dm0644 -t "$pkgdir/usr/share/man/man1" \
    man/*.1

  cd "$pkgdir/usr/bin/"            && ln -srf openk   opnk
  cd "$pkgdir/usr/share/man/man1/" && ln -srf openk.1 opnk.1
  cd "$pkgdir/usr/share/doc/"      && ln -srf "$pkgname" "$_pkgname"
}

# eof
