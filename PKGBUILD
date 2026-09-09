# Maintainer: Jat <chat@jat.email>

pkgname=corplink-bin
pkgver=3.2.16
_pkgrel=r8362_0d182a
pkgrel=2
pkgdesc="Linux client of Feilian (veCorpLink) from Bytedance."
arch=('x86_64')
url="https://www.volcengine.com/product/feilian"
license=('unknown')
depends=('gtk3' 'libxss' 'nss' 'dnsmasq' 'iw' 'iproute2')
optdepends=('networkmanager: NetworkManager integration')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://cdn.isealsuite.com/linux/FeiLian_Linux_amd64_v${pkgver}_$_pkgrel.deb")
sha512sums=('129731f371215d1ef2f15a7746c7bd16404e1e4ba287d5f238d1bc240e3b279214e3b15a6468d674b0127f533e03a31e496e1ed301701075ca4320a1c7016e1e')

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
