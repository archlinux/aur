# Maintainer: PoroCYon <qpspdzpo@pqfonbjmcny.psh>
# easy-to-break caesar cipher,  ^
# but tends to keep crawlers out

pkgname=zifd-git
pkgver=v0.5.0.r8.gb953c46
pkgrel=1
pkgdesc="Decentralised BitTorrent index - daemon (git version)"
arch=('x86_64' 'i686' 'armv6h')
url="https://github.com/zif/zif"
license=('AGPL3')
depends=()
makedepends=('go' 'make')
optdepends=('tor: tunnel traffic through tor'
            'systemd: service files'
            'glibc: to make namcap happy')
groups=('zif')
provides=('zifd')
conflicts=('zifd')
backup=('etc/zif/zifd.toml' 'etc/zif/tor/torrc')
install=zifd.install
source=("git+https://github.com/zif/zif"
        "fix-relative-file-paths.patch"
        "zifd.install"
        "zifd.service")
sha512sums=('SKIP'
            'fa3214126beec73ed4e7767baa7b8543d3ab52f3ea651ba096c2194db2597d5bce17310d5d11429722c8f03996bd52ee760c35c08c123283e88ccea29b33206b'
            '009bf7dd8fd07d2398ad20e6e4ef6ef3ada3c3524f1688fd425999836aa8fa7b04a51e9ea59f0dafa0cf4d70dc8ee36b3a4c2b4a92d203a79387ba8a6a2848ef'
            '18eddb08fc97c04789ccf1e2c392185c7e87df933b622d48a6f1116d008ceb99274b62c706950107ca48da20022fd267667007d7543f8aafcc00f8fb4f0e8430')

pkgver() {
	cd "zif"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "zif"
	patch -p1 -i "$srcdir/fix-relative-file-paths.patch"
}

build() {
	cd "zif"
	make -j$(nproc)
}

package() {
	#cd "zif"

	install -D -m755 ./zif/bin/zifd $pkgdir/usr/bin/zifd
	install -D -m644 ./zifd.service $pkgdir/usr/lib/systemd/system/zifd.service
	install -D -m600 ./zif/config/zifd.toml $pkgdir/etc/zif/zifd.toml
	install -D -m600 ./zif/tor/torrc $pkgdir/etc/zif/tor/torrc
}

