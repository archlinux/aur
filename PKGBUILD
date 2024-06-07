# Maintainer: Vic RH <blitzkriegfc@gmail.com>

pkgname=perimeter81-rpm
pkgver=9.0.1.843
pkgrel=1
_folder='Perimeter81'
_name='Perimeter81'
pkgdesc='Perimeter81 agent application'
arch=('x86_64')
url='https://support.perimeter81.com/docs/downloading-the-agent'
license=('custom:LICENSE')
depends=('systemd' 'netcat')
options=(!strip)
source=(
  "https://static.perimeter81.com/agents/linux/Perimeter81_${pkgver}.rpm"
  'perimeter81helper.service'
  'LICENSE'
)
md5sums=(
  'fe09c76a7882c8ab5297474bd58756da'
  '089b611fb1ecbd3e39e2d2d391743205'
  '64c25ccc5446c93c6073a418f664d3d5'
)

package() {
  cp -r opt usr $pkgdir/
  install -Dm644 $srcdir/perimeter81helper.service $pkgdir/usr/lib/systemd/system/perimeter81helper.service
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

pre_remove() {
    exec /usr/bin/systemctl disable --now perimeter81helper.service > dev/null 2>&1
    exec /usr/bin/systemctl daemon-reload > dev/null 2>&1
}   

post_install() {
    exec $pkgdir/opt/Perimeter81/after-install.sh
    exec /usr/bin/systemctl enable --now perimeter81helper.service > dev/null 2>&1
    exec /usr/bin/systemctl daemon-reload > dev/null 2>&1
}

post_remove() {
    exec $pkgdir/opt/Perimeter81/after-uninstall.sh
}

pre_upgrade() {
    exec /usr/bin/systemctl stop perimeter81helper.service > dev/null 2>&1
}

post_upgrade() {
    exec /usr/bin/systemctl start perimeter81helper.service > dev/null 2>&1
}
