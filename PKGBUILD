pkgname=ostree-git
_pkgname=ostree
pkgver=2020.8+8+g024b169a
pkgrel=1
pkgdesc="Operating system and container binary deployment and upgrades"
url="https://ostree.readthedocs.org/en/latest/"
arch=(x86_64)
license=(GPL)
depends=('glib2' 'xz' 'zlib' 'libsoup' 'gpgme' 'libarchive' 'fuse2' 'util-linux' 'openssl' 'avahi')
makedepends=('e2fsprogs' 'gobject-introspection' 'gtk-doc' 'libxslt' 'systemd' 'git' 'python')
checkdepends=('parallel' 'syslinux' 'gjs' 'cpio' 'elfutils')
provides=('ostree')
conflicts=('ostree')
source=("git+https://github.com/ostreedev/ostree"
        "git+https://github.com/mendsley/bsdiff"
        "git+https://gitlab.gnome.org/GNOME/libglnx.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $_pkgname

  git submodule init
  git config --local submodule.bsdiff.url "$srcdir/bsdiff"
  git config --local submodule.libglnx.url "$srcdir/libglnx"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

pkgver() {
  cd $_pkgname
  git describe | sed 's/^v//;s/-/+/g'
}

build() {
  cd $_pkgname

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --with-mkinitcpio \
    --with-openssl \
    --with-builtin-grub2-mkconfig \
    --enable-experimental-api \
    --disable-static \
    --enable-gtk-doc

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_pkgname
  make check || :
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
