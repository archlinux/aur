# Maintainer: Hossam Mostafa <hossamdash2@gmail.com>

_pkgname=ali-instance-cli
pkgname=ali-instance-cli-bin
pkgver=1.2.0.81
pkgrel=1
pkgdesc="Alibaba Cloud Session Manager CLI for connecting to ECS instances"
arch=('x86_64')
url="https://www.alibabacloud.com/help/en/ecs/user-guide/connect-to-an-instance-by-using-ali-instance-cli/"
license=('custom')
install=ali-instance-cli.install
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source=("https://aliyun-client-assist.oss-accelerate.aliyuncs.com/session-manager/linux/ali-instance-cli"
        "ali-instance-cli.tmpfiles")
# updates are silent, skip checksums so pkgbuild doesn't break on new releases
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  chmod +x "$srcdir/ali-instance-cli"
  # Extract version number without creating log files
  cd /tmp
  "$srcdir/ali-instance-cli" version 2>/dev/null | grep -oP '\d+(\.\d+)+' | head -n1
}

package() {
  # Install binary to /opt
  install -Dm755 "$srcdir/ali-instance-cli" "$pkgdir/opt/ali-instance-cli/ali-instance-cli"

  # Install tmpfiles.d configuration
  install -Dm644 "$srcdir/ali-instance-cli.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/ali-instance-cli.conf"

  # Make binary accessible from PATH
  install -d "$pkgdir/usr/bin"
  ln -s /opt/ali-instance-cli/ali-instance-cli "$pkgdir/usr/bin/ali-instance-cli"
}