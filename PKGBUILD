# Maintainer:
# Contributor: Sumner Evans <sumner.evans98 at gmail dot com>

_pkgname="sublime-music"
pkgname="$_pkgname"
pkgver='0.12.0'
pkgrel=3
pkgdesc='A Subsonic/Airsonic/*sonic client'
url="https://github.com/sublime-music/sublime-music"
license=('GPL-3.0-or-later')
arch=('any')

depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-flit'
  'python-installer'
  'python-wheel'
  'python-sphinx'
)
optdepends=(
  'libnotify: for system song notification support'
  'python-keyring: support for storing passwords in the system keyring'
)

_pkgsrc="${_pkgname//-/_}-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/$_pkgsrc.$_pkgext"
)
sha256sums=(
  '458bacab6be5c926852d4a43ce675b5e767210287844c6fce921832e263db3c0'
)

build() {
  cd "$_pkgsrc"
  python -m build --no-isolation --wheel --skip-dependency-check

  cd "docs"
  make man
}

package() {
  depends+=(
    'glib2'
    'hicolor-icon-theme'
    'python-bleach'
    'python-bottle'
    'python-dateutil'
    'python-deepdiff'
    'python-mpv'
    'python-peewee'
    'python-requests'
    'python-semver'

    ## AUR
    'python-dataclasses-json'
    'python-pychromecast'
    'python-thefuzz'
  )

  python -m installer --destdir="$pkgdir" "$_pkgsrc"/dist/*.whl

  install -Dm644 "$_pkgsrc"/sublime-music.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$_pkgsrc"/sublime-music.metainfo.xml -t "$pkgdir"/usr/share/metainfo/

  install -Dm644 "$_pkgsrc"/docs/_build/man/sublime-music.1 -t "$pkgdir"/usr/share/man/man1/

  for sz in 16 22 24 32 36 48 64 72 96 128 192 512 1024; do
    install -Dm644 "$_pkgsrc"/logo/rendered/$sz.png "$pkgdir"/usr/share/icons/hicolor/${sz}x${sz}/apps/sublime-music.png
  done
}
