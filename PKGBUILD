# Maintainer: Ta180m <ta180m@gmail.com>

_pkgbase=zenmonitor
pkgname=zenmonitor3-git
pkgver=77.f8e029c
pkgrel=2
pkgdesc="Zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Zen 3 support! "
arch=('x86_64' 'i686')
url="https://github.com/Ta180m/zenmonitor3"
license=('GPL')
depends=('zenpower3' 'gtk3')
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
