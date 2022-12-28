# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Lieven Moors <lievenmoors@protonmail.com>
# Contributor: Leonard de Ruijter <dev@systeemdenker.nl>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgbase=mididings
pkgname=('mididings' 'mididings-docs')
pkgver=20221228.r730.g6079f9f
pkgrel=2
pkgdesc='A MIDI router & processor, supporting ALSA & JACK'
arch=('x86_64')
url='https://github.com/mididings/mididings'
license=('GPL2')
makedepends=(
  'git'
  'boost'
  'boost-libs'
  'alsa-lib'
  'jack'
  'python'
  'python-decorator'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
checkdepends=('python-pytest')
_commit='6079f9f2c1774f06fa6cf2432f5276ab040f6f01'
source=("$pkgbase::git+https://github.com/mididings/mididings#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgbase"

  local commit_date="$(git show --no-patch --format=%cd --date=format:%Y%m%d)"
  local commit_count="$(git rev-list --count HEAD)"
  local commit_hash="$(git rev-parse --short HEAD)"

  printf '%s.r%s.g%s' "$commit_date" "$commit_count" "$commit_hash"
}

build() {
  cd "$pkgbase"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgbase"

  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')

  PYTHONPATH="build/lib.linux-$CARCH-cpython-$python_version:$PYTHONPATH" pytest -v
}

package_mididings() {
  depends=(
    'boost-libs'
    'jack'
    'alsa-lib'
    'python'
    'python-decorator'
  )
  optdepends=(
    'python-dbus: send DBUS messages'
    'python-pyinotify: automatically restart when a script changes'
    'python-pyliblo: send/recieve OSC messages'
    'python-pysmf: read/write standard MIDI files using the process_file() function'
    'python-pyxdg: so mididings knows where to look for config files'
    'tk: for livedings GUI'
    'mididings-docs: documentation'
  )

  cd "$pkgbase"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_mididings-docs() {
  pkgdesc+=' (documentation)'

  cd "$pkgbase"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgbase" README
  cp -vr doc/examples "$pkgdir/usr/share/doc/$pkgbase"
  cp -vr doc-html "$pkgdir/usr/share/doc/$pkgbase/html"
}
