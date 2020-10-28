# Maintainer: Nafis <mnabid.25@outlook.com>

pkgname=gnome-flashback-compiz
_pkgname=${pkgname%-compiz}
pkgver=3.38.0
pkgrel=1
pkgdesc="GNOME Flashback session (with compiz support)"
arch=('x86_64')
url="https://wiki.gnome.org/Projects/GnomeFlashback"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('gnome-bluetooth' 'gnome-panel' 'gnome-session' 'gnome-settings-daemon' 'gnome-themes-extra' 'libibus' 'metacity' 'compiz>=0.9')
makedepends=('autoconf-archive' 'git' 'intltool' 'python')
optdepends=('gnome-backgrounds: Default background'
            'gnome-control-center: System settings'
            'network-manager-applet: Network management')
_commit=9dd97c98166b65b6dcf67b40da303b3506bd38f7  # tags/3.38.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-flashback.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        gnome-flashback.pam)
sha256sums=('SKIP'
            'SKIP'
            '7148b3b1773fa312d6cd14798338cc70cffb6df7504ff1787687edd0363138d2')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url gvc/gvc "$srcdir/libgnome-volume-control"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$_pkgname \
              --with-compiz-session --disable-schemas-compile --enable-compile-warnings=minimum
  make
}

check() {
  cd $_pkgname
  make check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  # Install pam file for the screensaver
  install -Dm644 ../gnome-flashback.pam "$pkgdir/etc/pam.d/gnome-flashback"
}
