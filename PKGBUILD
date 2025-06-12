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

source=("$_pkgbase::git+$url.git#commit=1e1ceec7353dc418578fe8ae56536bfee6adeca3")
sha256sums=('2d581105fccf9d5d139a5c1b284d4691499694a2e4ef2866024f86f5ea24d51b')

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
