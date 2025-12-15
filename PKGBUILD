# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seistrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>

pkgname='offpunk-git'
_pkgname='offpunk'
epoch=6
pkgver=2.8.r21.g64bcb8b
pkgrel=2
pkgdesc='Fork of the command-line Gemini client AV-98 with added offline capabilities (latest commit)'
arch=('any')
url='https://git.sr.ht/~lioploum/offpunk'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
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
makedepends=(
  'coreutils'
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
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
conflicts=('offpunk')
source=("git+$url")
noextract=("$_pkgname")
sha256sums=('SKIP')
install="$pkgname.install"

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

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG CONTRIBUTORS README.md
  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/tutorial" \
    tutorial/*.{gmi,html,py}
  install -vDm0644 -t "$pkgdir/usr/share/man/man1" \
    man/*.1
}

# eof
