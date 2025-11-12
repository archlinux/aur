# Maintainer: yhshzh0 <yhshzh0@gmail.com>
pkgname=tang-dynasty-bin
pkgver=6.2.1_SP1
pkgrel=1
pkgdesc="Tang Dynasty FPGA/EDA toolchain"
arch=('x86_64')
url="https://www.anlogic.com/"
conflicts=('tang-dynasty')
license=('custom')
depends=('udev')
options=(!strip)


source=("TD_${pkgver}_178840_NL.zip::https://anlogic.oss-cn-shanghai.aliyuncs.com/web_doc/%E5%B7%A5%E5%85%B7%E4%B8%8E%E8%B5%84%E6%96%99%E4%B8%8B%E8%BD%BD/%E8%BD%AF%E4%BB%B6%E5%B7%A5%E5%85%B7/TD_Linux/TD_6.2/ggshdjsgkdjh/TD_6.2.1_SP1_178840_NL.zip"
        "tang-dynasty.desktop"
        "tang-dynasty.png"
        "99-anlogic-jtag.rules")

sha256sums=('c5917d6ae54e118e0b607063e4612d5ae21ab8bfb5b4a4988b28f67160b86839'
            '40c810053bf8044eb20238ace006ff973622e6793e4ec339fdc571ae1399c203'
            'c7518eb2fe0ebafbeadba36a80616892403e89338eb8392aedaeb24ecfbb6040'
            'a4fe58538e15635dc3ed8688d312c006ba959b2d456c57fd0e445975632ef7e0')

prepare() {
  cd "$srcdir"
  mv "TD_${pkgver}_178840_NL"/* .
  rmdir "TD_${pkgver}_178840_NL"
}

package() {
  install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
  cp -r doc/* "$pkgdir/usr/share/doc/$pkgname/"

  install -dm755 "$pkgdir/opt/$pkgname/"
  mv arch bin cw ip lib packages pubkey sim_release license "$pkgdir/opt/$pkgname/"

  chmod 755 "$pkgdir/opt/$pkgname/bin/td"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tang-dynasty" << 'EOF'
#!/bin/bash
bin_dir="/opt/tang-dynasty-bin/bin"
lib_dir="/opt/tang-dynasty-bin/lib"

export LD_LIBRARY_PATH="$lib_dir:$lib_dir/Qt/lib"
export QT_PLUGIN_PATH="$lib_dir/Qt/plugins"

exec "$bin_dir/td" "$@"
EOF

  install -Dm644 "$srcdir/tang-dynasty.png" "$pkgdir/usr/share/pixmaps/tang-dynasty.png"
  install -Dm644 "$srcdir/tang-dynasty.desktop" "$pkgdir/usr/share/applications/tang-dynasty.desktop"

  install -Dm644 "$srcdir/99-anlogic-jtag.rules" "$pkgdir/usr/lib/udev/rules.d/99-anlogic-jtag.rules"
}

