# Maintainer: Zesko
pkgname="limine-entry-tool-git"
pkgver=r124.a510155
pkgrel=1
pkgdesc="Install kernel for Limine bootloader."
arch=('x86_64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=(git+$url.git)
license=("GPL3")
provides=('limine-entry-tool')
depends=(
        'bash'
        'java-environment-openjdk>=17'
        'limine'
        'systemd'
        'efibootmgr')
makedepends=('git' 'maven')
sha1sums=('SKIP')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-dracut-support' 'limine-dracut-support-git')

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
  src_path="install/arch-linux/${pkgname%-git}"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-entry-tool.jar $src_path/usr/share/java/
  install -dm 755 $src_path/usr/share/doc/${pkgname%-git}/
  cp -r README.md CHANGELOG.md $src_path/usr/share/doc/${pkgname%-git}/
  cp -r $src_path/usr $src_path/etc "$pkgdir"
}
