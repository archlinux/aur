# Maintainer: alex4401 <rylatgl@gmail.com>
pkgname=update-efi-entry
pkgver=r27.1f6d088
pkgrel=1
pkgdesc="Simple EFISTUB entry setup and management script."
arch=('any')
license=('GPL')
depends=('bash' 'efibootmgr' 'ncurses' 'util-linux')
makedepends=('git' 'sed')
source=(
    "git+https://github.com/alex4401/update-efi-entry.git"
)
backup=('etc/boot/entry' 'etc/boot/kernel-parameters')
sha256sums=('SKIP')
url="https://github.com/alex4401/update-efi-entry"

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd "$srcdir/$pkgname"
    sed -i 's/CONFIG_DIR=.\/config/CONFIG_DIR=\/etc\/boot/g' update-efi-entry
    sed -i 's/HOOKS_DIR=.\/hooks/HOOKS_DIR=\/usr\/lib\/update-efi-entry\/hooks/g' update-efi-entry
}

package() {
    install -dm755 "$pkgdir/usr/lib/update-efi-entry/hooks/"
    install -dm755 "$pkgdir/etc/boot/"
    
    install -Dm755 "$srcdir/$pkgname/update-efi-entry" "$pkgdir/usr/bin/update-efi-entry"
    install -Dm644 "$srcdir/$pkgname/config/entry" "$pkgdir/etc/boot/entry"
    install -Dm644 "$srcdir/$pkgname/config/kernel-parameters" "$pkgdir/etc/boot/kernel-parameters"
    install -Dm644 "$srcdir/$pkgname/hooks/"* "$pkgdir/usr/lib/update-efi-entry/hooks/"
}
