# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor:  Νικόλαος Κυριάκος Φυτίλης <n-fit@live.com>

pkgname=banshee-lite-git
pkgver=2.9.1.r355.g10da4d618
pkgrel=2
pkgdesc="Music management and playback for GNOME (fork by arfbtwn)"
arch=(i686 x86_64)
url="https://github.com/arfbtwn/banshee"
license=(MIT)
depends=(gconf-sharp dbus-sharp-glib gtk-sharp-3-mono-git taglib-sharp-git mono-addins gvfs
         gst-plugins-base gst-plugins-good media-player-info libxxf86vm)
makedepends=(intltool gnome-doc-utils gnome-common git)
optdepends=('gst-plugins-bad: Extra media codecs'
            'gst-plugins-ugly: Extra media codecs'
            'gst-libav: Extra media codecs'
            'brasero: CD burning')
provides=(banshee)
conflicts=(banshee)
source=("git+https://github.com/arfbtwn/banshee.git"
        "Hyena::git+https://github.com/arfbtwn/hyena"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/banshee-Update-.gitmodules.patch"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/banshee-autogen.sh-remove-git-submodules-update.patch")
md5sums=('SKIP'
         'SKIP'
         'fafd310ab3ee7d94a4de9fce33bd0f66'
         'd2af5bfbe6ed19896d7e1b9bb1461498')

pkgver() {
  cd "$srcdir/${pkgname/-lite-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname/-lite-git/}"

  patch -p1 -i ../banshee-autogen.sh-remove-git-submodules-update.patch
  patch -p1 -i ../banshee-Update-.gitmodules.patch

  git submodule init
  git config 'submodule.src/Hyena.url' "${srcdir}/Hyena"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/${pkgname/-lite-git/}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-docs \
    --enable-gst-native \
    --enable-user-help \
    --disable-gst_sharp \
    --disable-static \
    --disable-scrollkeeper \
    --disable-schemas-install \
    --disable-youtube \
    --disable-gio-hardware \
    --disable-upnp \
    --disable-clutter \
    --disable-daap \
    --disable-appledevice \
    --disable-mtp \
    --disable-gio \
    --disable-torrent \
    --disable-remote-audio \
    --disable-ubuntuone \
    --with-vendor-build-id=ArchLinux
  make
}

package() {
  cd "$srcdir/${pkgname/-lite-git/}"

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/banshee/COPYING"
}
