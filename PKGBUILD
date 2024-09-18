# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Original author: David Runge <dvzrv@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Mirco Tischler <mt-ml at gmx dot de>

_pkgname=ostree
pkgname=ostree-nocurl
pkgver=2024.7
pkgrel=1
pkgdesc="Operating system and container binary deployment and upgrades"
url="https://ostreedev.github.io/ostree/"
arch=(x86_64)
provides=($_pkgname)
conflicts=($_pkgname)
license=(LGPL-2.0-or-later)
depends=(
  bash
  composefs
  fuse3
  gcc-libs
  glibc
  libgpg-error
  libsodium
  sh
  util-linux
  which  # remove after https://github.com/ostreedev/ostree/pull/3154 is merged and released
  zlib
)
makedepends=(
  avahi
  curl
  e2fsprogs
  git
  glib2
  glib2-devel
  gobject-introspection
  gpgme
  gtk-doc
  libarchive
  libsoup3
  libxslt
  mkinitcpio
  openssl
  python
  systemd
  xz
)
checkdepends=(
  cpio
  elfutils
  gjs
  parallel
  python-yaml
  syslinux
)
provides=(libostree-1.so)
source=(
  git+https://github.com/ostreedev/ostree#tag=v$pkgver
  git+https://github.com/mendsley/bsdiff
  git+https://gitlab.gnome.org/GNOME/libglnx.git
  "$_pkgname-2023.1-use_fuse3.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/ostree/-/raw/main/ostree-2023.1-use_fuse3.patch"
)
b2sums=('1d5c7453029d568d294c4e4b9d0f39f40de9e2951d9f35e8cc5051b5ccbbd1ef9f1943f110e5bf72b8a85020062b79accf7fccf939f0631a3cb94d0b90686135'
        'SKIP'
        'SKIP'
        'cfff162120f70995e18ec56454711501391b97456e2a0f34643c9d2a9c2b50b4d76afc2e2fc50ea28e8a773c618215d6cb855b96663f69dc5cc93bc5766f3f28')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd $_pkgname

  # use fusemount3 (fuse3)
  git apply -3 ../$_pkgname-2023.1-use_fuse3.patch

  git submodule init
  git submodule set-url bsdiff "$srcdir/bsdiff"
  git submodule set-url libglnx "$srcdir/libglnx"
  git -c protocol.file.allow=always submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --disable-static
    --enable-experimental-api
    --enable-gtk-doc
    --libexecdir=/usr/lib
    --localstatedir=/var
    --prefix=/usr
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-dracut=yesbutnoconf
    --with-ed25519-libsodium
    --with-grub2-mkconfig-path=/usr/bin/grub-mkconfig
    --with-mkinitcpio
    --with-modern-grub
    --with-openssl
  )

  cd $_pkgname
  ./configure "${configure_options[@]}"
  # prevent overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  make check -k -C $_pkgname
}

package() {
  depends+=(
    avahi libavahi-client.so libavahi-common.so libavahi-glib.so
    curl libcurl.so
    glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
    gpgme libgpgme.so
    libarchive libarchive.so
    openssl libcrypto.so
    systemd-libs libsystemd.so
    xz liblzma.so
  )

  make DESTDIR="$pkgdir" install -C $_pkgname
}
