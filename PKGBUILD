# Maintainer: kj_sh604 <406hs_jk@proton.me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=agave
pkgver=0.4.7
pkgrel=14
pkgdesc="Legacy colorscheme designer tool for GNOME2"
arch=('x86_64')
url="https://web.archive.org/web/20170327063642/http://home.gna.org/colorscheme/"
license=('GPL')
depends=('libglademm' 'gtkmm' 'libxml2-legacy')
makedepends=('libxslt' 'intltool' 'boost' 'gnome-doc-utils')
sha256sums=('4005361ab1b137029c7d50afbbfbae7d83bdde7cec3e155a85eed59f6ec4e6fc'
            '132008f0bbe040c59bbc134d9ca3eb244967a66f95bf113d94e976b8ed776c6c'
            'dc93ef15cf96a62e2d8d21d6e360428305d3ba6640742a8e9c3a6a2c6aeaf665'
            '8f1a1ecc7f3887de540187e8d10448c44eacb20cb5b1e7db62c7c9318ca861cc'
            '225f9a5cfebea4f9c1d4120611394eb148ffb9a6c151e79f749df1749e015c91')

source=(http://archive.ubuntu.com/ubuntu/pool/universe/a/$pkgname/${pkgname}_$pkgver.orig.tar.gz
        agave-0.4.7-mdv-fix-str-fmt.patch
        schemebox.patch
        drop-libgnome.patch
        fix-build-without-gconf.patch)

prepare() {
  cd $pkgname-$pkgver

  # Build fix from Fedora
  patch -Np1 -i ../agave-0.4.7-mdv-fix-str-fmt.patch

  # Another build fix
  patch -Np1 -i ../schemebox.patch

  # Remove deprecated libgnome dependency
  patch -Np1 -i ../drop-libgnome.patch

  # Fix build without gconfmm installed
  patch -Np1 -i ../fix-build-without-gconf.patch
}

build() {
  cd $pkgname-$pkgver
  CXXFLAGS+=' -std=c++11'
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-scrollkeeper --disable-gnome --disable-gconf
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm "$pkgdir/agave.schemas"
}
