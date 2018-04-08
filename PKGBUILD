# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Po-An,Yang(Antonio) <yanganto gmail.com>

# Todo: If there'a any files left in they cache they should probably be deleted on uninstall
# Todo: Can we build the source code?

set -u
pkgname='networkminer'
pkgver='2.3'
pkgrel='1'
pkgdesc='A Network Forensic Analysis Tool for advanced Network Traffic Analysis, sniffer and packet analyzer'
arch=('any')
url='http://www.netresec.com/'
license=('GPL2')
depends=('mono')
_verwatch=('http://www.netresec.com/?page=NetworkMiner' '\s\+<[nt][a-z]\+>NetworkMiner\s\([0-9][^<]\+\)</[a-z]\+>.*' 'f')
_srcname="NetworkMiner_${pkgver//\./-}"
source=("${_srcname}.zip::https://www.netresec.com/?download=NetworkMiner")
sha256sums=('6bdca02443beceb1d57750eb63c239f73a6f5c7dd70e9d0f76129e85b25eb77a')

package() {
  set -u
  install -d "${pkgdir}/opt/"
  mv "${srcdir}/${_srcname}" "${pkgdir}/opt/NetworkMiner"
  #chmod +x "${pkgdir}/opt/NetworkMiner/NetworkMiner.exe"
  chmod -R go+w "${pkgdir}/opt/NetworkMiner/AssembledFiles/" "${pkgdir}/opt/NetworkMiner/Captures/"

  # Launcher
  install -Dm755 <(cat << EOF
#!/bin/sh
mono /opt/NetworkMiner/NetworkMiner.exe
EOF
  ) "${pkgdir}/usr/bin/Networkminer.sh"

  # Desktop file for config tool
  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Network Miner
GenericName=Packet analyser
Comment=NetworkMiner packet analyser
Exec=Networkminer.sh
Terminal=false
Type=Application
#Icon=
Categories=Application;Utility;
MimeType=application/x-executable
EOF
  ) "${pkgdir}/usr/share/applications/NetworkMiner.desktop"
  set +u
}
set +u
