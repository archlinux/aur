# Maintainer: Sylvainb
pkgname=virtualhub-v2
_build=75391
pkgver=2.1.15391
pkgrel=1
pkgdesc="Yoctopuce VirtualHub V2 - network gateway for Yoctopuce USB modules"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.yoctopuce.com/"
license=('custom')
depends=('glibc')
options=('!strip')
install="$pkgname.install"

source=("VirtualHubV2.linux.$_build.zip::https://www.yoctopuce.com/FR/downloads/VirtualHubV2.linux.$_build.zip")
# update with `updpkgsums`
sha256sums=('SKIP')

_srcdir() {
  case "$CARCH" in
    x86_64)  echo "x86_64" ;;
    i686)    echo "i386"   ;;
    armv7h)  echo "armhf"  ;;
    aarch64) echo "aarch64";;
    *) echo "Unsuported architecture: $CARCH" >&2; return 1 ;;
  esac
}

package() {
  cd "$srcdir"
  local d
  d="$(_srcdir)" || return 1

  install -Dm755 "$d/VirtualHub-V2" "$pkgdir/usr/bin/VirtualHub-V2"

  install -d "$pkgdir/usr/lib/systemd/system"
  cat > "$pkgdir/usr/lib/systemd/system/yvirtualhub-v2.service" <<'EOF'
[Unit]
Description=Yoctopuce VirtualHub V2
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/bin/VirtualHub-V2
StateDirectory=virtualhub-v2
Environment=HOME=/var/lib/virtualhub-v2
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

  # udev: access for all users (0666), to restrict to "yoctogroup", use _group intead of _all above.
  install -Dm644 "udev_conf/51-yoctopuce_all.rules" \
    "$pkgdir/usr/lib/udev/rules.d/51-yoctopuce.rules"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "LISEZMOI.txt" "$pkgdir/usr/share/doc/$pkgname/LISEZMOI.txt"
  install -Dm644 "README.txt"   "$pkgdir/usr/share/doc/$pkgname/README.txt"
  install -Dm644 "Documentation/VirtualHub-manual-EN.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/VirtualHub-manual-EN.pdf"
  install -Dm644 "Documentation/VirtualHub-manual-FR.pdf" \
    "$pkgdir/usr/share/doc/$pkgname/VirtualHub-manual-FR.pdf"
}
