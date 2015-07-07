# Maintainer: jtts
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgbasename=colord
pkgname=lib32-$_pkgbasename
pkgver=1.2.9
pkgrel=3
pkgdesc="System daemon for managing color devices (32-bit)"
arch=(x86_64)
url="http://www.freedesktop.org/software/colord"
license=(GPL2)
depends=("lib32-lcms2" "lib32-libgusb>=0.2.2" "lib32-polkit" "lib32-sqlite" "lib32-systemd>=221" "lib32-libgudev" "lib32-dconf" "lib32-dbus" "lib32-glib2" "$_pkgbasename>=1.2.9-3")
makedepends=(gcc-multilib intltool gobject-introspection vala argyllcms) # docbook2x sane bash-completion
#optdepends=('sane: scanner support'
#            'argyllcms: color profiling')
conflicts=('shared-color-profiles')
#install=colord.install
source=($url/releases/$_pkgbasename-$pkgver.tar.xz
        0001-Fix-session-helper-failing-to-find-argyll-tool.patch)
sha1sums=('1b6319812b12ab7f906983959bbaaf2e5b78bdb7'
          '6d92d75cda7736e734f7472bed52dbc90ca3ea93')
#validpgpkeys=('163EB50119225DB3DF8F49EA17ACBA8DFA970E17')

prepare() {
  cd $_pkgbasename-$pkgver
  patch -Np1 -i ../0001-Fix-session-helper-failing-to-find-argyll-tool.patch
}

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_pkgbasename-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib32/$_pkgbasename --libdir=/usr/lib32 --disable-static \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-vala --disable-volume-search \
    --disable-nls --disable-bash-completion \
    --with-daemon-user=colord
    #--enable-sane
  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install

  # the build system has no colord user, so the chown fails
  #chown -R 124:124 "$pkgdir/var/lib/colord"

  # Cleanup for lib32-build.
  rm -rf "${pkgdir}"/{etc,lib,var,usr/{bin,include,lib,share}}
}
