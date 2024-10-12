# Maintainer: Neboer <rubinposter@gmail.com>
pkgname=dns2hostssyncer-git
pkgver=2.3
pkgrel=2
pkgdesc="A tool to sync DNS records with the hosts file using PowerDNS Admin API"
arch=('x86_64')
url="https://github.com/Neboer/DNS2HostsSyncer"
license=('MIT')
depends=('nlohmann-json' 'spdlog' 'argparse' 'curl')
makedepends=('meson' 'ninja')
provides=("dns2hostssyncer")
conflicts=("dns2hostssyncer")

_gitname="DNS2HostsSyncer"
source=("$_gitname::git+$url")
sha256sums=(SKIP)
backup=('etc/d2hs/d2hs.json')

pkgver() {
	cd "$srcdir/$_gitname"
	local v
        v="$(git describe --tags)"
	v="${v#v}"
	printf %s "${v//-/+}"
}

build() {
  cd "$srcdir/$_gitname"
  meson setup builddir
  meson compile -C builddir
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="$pkgdir" meson install -C builddir
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
