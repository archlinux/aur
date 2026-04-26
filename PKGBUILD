# Maintainer: hnchengzong
pkgname=jlu-drcom-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="吉林大学校园网客户端"
arch=('x86_64')
url="https://github.com/hnchengzong/jlu-drcom-linux"
license=('MIT')
depends=()
makedepends=()
source=("https://github.com/hnchengzong/jlu-drcom-linux/releases/download/v$pkgver/jlu-drcom-$pkgver.tar.xz")
sha256sums=('0a257c0d4a0dae9913afcbeb5a06630ce7a95c6b79dfbd510eef03ad6c298754')   
package() {
  cd "$srcdir/jlu-drcom"

  install -d "$pkgdir/opt/drclient/translator"

  install -Dm755 DrClientLinux "$pkgdir/opt/drclient/DrClientLinux"
  install -Dm644 libjpeg.so.62 "$pkgdir/opt/drclient/libjpeg.so.62"
  install -Dm644 libpng12.so.0 "$pkgdir/opt/drclient/libpng12.so.0"
  install -Dm644 DrClientLinux.rcc "$pkgdir/opt/drclient/DrClientLinux.rcc"
  install -Dm644 translator/localizer_chs.qm "$pkgdir/opt/drclient/translator/localizer_chs.qm"
  install -Dm755 drcomauthsvr "$pkgdir/opt/drclient/drcomauthsvr"
  install -Dm644 drcomauthsvr.drsc "$pkgdir/opt/drclient/drcomauthsvr.drsc"
  install -Dm644 drcomrulesvr.drsc "$pkgdir/opt/drclient/drcomrulesvr.drsc"

  install -Dm755 hn-config.sh "$pkgdir/opt/drclient/hn-config.sh"
  install -Dm755 hostinfo.sh "$pkgdir/opt/drclient/getinfo.sh"
  install -Dm755 pppoe-status "$pkgdir/opt/drclient/pppoe-status.sh"

  chown root:root "$pkgdir/opt/drclient/drcomauthsvr"
  chmod 4755 "$pkgdir/opt/drclient/drcomauthsvr"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/jlu-drcom" << 'EOF'
#!/bin/sh
cd /opt/drclient || exit 1
exec ./DrClientLinux "$@"
EOF

  cat > "$pkgdir/usr/bin/jlu-config" << 'EOF'
#!/bin/sh
cd /opt/drclient || exit 1
export LD_LIBRARY_PATH=/opt/drclient:$LD_LIBRARY_PATH
exec /opt/drclient/hn-config.sh "$@"
EOF

  chmod 755 "$pkgdir/usr/bin/jlu-drcom"
  chmod 755 "$pkgdir/usr/bin/jlu-config"
}
