# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname=gpaste-git
pkgver=3.20+3+g3503fca
pkgrel=1
pkgdesc="Clipboard management system"
url="http://www.imagination-land.org/tags/GPaste.html"
license=(GPL3)
arch=(i686 x86_64)
depends=(gtk3)
makedepends=(git intltool vala appstream-glib gobject-introspection gnome-shell gnome-control-center)
optdepends=("wgetpaste: Upload clipboard contents")
provides=("gpaste=$pkgver")
conflicts=(gpaste)
options=('!emptydirs')
install=gpaste.install
source=("git+https://github.com/Keruspe/GPaste#branch=gpaste-3.20")
sha256sums=('SKIP')

pkgver() {
  cd GPaste
  git describe --long | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd GPaste
  ./autogen.sh
}

build() {
  cd GPaste
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --sysconfdir=/etc \
    --enable-vala
  make
}

check () {
  cd GPaste
  make -k check || :
}

package() {
  cd GPaste
  make DESTDIR="$pkgdir" install

  install -Dm644 data/completions/gpaste-client \
    "$pkgdir/usr/share/bash-completion/completions/gpaste-client"
  install -Dm644 data/completions/_gpaste-client \
    "$pkgdir/usr/share/zsh/site-functions/_gpaste-client"
}
