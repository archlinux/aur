# Maintainer: ksj <podhorsky.ksj@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

_gitname=libfm
pkgname=$_gitname-gtk3-git
pkgver=1.2.3.r50.ge6d3530
pkgrel=1
pkgdesc='Library for file management'
arch=('i686' 'x86_64')
url="http://www.lxde.org"
license=('GPL2')
depends=('gtk3' 'menu-cache' 'desktop-file-utils' 'libexif' 'dbus-glib')
makedepends=('git' 'intltool' 'gtk-doc')
provides=("$_gitname=$pkgver" "$_gitname-extra")
conflicts=("$_gitname")
install=$_gitname.install
source=("$_gitname::git://git.lxde.org/git/lxde/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
    cd $_gitname
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {    
    cd $_gitname
	./autogen.sh
	./configure --with-gtk=3 --enable-gtk-doc-html=no --disable-actions --prefix=/usr --sysconfdir=/etc --with-gnu-ld

	make
}

check() {
    cd $_gitname
    make check
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install

  # Temporary fix to FS#32361
  rm -rf "$pkgdir"/usr/include/libfm
  mv "$pkgdir"/usr/include/libfm-1.0/ "$pkgdir"/usr/include/libfm

  # Split libfm-extra
  [[ -d $srcdir/libfm-extra ]] && rm -r "$srcdir/libfm-extra/"
  mkdir "$srcdir"/libfm-extra
  mv "$pkgdir"/usr/include/libfm/fm-{extra,version,xml-file}.h \
     "$pkgdir"/usr/lib/libfm-extra.so* \
     "$pkgdir"/usr/lib/pkgconfig/libfm-extra.pc \
     "$srcdir/libfm-extra/"
}
