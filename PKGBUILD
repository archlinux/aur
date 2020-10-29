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
pkgver=3.38.1
pkgrel=2
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
sha256sums=('d998d4824f38847fdd74bad6b5f09cc8e11b9de8e2a284a439af290714ddf3d1'
            '106d36537c621d1b0d4a9a541ee307ace593e005c322fd3622fc64c2f54f70ba'
            '9517a7be3c8debdd7c57390e3c62eb8395daf9b9949614023e385cc8cd91b1e4'
            'c48fe6060b852e136fee7b94b42fce5c8b9ac201720083d0b3edfc22cacdd285'
            'dc80adeee3d1106d6e814c2799a58e1bf4900c967aa7b3ca603f393b5abfcde7')

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
