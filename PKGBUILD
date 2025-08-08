# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=bubblewrap-git
pkgname=('bubblewrap-git' 'bubblewrap-suid-git')
pkgver=0.11.0.r2.gd6180f2
pkgrel=1
pkgdesc="Low-level unprivileged sandboxing tool"
arch=('i686' 'x86_64')
url="https://github.com/containers/bubblewrap"
license=('LGPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libcap')
makedepends=('git' 'bash-completion' 'docbook-xsl' 'libxslt' 'meson')
provides=("bubblewrap=$pkgver")
conflicts=('bubblewrap')
options=('staticlibs')
source=("git+https://github.com/containers/bubblewrap.git")
sha256sums=('SKIP')


pkgver() {
  cd "bubblewrap"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "bubblewrap"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Ddefault_library="both" \
    -Dselinux="disabled" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "bubblewrap"

  #meson test -C "_build"
}

package_bubblewrap-git() {
  cd "bubblewrap"

  meson install -C "_build" --destdir "$pkgdir"
}

package_bubblewrap-suid-git() {
  pkgdesc+=" (setuid variant)"
  provides=("bubblewrap-suid=$pkgver")
  conflicts=('bubblewrap-suid')

  cd "bubblewrap"

  meson install -C "_build" --destdir "$pkgdir"
  chmod u+s "$pkgdir/usr/bin/bwrap"
}
