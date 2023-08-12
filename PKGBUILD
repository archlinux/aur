#Maintainer: Marcus Andersson <marcus at tojoma dot se>
# Maintainer: Stephan Windmüller <arch at freewarepoint dot de>
# Based on Teamcity PKGBUILD by Nowaker

pkgname=upsource
pkgver=2020.1
_build=1992
pkgrel=1
pkgdesc='Repository Browsing and Code Review tool from JetBrains'
arch=('any')
url="https://www.jetbrains.com/upsource/"
license=('Commercial')
depends=('java-runtime-headless')
install="$pkgname.install"
source=("https://download.jetbrains.com/upsource/upsource-${pkgver}.${_build}.zip"
        'upsource.service'
	'upsource.conf')
sha256sums=('b1c575c1d7dc931ec163986454b0dba587268807fa0648984d62e737289cf0bf'
            '90d447198d5ccb96985860a4d1e3b82fa6bfa2ce0def4e7214fbc2dcfe93add7'
            '1d216f3e4494a665860a5ca2b295bb22640b6fe5a34e7149fcfd2dfb3026c55f')
options=('!strip')
PKGEXT='.pkg.tar'
backup=('opt/upsource/data', 'opt/upsource/conf', 'opt/upsource/backups')

prepare() {
    if [ -d /opt/upsource ] && ! find /opt/upsource/backups/ -mindepth 1 -type d -mtime 0 | egrep -q '.*'  ;
    then
       echo "No recent backup found in /opt/upsource/backups/"
       echo "Please create a manual backup from the web interface"
       echo "or remove this check if you know what you are doing."
       exit 1
    fi
}

package() {
  mkdir -p "${pkgdir}/usr/share/licenses"
  mkdir -p "${pkgdir}/var/lib/upsource"
  mkdir -p "${pkgdir}/opt/${pkgname}"

  install -Dm755 "${srcdir}/upsource.service" "${pkgdir}/usr/lib/systemd/system/upsource.service"
  install -Dm755 "${srcdir}/upsource.conf" "${pkgdir}/etc/conf.d/upsource"
  # Java for Windows or MacOS is not needed
  rm -rf "${srcdir}/upsource/internal/java/mac-x64/"
  rm -rf "${srcdir}/upsource/internal/java/windows-amd64/"
  cp -R "${srcdir}/upsource-${pkgver}.${_build}"/* "${pkgdir}/opt/${pkgname}"
}
