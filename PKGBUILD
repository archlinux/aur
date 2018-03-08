# Maintainer : Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor : Eric Engestrom <eric@engestrom.ch>
# Contributor : Jan de Groot <jgc@archlinux.org>

pkgname=libdrm-git
_realname=libdrm
pkgver=2.4.91.r2.g45eee3fd
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services, master git version"
arch=(i686 x86_64)
license=('custom')
depends=('libpciaccess')
makedepends=('valgrind' 'libxslt' 'docbook-xsl' 'meson')
checkdepends=('cairo' 'bcunit-cunit-compat')
url="http://dri.freedesktop.org/"
provides=('libdrm')
conflicts=('libdrm')

source=('libdrm::git://anongit.freedesktop.org/mesa/drm#branch=master'
        COPYING)
sha512sums=('SKIP'
            'b0ca349b882a4326b19f81f22804fabdb6fb7aef31cdc7b16b0a7ae191bfbb50c7daddb2fc4e6c33f1136af06d060a273de36f6f3412ea326f16fa4309fda660')


#prepare() {
#    cd $_pkgname
#    autoreconf -fi
#}

pkgver() {
    cd $_realname
    git describe --long --abbrev=8 | sed 's/^libdrm-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    arch-meson "$_realname" build  -D udev=true
    ninja -C build
}

check() {
   meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dt "$pkgdir"/usr/share/licenses/"$pkgname" -m644 COPYING
}
