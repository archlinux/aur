# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname=gpaste-git
pkgver=3.16.2.1+11+g7b41300
pkgrel=1
pkgdesc="Clipboard management system with a GNOME Shell extension"
url="https://github.com/Keruspe/GPaste"
arch=(i686 x86_64)
license=(GPL3)
depends=(gnome-shell)
makedepends=(git intltool vala appdata-tools)
install=gpaste-git.install
provides=("gpaste=$pkgver")

source=("git://github.com/Keruspe/GPaste.git#branch=gpaste-3.16")
md5sums=('SKIP')

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
  ./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc \
    --enable-gnome-shell-extension --enable-systemd
  make
}

check () {
  cd GPaste
  make -k check || :
}

package() {
  cd GPaste
  make DESTDIR="$pkgdir" install

  cd data/completions
  install -Dm644 gpaste "$pkgdir/usr/share/bash-completion/completions/gpaste"
  install -Dm644 _gpaste "$pkgdir/usr/share/zsh/site-functions/_gpaste"
}
