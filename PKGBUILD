# Maintainer: Zesko
pkgname="limine-snapper-sync-git"
pkgver=r82.beea78d
pkgrel=1
pkgdesc="The tool syncs Snapper snapshots with Limine bootloader"
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=(git+$url.git)
license=("GPL3")
depends=(
       'bash'
       'java-environment-openjdk>=17'
       'limine'
       'snapper'
       'btrfs-progs'
       'inotify-tools')
optdepends=(
        'dunst: Displays a desktop notification for one-click restoration.'
        'limine-dracut-support: Automates kernel installation/removal and Limine boot entry management.'
        'rsync: Provides an alternative method for restoring snapshots.'
        'journalctl-desktop-notification: Sends desktop notifications for errors, including detected hardware issues.'
        'b3sum: Blake3 fast hash function that avoids duplication.'
)
makedepends=('git' 'maven')
sha1sums=('SKIP')
backup=(etc/limine-snapper-sync.conf)
conflicts=('limine-snapper-sync')


pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir/${pkgname%-git}"
    mvn clean package
}

package() {
  cd "$srcdir/${pkgname%-git}"
  src_path="install/arch-linux/"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-snapper-sync*.jar $src_path/usr/share/java/
  cp -vr $src_path/usr $src_path/etc "$pkgdir"
}
