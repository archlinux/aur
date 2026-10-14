# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=3.3.21
_pkgrel=r9149_dad61a
pkgrel=1
pkgdesc="Linux client of Feilian (veCorpLink) from Bytedance."
arch=('x86_64')
url="https://www.volcengine.com/product/feilian"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'dnsmasq' 'iw' 'iproute2')
optdepends=('networkmanager: NetworkManager integration')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://cdn.isealsuite.com/linux/FeiLian_Linux_amd64_v${pkgver}_$_pkgrel.deb")
sha512sums=('d6ad5013ac3a6a7440db4f1555a964619679a5c40e4f9537b13c40ab8097da32b05667b206bf9f550ad7cfb2f6abccadbd67b11adbb46cbdfbe774aea15947f4')

package() {
  # Extract package data
  tar xpvf "${srcdir}/data.tar.xz" --xattrs-include='*' --no-same-owner -C "${pkgdir}"

  # Fix directory structure differences
  cd "${pkgdir}"
  mkdir -p usr/bin usr/lib/systemd/system
  ln -s /opt/apps/com.volcengine.feilian/files/corplink usr/bin/corplink
  mv "${pkgdir}"/opt/apps/com.volcengine.feilian/files/corplink.service usr/lib/systemd/system/corplink.service

  # The upstream unit starts after network.target, which can be reached before
  # NetworkManager has brought up an interface and configured DNS.  Wait for
  # network-online and a default route so the client initializes its connection
  # only after the host has usable network connectivity.
  sed -i \
    -e 's/^After=network.target$/After=network-online.target/' \
    -e '/^Description=/a Wants=network-online.target' \
    -e '/^\[Service\]$/a ExecStartPre=/usr/bin/sh -c "until /usr/bin/ip route show default | /usr/bin/grep -q default; do /usr/bin/sleep 1; done"' \
    usr/lib/systemd/system/corplink.service

  rm -r usr/local
}
