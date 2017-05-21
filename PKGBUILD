# Maintainer: Sotirios M. Roussis (xToNouSou) <xtonousou@gmail.com>

_pkgname=airgeddon
pkgname=$_pkgname-git
pkgver=r668.3506721
pkgrel=1
pkgdesc='This is a multi-use bash script for Linux systems to audit wireless networks'
url='https://github.com/v1s1t0r1sh3r3/airgeddon'
license=('GPL3')
source=('git://github.com/v1s1t0r1sh3r3/airgeddon.git#branch=master')
depends=(
  'aircrack-ng'
  'bash>=4.2'
  'coreutils'
  'gawk'
  'iw'
  'net-tools'
  'sed'
  'wireless_tools'
  'xterm'
)
optdepends=(
  'beef'
  'bettercap'
  'bully'
  'crunch'
  'curl'
  'dhcp'
  'dsniff'
  'ethtool'
  'ettercap'
  'expect'
  'hashcat'
  'hostapd'
  'iptables'
  'lighttpd'
  'mdk3'
  'pciutils' 
  'pixiewps'
  'reaver'
  'rfkill'
  'sslstrip'
  'usbutils'
  'wget'
  'xorg-xdpyinfo'
)
makedepends=('binutils' 'coreutils' 'git')
conflicts=('airgeddon-git')
provides=('airgeddon-git')
sha256sums=('SKIP')
arch=('any')

prepare() {
  if [ -d "$srcdir/$pkgname" ]; then
    rm -rf "$srcdir/$pkgname"
  fi

  mkdir -p "$srcdir/$pkgname"
  cd "$srcdir/$pkgname"
}

pkgver() {
  cd "$srcdir/$_pkgname"

  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"

  echo "   .-\"\"\"\"-."
  echo "  /        \\"
  echo " /_        _\\"
  echo "// \\      / \\\\"
  echo "|\\__\\    /__/|"
  echo " \\    ||    /"
  echo "  \\        /"
  echo "   \\  __  /"
  echo "    '.__.'"
  echo "     |  |"
  echo "     |  |"

  sed -i 's|auto_update=1|auto_update=0|' airgeddon.sh
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/airgeddon"

  install -Dm644 -t "$pkgdir/usr/share/doc/airgeddon/" README.md CHANGELOG.md
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/airgeddon/LICENSE.md"

  rm -rf *.md .git* binaries imgs Dockerfile pindb_checksum.txt

  cp -a --no-preserve=ownership * "$pkgdir/usr/share/airgeddon"

  cat > "$pkgdir/usr/bin/airgeddon" << EOF
#!/bin/sh
cd /usr/share/airgeddon
exec bash airgeddon.sh "\${@}"
EOF

  chmod a+x "$pkgdir/usr/bin/airgeddon"
}

# vim: ts=2 sw=2 et:
