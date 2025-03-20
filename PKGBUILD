# Maintainer: Zesko
pkgname="limine-snapper-sync"
pkgver=1.8.5
pkgrel=1
pkgdesc="The tool syncs Snapper snapshots with Limine bootloader"
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
license=("GPL3")
depends=(
        'bash'
        'java-environment>=17'
        'limine'
        'snapper'
        'btrfs-progs'
        'inotify-tools'
        'libnotify')
optdepends=(
        'dunst: Displays a desktop notification for one-click restoration.'
        'limine-dracut-support: Automates kernel installation/removal and Limine boot entry management.'
        'rsync: Provides an alternative method for restoring snapshots.'
        'journalctl-desktop-notification: Sends desktop notifications for errors, including detected hardware issues.'
        'b3sum: Blake3 fast hash function that avoids duplication.'
)
makedepends=('git' 'maven')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync-git')
sha256sums=('c5d4652a2534304fee447a79c2c0fa1b14469ed88541ddb7ca53382522c563ac')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mvn clean package
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  src_path="install/arch-linux/"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-snapper-sync.jar $src_path/usr/share/java/
  install -dm 755 $src_path/usr/share/doc/limine-snapper-sync/
  cp -r README.md CHANGELOG.md screenshots $src_path/usr/share/doc/limine-snapper-sync/
  cp -r $src_path/usr $src_path/etc "$pkgdir"
}
