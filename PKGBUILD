# Maintainer: Zesko
_pkgname="limine-entry-tool"
pkgname="limine-dracut-support"
pkgver=1.9.0
pkgrel=1
pkgdesc="Install kernel for Limine bootloader."
arch=("any")
url="https://gitlab.com/Zesko/limine-entry-tool"
source=("$_pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
license=("GPL3")
provides=('limine-entry-tool')
depends=(
        'bash'
        'java-environment-openjdk>=17'
        'limine'
        'dracut'
        'systemd'
        'efibootmgr')
optdepends=(
        'sbctl: signs bootable EFI files for Secure Boot when enabled.'
        'journalctl-desktop-notification: It notifies you on Desktop when an error occurs.'
)
makedepends=('git' 'maven')
backup=(etc/limine-entry-tool.conf)
conflicts=('limine-dracut-support-git' 'limine-entry-tool')
sha256sums=('70200837439091d83052107f422acd17347c067cff054cb419dace8356f99030')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  mvn clean package
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  src_path="install/arch-linux/${pkgname}"
  install -dm 755 $src_path/usr/share/java/
  install -Dm 644 target/limine-entry-tool*.jar $src_path/usr/share/java/
  install -dm 755 $src_path/usr/share/doc/${pkgname}/
  cp -r README.md CHANGELOG.md $src_path/usr/share/doc/${pkgname}/
  cp -r $src_path/usr $src_path/etc "$pkgdir"
}

