# shellcheck shell=bash

# Maintainer: Brumaire <brumaire@entalpi.net>
# Contributor: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>
# Contributor: Douglas Creager <dcreager@dcreager.net>
# -*- sh -*-

pkgname='offpunk'
_pkgname='offpunk'
pkgdesc='Command-line and offline-centric browser for the web and various smolnet protocols'
pkgver=3.2
pkgrel=1
arch=('any')
url='https://git.sr.ht/~lioploum/offpunk'
install="$pkgname.install"
license=('AGPL-3.0-or-later')
depends=(
  'file'
  'less'
  'python'
)
makedepends=(
  'coreutils'
  'git'
  'python-build'
  'python-hatch-requirements-txt'
  'python-installer'
  'python-wheel'
)
optdepends=(
  # Highly recommended
  'xdg-utils: xdg-open opens a URL in the preferred application (Highly recommended)'
  'python-cryptography: better support of TOFU client certificates'
  'curl: for web browsing - HTTP(s) requests'
  
  #Web browsing 
  'python-feedparser: for web browsing - atom/RSS feeds'
  'python-beautifulsoup4: for web browsing - HTML parsing'
  'python-readability-lxml: for web browsing - HTML parsing'
  'chafa: chafa and ansiwrap are required to render images in terminal'
  
  # « Nice to have »
  'python-setproctitle: allows offpunk to change its process title'
  'xclip: copies text to/from the X11 clipboard'
  'xsel: copies text to/from the X11 clipboard (alternative)'
  'wl-clipboard: copies text to/from the Wayland clipboard'
  'python-charset-normalizer: detect text encoding in some cases'

  # Others (« Features »)
  'ftr-site-config: Full-Text-RSS site-specific text extraction rules'
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
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
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
  #cd "$pkgdir/usr/share/doc/"      && ln -srf "$pkgname" "$_pkgname" uneeded as pkgname = _pkgname
}

# eof
