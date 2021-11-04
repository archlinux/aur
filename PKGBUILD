# Maintainer: David Thurstenson <thurstylark@gmail.com>
# Contributor: Toolybird <toolybird@tuta.io>

pkgname=guestfs-tools
pkgver=1.46.1
_pkgver_short=${pkgver%.*}
pkgrel=1
pkgdesc="Tools for accessing and modifying guest disk images"
arch=('x86_64')
url="http://libguestfs.org/"
license=('GPL2' 'LGPL2.1')
depends=(libguestfs perl-libintl-perl)
makedepends=(libisoburn ocaml-findlib perl-module-build bash-completion)
backup=('etc/virt-builder/repos.d/libguestfs.conf'
        'etc/virt-builder/repos.d/libguestfs.gpg'
        'etc/virt-builder/repos.d/opensuse.conf'
        'etc/virt-builder/repos.d/opensuse.gpg')
source=("http://download.libguestfs.org/$pkgname/$_pkgver_short-stable/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('93acc3aeaeda102c7134b40eb3b59bf3ef7d06f5cd44245ec1401bec77ba36a8'
            'SKIP')
validpgpkeys=('F7774FB1AD074A7E8C8767EA91738F73E1B768A0') # Richard W.M. Jones <rjones@redhat.com>

build() {
  cd "$pkgname-$pkgver"

  _args=(
    --prefix=/usr
    --sysconfdir=/etc
  )

  ./configure "${_args[@]}"
  make
}

#check() {
#  # needs access to /dev/kvm inside nspawn container 
#  # 1 test will be skipped if unable to access /dev/fuse
#  # 2 tests fail that want librpm, skip both
#  cd "$pkgname-$pkgver"
#  SKIP_TEST_VIRT_INSPECTOR_SH=1 \
#  SKIP_TEST_VIRT_INSPECTOR_LUKS_SH=1 \
#  make check
#}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
