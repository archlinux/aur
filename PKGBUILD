# Maintainer: Zesko
pkgname="limine-dracut-support-git"
pkgver=r25.d4e64d3
pkgrel=1
pkgdesc="Install kernel for Limine bootloader."
arch=('x86_64')
url="https://gitlab.com/Zesko/limine-entry-tool"
source=(git+$url.git)
license=("GPL3")
depends=(
       'bash'
       'java-environment-openjdk>=17'
       'limine'
       'dracut'
       'systemd')
optdepends=(
        'journalctl-desktop-notification: It notifies you on Desktop when an error occurs.'
)
makedepends=('git' 'maven')
sha1sums=('SKIP')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-dracut-support')


pkgver() {
  cd "$srcdir"/limine-entry-tool
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    cd "$srcdir"/limine-entry-tool
    mvn clean package
}

package() {
  cd "$srcdir"/limine-entry-tool
  src_path="install/arch-linux/${pkgname%-git}"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-entry-tool*.jar $src_path/usr/share/java/
  cp -vr $src_path/usr $src_path/etc "$pkgdir"
}
