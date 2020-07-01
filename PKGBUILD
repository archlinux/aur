# Maintainer: TankMissile <alecfeldman@disroot.org>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: bobpaul <boohbah@gmail.com>
# Contributor: Mikeserv

_pkgname=bcache-tools
pkgname=$_pkgname-git
pkgver=1.0.8.r0.ga73679b
pkgrel=1
changelog=bcache-tools-git.changelog
pkgdesc="Userspace tools for bcache until bcache merges with either dm or md (git version)."
url="http://bcache.evilpiepirate.org/"
arch=("i686" "x86_64")
license=("GPL")
depends=("util-linux")
makedepends=("git")
provides=("bcache-tools")
conflicts=("bcache-tools")
install="$pkgname.install"
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/colyli/$_pkgname.git"
        "initcpio-dracut-arch.patch")
sha256sums=("SKIP"
            "fea3ddfcef7aaac6cc6dd0c5497bc5f69f799d4f9f286e978ebd4b9326347f9c")

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -Np1 -i "$srcdir/initcpio-dracut-arch.patch"
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  install -d \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/lib/udev/rules.d" \
    "$pkgdir/usr/share/man/man8" \
    "$pkgdir/usr/lib/initcpio/install"

  make DESTDIR="$pkgdir" install
}
