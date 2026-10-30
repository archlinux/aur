# Maintainer: vyzu <vyzu@vyzu.net>
# Contributor: fossdd <fossdd@pwned.life
# Contributor: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=invidious
pkgver=2.20261022.0
pkgrel=1
pkgdesc="Alternative front-end to YouTube"
arch=('x86_64' 'aarch64')
url="https://github.com/iv-org/invidious"
license=('AGPL-3.0-only')
# Not all deps are explicitly listed on invidious website,
# but resulting binary is somehow linked against them
depends=('gc' 'gcc-libs' 'glibc' 'icu' 'libevent' 'libxml2' 'libyaml' 'openssl' 'pcre' 'sqlite' 'xz' 'zlib' 'librsvg' 'tzdata')
makedepends=('crystal' 'shards' 'git')
optdepends=('postgresql: Database, not needed if remote')
conflicts=('invidious-git')
backup=('etc/invidious.yml')
source_x86_64=(https://github.com/iv-org/invidious/archive/refs/tags/v$pkgver.tar.gz
	"invidious.sysusers"
)
sha512sums_x86_64=(
	 4ac401f7641df65dcd28b71ad59c144f4aedec43871bb351d0042c8ebc5bc575566538d1b225a366f1460d83e50875c0f7cab0ec312e5026ad213be88efe4fd7
         3264d23c374ce3fa59e2c97c0db5c9a4ce860ebaf44c21e83922054d1da60415cb8a41e8fa24111204f30f11ac44cc7ba6e27f229d81f9d6ab1381867e03c1d6
 )

prepare() {
	# Installing to /home is unfunny joke
	sed -i -e 's/home\/invidious/usr\/lib/' -e 's/-o.*$//' \
		 "$srcdir/invidious-$pkgver/invidious.service"
}

build() {
	cd "invidious-$pkgver"
	shards install --production
	crystal build --release src/invidious.cr
}

package() {
	install -d "$pkgdir"/{usr/lib/invidious,etc}

	cp -r "$srcdir/invidious-$pkgver/"{invidious,locales,config,assets} \
		 "$pkgdir/usr/lib/invidious/"
	install -Dm 644 "$srcdir/invidious-$pkgver/invidious.service" "$pkgdir/usr/lib/systemd/system/invidious.service"
	install -Dm 644 "$srcdir/invidious.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	mv "$pkgdir/usr/lib/invidious/config/config.example.yml" "$pkgdir/etc/invidious.yml"

	ln -s /etc/invidious.yml "$pkgdir/usr/lib/invidious/config/config.yml"
}
