# Maintainer : lsf <lsf@lsf>

pkgname=wifite2-git
pkgver=r376.5483a41
pkgrel=2
pkgdesc="A tool to attack multiple WEP and WPA encrypted networks at the same time"
arch=(any)
url="https://github.com/kimocoder/wifite2"
license=('GPL')
depends=(python aircrack-ng wireless_tools net-tools wireshark-cli)
optdepends=(macchanger reaver bully
            cowpatty pyrit hcxdumptool hcxtools john hashcat)
makedepends=(git)
source=($pkgname::git+https://github.com/kimocoder/wifite2.git
        "bad_indentation_fix.patch")

sha256sums=('SKIP'
            '79613c5d6fb8d4e2e09789a811a40de53b6a06a863802895ffe529f4e2f0e272')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  patch -Np1 -i ../bad_indentation_fix.patch
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/wifite2
  install -D -m755 ${pkgname}/Wifite.py ${pkgdir}/usr/share/wifite2/Wifite.py
  cp -r $pkgname/wifite ${pkgdir}/usr/share/wifite2/wifite

  cat > "$pkgdir/usr/bin/wifite2" << EOF
#!/bin/sh
exec python /usr/share/wifite2/Wifite.py "\${@}"
EOF

chmod a+x "$pkgdir/usr/bin/wifite2"
}
