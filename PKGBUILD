# Maintainer: Zesko
pkgname="limine-snapper-sync-git"
pkgver=0
pkgrel=1
pkgdesc="Snapper integration for Limine bootloader."
arch=("any")
url="https://gitlab.com/Zesko/limine-snapper-sync"
source=(git+$url.git)
license=("GPL3")
depends=(
       'bash'
       'java-environment>=17'
       'limine'
       'snapper'
       'btrfs-progs'
       'inotify-tools'
       'dunst')
optdepends=(
        'rsync: For restore'
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
