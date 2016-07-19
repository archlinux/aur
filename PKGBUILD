# $Id$
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Zygmunt Krynicki <me at zygoon dot pl>

pkgname=snap-confine-apparmor
_pkgname=snap-confine
pkgver=1.0.38
pkgrel=1
pkgdesc="Confinement system for snap applications (with apparmor)"
arch=('i686' 'x86_64')
url="git://github.com/snapcore/snap-confine"
license=('GPL3')
depends=('bash' 'libseccomp' 'libsystemd' 'apparmor' 'linux-ubuntu')
makedepends=('python-docutils' 'systemd')
checkdepends=('indent' 'shellcheck')
conflicts=('snap-confine')
replaces=('snap-confine')
source=("https://github.com/snapcore/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/snapcore/snap-confine/$pkgver/debian/usr.bin.snap-confine"
        usr.bin.snap-confine-fix-modules-path.patch)
md5sums=('1ab7bcb5074f47b3dc818c0d06c1eb37'
         'fe651e15ebb5053f226be45f3e41a9b0'
         '0933340c38cdad2dccd57a0b91489714')

prepare() {
  rm -f usr.bin.snap-confine
  cp "$startdir"/usr.bin.snap-confine .
  patch -Np0 -i usr.bin.snap-confine-fix-modules-path.patch
}

build() {
  cd "$_pkgname-$pkgver"

  # Confinement is disabled because arch doesn't yet have all the supporting
  # kernel patches. Rootfs is core snap is enabled because that is the
  # preferred way to create runtime environment for snaps. Nvidia support is
  # enabled to support proprietary nvidia drivers.
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/snapd \
    --enable-rootfs-is-core-snap \
#    --enable-nvidia-arch
  make
}

check() {
  cd "$_pkgname-$pkgver"
  make -k check
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 644 "$srcdir/usr.bin.snap-confine" "$pkgdir"/etc/apparmor.d/usr.bin.snap-confine
}
