# Maintainer: honjow <honjow@gmail.com>

pkgname=frzr-sk-git
_pkgname=frzr
pkgver=0.15.2.r7.g9d867af
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
provides=('frzr')
conflicts=('frzr')
url="https://github.com/honjow/frzr"
license=('MIT')
depends=('btrfs-progs' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux' 'dmidecode' 'zstd' 'xz' 'aria2')
makedepends=('fakeroot')
source=("git+$url#branch=dev")
md5sums=('SKIP')
backup=('etc/frzr-sk.conf')

pkgver() {
    cd "$srcdir/$_pkgname"
    # printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/frzr"
  install -dm755 "$pkgdir/etc/systemd/system"
  install -dm755 "$pkgdir/usr/share/libalpm/hooks"

  install -m 644 "$srcdir/$_pkgname/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
  install -m 644 "$srcdir/$_pkgname/frzr-autoupdate.timer" "$pkgdir/etc/systemd/system"

  rm -f "$srcdir/$_pkgname"/frzr*.service

  install -m755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgname"/frzr*
  install -m755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgname"/__frzr*

  install -m 644 "$srcdir/$_pkgname/99-frzr-kernel-install.hook" "$pkgdir/usr/share/libalpm/hooks"

  install -dm755 "$pkgdir/etc"
  install -m644 -t "$pkgdir/etc" "$srcdir/$_pkgname/etc"/*.conf
}
