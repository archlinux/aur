# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgbase=redshift-git
pkgname=('redshift-git' 'redshift-gtk-git')
pkgver=1.10.r32.g5f26b3d
pkgrel=1
pkgdesc='Adjusts the color temperature of your screen according to your surroundings (development version)'
arch=('i686' 'x86_64')
url='http://jonls.dk/redshift/'
license=('GPL3')
depends=('libxxf86vm' 'libdrm' 'libxcb' 'geoclue2')
makedepends=('git' 'intltool' 'python')
source=(redshift::"git+https://github.com/jonls/redshift.git")
md5sums=('SKIP')

pkgver() {
  cd redshift
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd redshift

  ./bootstrap
  ./configure --prefix=/usr --enable-randr --enable-drm --enable-vidmode --enable-geoclue2 \
    --with-systemduserunitdir=/usr/lib/systemd/user
  make
}

package_redshift-git() {
  provides=('redshift')
  conflicts=('redshift')

  make -C redshift DESTDIR="$pkgdir" install

  # remove duplicate redshift-gtk stuff
  rm -rf "$pkgdir"/usr/{bin/redshift-gtk,lib/{python*,systemd/user/redshift-gtk.service}}
  rm -rf "$pkgdir"/usr/share/{applications,icons,appdata}
}

package_redshift-gtk-git() {
  depends=("redshift-git=$pkgver" 'gtk3' 'python-xdg' 'python-gobject' 'librsvg'
           'hicolor-icon-theme')
  install=redshift-gtk-git.install

  make -C redshift DESTDIR="$pkgdir" install

  # remove duplicate redshift stuff
  rm -rf "$pkgdir"/usr/{bin/redshift,lib/systemd/user/redshift.service,share/{locale,man}}
}
