# Maintainer: Carlo Wood <carlo@alinoe.com>

pkgname=systemd-netns-git
pkgver=r75.61ef953
pkgrel=1
pkgdesc="Configure private netns with systemd services."
arch=('any')
options=(!debug)
url="https://github.com/CarloWood/systemd-netns.git"
license=('GPL3')
depends=('systemd' 'iproute2' 'nftables')
backup=(
  'etc/conf.d/netns/default.conf'
  'etc/conf.d/netns/veth.conf'
  'etc/conf.d/netns/macvlan.conf'
  'etc/conf.d/netns/veth-nstest.conf'
  'etc/conf.d/netns/nft.rules'
)
source=("$pkgname::git+$url"
        "$pkgname.install")
sha256sums=('SKIP' 'b76357531f51a2d6db3692fdebb9df1a5c58e2834a8d7f7e963a2ea53abc9427')
install="${pkgname}.install"
conflicts=('systemd-named-netns' 'systemd-netns')
provides=(systemd-netns=${pkgver%+*})

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$pkgname"
  install -d "${pkgdir}"/usr/lib/systemd/system "${pkgdir}"/etc/conf.d/netns "${pkgdir}"/usr/bin
  make DESTDIR="${pkgdir}" BINDIR="/usr/bin" install
}
