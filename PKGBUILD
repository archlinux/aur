# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>
# Author: Ondrej Čerman

_pkgbase=zenmonitor
pkgname=zenmonitor-git
pkgver=52.d9f5914
pkgrel=1
pkgdesc="Zen monitor is monitoring software for AMD Zen-based CPUs"
arch=('x86_64' 'i686')
url="https://github.com/ocerman/zenmonitor"
license=('GPL')
depends=('zenpower' 'gtk3')
optdepends=('polkit: support application shortcut to launch Zen monitor as root')
makedepends=('git')
provides=('zenmonitor')

source=("$_pkgbase::git+$url.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  # Fix pkgdir references in desktop files
  sed -i 's/@APP_EXEC@|${DESTDIR}/@APP_EXEC@|/g' makefile
}

build() {
  cd "$srcdir/$_pkgbase"
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  mkdir -p "${pkgdir}/usr/share/polkit-1/actions"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install-polkit
}
