pkgname=flatpak-git
_pkgname=flatpak
pkgver=1.9.2+1+ge08e8344
pkgrel=1
pkgdesc="Linux application sandboxing and distribution framework (formerly xdg-app)"
url="https://flatpak.org"
arch=(x86_64)
license=(LGPL2.1)
depends=('dbus' 'glib2' 'libsoup' 'polkit' 'libxau' 'ostree' 'json-glib' 'libseccomp' 'libarchive'
         'python' 'bubblewrap' 'appstream-glib' 'xdg-dbus-proxy')
makedepends=('intltool' 'systemd' 'gobject-introspection' 'gtk-doc' 'git' 'docbook-xsl' 'xmlto')
checkdepends=('valgrind' 'socat')
provides=('flatpak')
conflicts=('flatpak')
source=("git+https://github.com/flatpak/flatpak"
        "git+https://gitlab.gnome.org/GNOME/libglnx.git"
        "git+https://github.com/projectatomic/bubblewrap"
        "git+https://github.com/flatpak/xdg-dbus-proxy"
        https://dl.flathub.org/repo/flathub.flatpakrepo
        flatpak-bindir.sh)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '752cdb2f0f4774ac6966033edc989456764cf8fe9a2a97918c75ecfd47b2dacb567e98ede00168f780a8fc97ae6e413bb550ebd2323cb4aefb578469d9338a4d'
            'aaff4de2496e7102826eacd3b7d1246f147c4524cae87bdd2ca8ff2ee80b2563157662708025393ea449203ee44826b5c5cfa7fe6bbd2223d4e890a4fce1c35a')

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.bubblewrap.url "$srcdir/bubblewrap"
  git config --local submodule.libglnx.url "$srcdir/libglnx"
  git config --local submodule.dbus-proxy.url "$srcdir/xdg-dbus-proxy"
  git submodule update

  # https://github.com/flatpak/flatpak/issues/267
  sed -i '/locale\/C\./d' tests/make-test-runtime.sh

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_pkgname

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-static \
    --enable-gtk-doc \
    --with-system-bubblewrap \
    --with-system-dbus-proxy \
    --with-dbus-config-dir=/usr/share/dbus-1/system.d

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_pkgname
  make -k check || :
}

package() {
  depends+=(xdg-desktop-portal)

  cd $_pkgname
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/selinux"

  install -Dm644 "$srcdir/flatpak-bindir.sh" "$pkgdir/etc/profile.d/flatpak-bindir.sh"
  install -Dm644 "$srcdir/flathub.flatpakrepo" "$pkgdir/etc/flatpak/remotes.d/flathub.flatpakrepo"

  # Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
