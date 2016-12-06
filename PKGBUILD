# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname=gpaste-git
pkgver=3.22.1+23+g0923e96
pkgrel=1
pkgdesc="Clipboard management system"
url="http://www.imagination-land.org/tags/GPaste.html"
license=(GPL3)
arch=(i686 x86_64)
depends=(gtk3)
makedepends=(intltool vala appstream-glib gobject-introspection gnome-shell gnome-control-center git)
optdepends=("wgetpaste: Upload clipboard contents")
provides=("gpaste=$pkgver")
conflicts=(gpaste)
options=(!emptydirs)
source=("$pkgname::git+https://github.com/keruspe/gpaste.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc \
    --enable-vala --enable-applet
  make
}

check () {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  install -Dm644 data/completions/gpaste-client \
    "$pkgdir/usr/share/bash-completion/completions/gpaste-client"
  install -Dm644 data/completions/_gpaste-client \
    "$pkgdir/usr/share/zsh/site-functions/_gpaste-client"

  # Don't autostart the applet, ever
  rm "$pkgdir/etc/xdg/autostart/org.gnome.GPaste.Applet.desktop"
}
