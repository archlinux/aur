# Maintainer: honjow <honjow@gmail.com>

pkgname=frzr-sk
_pkgname=frzr
pkgver=3.5.4
pkgrel=1
pkgdesc="A deployment and update system for read-only btrfs subvolume based operating systems"
arch=('any')
provides=('frzr')
conflicts=('frzr')
url="https://github.com/honjow/frzr"
license=('MIT')
depends=('btrfs-progs' 'parted' 'libnewt' 'dosfstools' 'jq' 'util-linux' 'dmidecode' 'zstd' 'xz' 'aria2')
makedepends=('fakeroot')

# 3.5.4 release snapshot, pinned to the reviewed source commit (not a Git tag).
_commit=ab6eb064abd963e203b7f3999b452e31385bf97f
source=("git+$url#commit=${_commit}")
md5sums=('SKIP')

backup=('etc/frzr-sk.conf')

# pkgver() {
#     cd "$srcdir/$_pkgname"
#     # printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
# }

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/etc/systemd/system"
  install -m 755 "$srcdir/$_pkgname/frzr-bootstrap" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$_pkgname/frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$_pkgname/__frzr-deploy" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$_pkgname/frzr-release" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$_pkgname/frzr-unlock" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$_pkgname/frzr-initramfs" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/$_pkgname/frzr-tweaks" "$pkgdir/usr/bin"
  install -m 644 "$srcdir/$_pkgname/frzr-autoupdate.service" "$pkgdir/etc/systemd/system"
  install -m 644 "$srcdir/$_pkgname/frzr-autoupdate.timer" "$pkgdir/etc/systemd/system"

  install -dm755 "$pkgdir/etc"
  install -m644 -t "$pkgdir/etc" "$srcdir/$_pkgname/etc"/*.conf
  install -m644 -t "$pkgdir/etc" "$srcdir/$_pkgname/etc"/*.json || true
}
