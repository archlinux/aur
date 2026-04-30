# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtk2-ng-git
pkgver=r22052.e96b0f5e2
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (community-maintained fork)"
url="https://www.gtk.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  atk
  cairo
  desktop-file-utils
  fontconfig
  gdk-pixbuf2
  glib2
  glibc
  gtk-update-icon-cache
  libcups
  librsvg
  libx11
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxrandr
  libxrender
  pango
  shared-mime-info
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
)
source=(
  "git+https://git.devuan.org/Daemonratte/gtk2-ng"
  gtk-query-immodules-2.0.hook
  0001-Lower-severity-of-XID-collision-warnings.patch
)
b2sums=('SKIP'
        '9c531f9f605e1739e13c39c1cac22daddd9574f3082f18bcf0b9dfaa4c41f2485d55be03a9ed12fb4504d509f0d5ac63980a9d9349e3f80a06595c6430c78096'
        '45ecc976d9eb9d990fc204230aa052a6d1b2bdfdc94788be37d576ab262a1da49855eb46ecd4bfce4efde6e2f817a1660c6d1fa756be3b372f7f8d13b0ef0fd0')
provides=('gtk2' 'gtk2=2.24.33')
conflicts=('gtk2')
replaces=('gtk2')

pkgver() {
  cd gtk2-ng
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd gtk2-ng
  git apply -3 ../0001-Lower-severity-of-XID-collision-warnings.patch

  sed -i '/AM_INIT_AUTOMAKE/s/]/ foreign]/' configure.ac
  autoreconf -fvi
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-xinput=yes
    --disable-gtk-doc
  )

  CFLAGS+=" -Wno-error=implicit-int -Wno-error=incompatible-pointer-types"

  cd gtk2-ng
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  optdepends=(
    'adwaita-fonts: Default font'
    'adwaita-icon-theme: Default icon theme'
    'gnome-themes-extra-gtk2: Default widget theme'
    'python: gtk-builder-convert'
  )
  provides=(
    libgailutil.so
    libgdk-x11-2.0.so
    libgtk-x11-2.0.so
  )
  install=gtk2.install

  make -C gtk2-ng DESTDIR="$pkgdir" install

  install -Dm644 /dev/stdin "$pkgdir/usr/share/gtk-2.0/gtkrc" <<END
gtk-icon-theme-name = "Adwaita"
gtk-theme-name = "Adwaita"
gtk-font-name = "Adwaita Sans 11"
END

  install -Dm644 gtk-query-immodules-2.0.hook -t "$pkgdir/usr/share/libalpm/hooks"

  # Built by GTK 4, shared with GTK 2/3
  rm "$pkgdir/usr/bin/gtk-update-icon-cache"
}

# vim:set sw=2 sts=-1 et:
