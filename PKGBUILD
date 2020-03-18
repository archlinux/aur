# Maintainer: Sotirios M. Roussis (xToNouSou) <xtonousou@gmail.com>
# Co-Maintainer: Oscar Alfonso Diaz (OscarAkaElvis) <oscar.alfonso.diaz@gmail.com>

_pkgname=airgeddon
pkgname=$_pkgname-git
pkgver=r2114.294164f
pkgrel=1
pkgdesc='Multi-use bash script for Linux systems to audit wireless networks'
url='https://github.com/v1s1t0r1sh3r3/airgeddon'
license=('GPL3')
source=('git://github.com/v1s1t0r1sh3r3/airgeddon.git#branch=master')
depends=(
  'aircrack-ng' 'bash>=4.2' 'coreutils'
  'gawk' 'iproute2' 'iw'
  'sed' 'xterm' 'tmux'
  'pciutils' 'procps-ng'
)
optdepends=(
  'asleap: Actively recover LEAP/PPTP passwords'
  'bettercap: Complete, modular, portable and easily extensible MITM framework'
  'bully: Retrieve WPA/WPA2 passphrase from a WPS enabled access point'
  'ccze: Robust and modular log colorizer with many plugins'
  'crunch: A wordlist generator where you can specify a standard character set or a character set you specify and generate all possible combinations and permutations'
  'curl: An URL retrieval utility and library'
  'dhcp: A DHCP server, client, and relay agent'
  'dsniff: Collection of tools for network auditing and penetration testing'
  'ethtool: Utility for controlling network drivers and hardware'
  'ettercap: A network sniffer/interceptor/logger for ethernet LANs'
  'hashcat: Multithreaded advanced password recovery utility'
  'hcxdumptool: Small tool to capture packets from wlan devices'
  'hcxtools: Small set of tools convert packets from captures for the use with latest hashcat or John the Ripper'
  'hostapd: IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator'
  'hostapd-wpe: Modified hostapd to facilitate AP impersonation attacks'
  'john: John the Ripper password cracker'
  'iptables: Linux kernel packet control tool'
  'lighttpd: A secure, fast, compliant and very flexible web-server'
  'mdk3: WLAN penetration tool'
  'mdk4: WLAN penetration tool'
  'nftables: This software provides an in-kernel packet classification framework'
  'openssl: The Open Source toolkit for Secure Sockets Layer and Transport Layer Security'
  'pixiewps: Offline bruteforce of the WPS pin exploiting the low or non-existing entropy of some APs'
  'reaver: Brute force attack against Wifi Protected Setup'
  'rfkill: Tool for enabling and disabling wireless devices'
  'sslstrip: Python tool to hijack HTTPS connections during a MITM attack'
  'usbutils: USB Device Utilities'
  'wget: A network utility to retrieve files from the Web'
  'xorg-xdpyinfo: Display information utility for X'
  'xorg-xset: User preference utility for X'
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
  sed -i 's|AIRGEDDON_AUTO_UPDATE=true|AIRGEDDON_AUTO_UPDATE=false|' .airgeddonrc
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/airgeddon"

  install -Dm644 -t "$pkgdir/usr/share/doc/airgeddon/" README.md CHANGELOG.md CONTRIBUTING.md CODE_OF_CONDUCT.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/airgeddon/LICENSE"

  rm -rf *.md .git* .editor* binaries imgs Dockerfile pindb_checksum.txt

  cp -a --no-preserve=ownership * "$pkgdir/usr/share/airgeddon"
  cp -a --no-preserve=ownership .airgeddonrc "$pkgdir/usr/share/airgeddon"

  cat > "$pkgdir/usr/bin/airgeddon" << EOF
#!/bin/sh
cd /usr/share/airgeddon
exec bash airgeddon.sh "\${@}"
EOF

  chmod a+x "$pkgdir/usr/bin/airgeddon"
}

# vim: ts=2 sw=2 et:
