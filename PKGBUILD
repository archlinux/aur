# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Anthony Wang <a at exozy dot me>

_pkgbase=zenmonitor
pkgname=zenmonitor3
pkgver=2.0.0
pkgrel=1
pkgdesc="Zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Zen 3 support! "
arch=('x86_64' 'i686')
url="https://github.com/detiam/zenmonitor3"
license=('GPL')
depends=('zenpower3' 'gtk3')
optdepends=('polkit: support application shortcut to launch Zen monitor as root')
makedepends=('git')
provides=('zenmonitor')

source=("$_pkgbase::git+$url.git#commit=07572e66d432877955139d1e9e81fd9e9abc5d0f")
sha256sums=('521cee8c3d4163d1e6ec365b76a4095015d1b1cdcbacdb44a915fc8366ce8d6a')

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
  make DESTDIR="${pkgdir}" PREFIX="/usr" all
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  make DESTDIR="${pkgdir}" PREFIX="/usr" install-cli
  mkdir -p "${pkgdir}/usr/share/polkit-1/actions"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install-polkit
}
