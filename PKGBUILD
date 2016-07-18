# $Id$
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Zygmunt Krynicki <me at zygoon dot pl>

pkgname=snap-confine-apparmor
_pkgname=snap-confine
pkgver=1.0.35
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
        usr.lib.snap-confine.snap-confine)
md5sums=('d4e1f8e978d4ce07eb07f394174af185'
         'db28b8a4dd97dace091b4eae3127750f')

build() {
  cd "$_pkgname-$pkgver"

  # Confinement is disabled because arch doesn't yet have all the supporting
  # kernel patches. Rootfs is core snap is enabled because that is the
  # preferred way to create runtime environment for snaps. Nvidia support is
  # enabled to support proprietary nvidia drivers.
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib/snap-confine \
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
  install -Dm 644 "$srcdir/usr.lib.snap-confine.snap-confine" "$pkgdir"/etc/apparmor.d/usr.lib.snap-confine.snap-confine
}
