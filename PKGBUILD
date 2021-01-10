# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.38.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.62.1' gsettings-desktop-schemas)
makedepends=(itstool docbook-xsl libnautilus-extension appstream-glib
             gnome-shell vala yelp-tools)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch
        0001-screen-Manually-handle-env-inheritance.patch
        0002-screen-Move-env-sanitization-from-client.patch
        0003-screen-Ignore-some-more-environment-variables.patch)
sha256sums=('27bddc9d0ba614c86e5ecb4f54c75ebc3415e2887acd91442057548fd3206618'
            '106d36537c621d1b0d4a9a541ee307ace593e005c322fd3622fc64c2f54f70ba'
            'c350db9831c3bbe5c28ab5f959076cbeacc1b2bac12ca37623db2bf7d9461ecf'
            '4dc0260da875d22830440c3295aef2c73a1625eeeadf94747ac22920d0ddcdca'
            'abc5e7b30979a12dc6790d17efc47ec4a112fa6e3e3555ff16c0769b0178c599')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
  # https://bugs.archlinux.org/task/68318
  # https://gitlab.gnome.org/GNOME/gnome-terminal/-/issues/303
  patch -Np1 -i ../0001-screen-Manually-handle-env-inheritance.patch
  patch -Np1 -i ../0002-screen-Move-env-sanitization-from-client.patch
  patch -Np1 -i ../0003-screen-Ignore-some-more-environment-variables.patch
  # autogen.sh not in tarball
  autoreconf -fiv
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --disable-static --with-nautilus-extension
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
