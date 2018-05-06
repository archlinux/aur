# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>
# Arch Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=flatpak-builder-git
_gitname=flatpak-builder
pkgver=0.10.10+3+g4b81e2d7
pkgrel=1
pkgdesc="Tool to build flatpaks from source"
url="http://flatpak.org"
arch=(x86_64)
license=(LGPL2.1)
depends=(flatpak binutils elfutils unzip tar git bzr patch rpmextract cpio appstream-glib)
makedepends=(intltool gobject-introspection git docbook-xsl xmlto libdwarf)
checkdepends=(python2 valgrind)
replaces=('flatpak<0.9.10')
provides=('flatpak-builder')
conflicts=('flatpak-builder')
source=("flatpak-builder::git+https://github.com/flatpak/flatpak-builder"
        "git+https://git.gnome.org/browse/libglnx")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd $_gitname

  git submodule init
  git config --local submodule.libglnx.url "$srcdir/libglnx"
  git submodule update

  # https://github.com/flatpak/flatpak/issues/267
  sed -i '/locale\/C\./d' tests/make-test-runtime.sh

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd $_gitname
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd $_gitname

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --disable-static \
    --with-dwarf-header=/usr/include/libdwarf

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_gitname
  # Xattr tests fail on tmpfs
  make -k check || :
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
