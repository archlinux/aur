# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=distcc-git
_pkgname=distcc
pkgver=v3.2rc1.r225.g6fb446f
pkgrel=1
pkgdesc='Distributed C, C++ and Objective-C compiler, git version'
arch=('x86_64')
url='http://distcc.org'
license=('GPL')
depends=('avahi' 'popt')
makedepends=('git' 'gtk2' 'python' 'setconf')
optdepends=('gtk2: for distccmon-gnome' 'python')
conflicts=(distcc)
provides=(distcc)
backup=('etc/conf.d/distccd'
        'etc/distcc/hosts')
source=("git://github.com/distcc/distcc.git"
        'distccd.conf.d'
        'distccd.service')
sha256sums=('SKIP'
            '43e02b461841ca2976816c244a0eca8b24820ca143f73cc0924403d75a8c012f'
            '0f18ffb58647eeba643f28e9029a5d307100df3470eb228097f2b3f4196d8098')
pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  ./autogen.sh
  setconf gnome/distccmon-gnome.desktop Name 'DistCC Monitor'
  sed -i 's/ install-gnome-data//g' Makefile.in
}

build() {
  cd "$_pkgname"

  ./configure \
    --prefix=/usr \
    --enable-rfc2553 \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --with-gtk

  make WERROR_CFLAGS= INCLUDESERVER_PYTHON=/usr/bin/python
}

package() {
  make -C "$_pkgname" \
    DESTDIR="$pkgdir" \
    INCLUDESERVER_PYTHON=/usr/bin/python \
    install

  # Configuration
  install -Dm644 distccd.conf.d "$pkgdir/etc/conf.d/distccd"
  install -Dm644 distccd.service \
    "$pkgdir/usr/lib/systemd/system/distccd.service"

  # Desktop shortcut
  install -Dm644 "$_pkgname/gnome/distccmon-gnome-icon.png" \
    "$pkgdir/usr/share/pixmaps/distccmon-gnome-icon.png"
  install -Dm644 "$_pkgname/gnome/distccmon-gnome.desktop" \
    "$pkgdir/usr/share/applications/distccmon-gnome.desktop"

  # Symlinks
  install -d "$pkgdir/usr/lib/$_pkgname/bin"
  for bin in c++ cc cpp g++ gcc x86_64-pc-linux-gnu-g++ x86_64-pc-linux-gnu-gcc x86_64-pc-linux-gnu-gcc-9.1.0; do
    ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/bin/$bin"
    # Additional symlinks are needed, see FS#57978
    ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/lib/$_pkgname/$bin"
  done
}

# getver: distcc.org
# vim: ts=2 sw=2 et:
