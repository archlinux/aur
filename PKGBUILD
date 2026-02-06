# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>

pkgname='offpunk-git'
_pkgname='offpunk'
pkgdesc='Command-line and offline-first smolnet browser/feed reader for Gemini, Gopher, Spartan and web (development version)'
pkgver=3.0.beta2.r1.g1f49b05
pkgrel=2
epoch=6
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
  'file'
  'ftr-site-config'
  'less'
  'python'
  'python-beautifulsoup4'
  'python-chardet'
  'python-cryptography'
  'python-feedparser'
  'python-readability-lxml'
  'python-requests'
  'python-setproctitle'
)
optdepends=(
  'chafa>=1.10: chafa and ansiwrap are required to render images in terminal'
  'timg>1.3.2: view images and videos in the terminal'
  'wl-clipboard: copies text to the Wayland clipboard'
  'xdg-utils: xdg-open opens a URL in the preferred application'
  'xclip: copies text to the X11 clipboard'
  'xsel: copies text to the X11 clipboard (alternative)'
)
provides=('offpunk')
conflicts=("${provides[@]}")
noextract=("$_pkgname")
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

  cd "$pkgdir/usr/bin/"            && ln -srf openk opnk
  cd "$pkgdir/usr/share/man/man1/" && ln -srf openk.1 opnk.1
  cd "$pkgdir/usr/share/doc/"      && ln -srf "$pkgname" "$_pkgname"
}

# eof
