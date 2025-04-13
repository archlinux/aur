# Maintainer: fossdd <fossdd@pwned.life
# Contributor: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>
pkgname=invidious
pkgver=2.20250314.0
pkgrel=1
pkgdesc="Alternative front-end to YouTube"
arch=('x86_64' 'aarch64')
url="https://github.com/iv-org/invidious"
license=('AGPL')
# Not all deps are explicitly listed on invidious website,
# but resulting binary is somehow linked against them
depends=('gc' 'gcc-libs' 'glibc' 'icu' 'libevent' 'libxml2' 'libyaml' 'openssl' 'pcre' 'sqlite' 'xz' 'zlib' 'librsvg' 'tzdata')
makedepends=('crystal' 'shards' 'git')
optdepends=('postgresql: Database, not needed if remote')
conflicts=('invidious-git')
backup=('etc/invidious.yml')
source=("git+https://github.com/iv-org/invidious.git#tag=v$pkgver"
	"invidious.sysusers")
md5sums=('6b110b30a10a3ab9afb25a3257ab36ea'
         '8f516eaa2a60660fb65a1de3412ad785')

prepare() {
	# Installing to /home is unfunny joke
	sed -i -e 's/home\/invidious/usr\/lib/' -e 's/-o.*$//' \
		 "$srcdir/invidious/invidious.service"
}

build() {
	cd "invidious"
	shards install --production
	crystal build --release src/invidious.cr
}

package() {
	install -d "$pkgdir"/{usr/lib/invidious,etc}

	cp -r "$srcdir/invidious/"{invidious,locales,config,assets} \
		 "$pkgdir/usr/lib/invidious/"
	install -Dm 644 "$srcdir/invidious/invidious.service" "$pkgdir/usr/lib/systemd/system/invidious.service"
	install -Dm 644 "$srcdir/invidious.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	mv "$pkgdir/usr/lib/invidious/config/config.example.yml" "$pkgdir/etc/invidious.yml"

	ln -s /etc/invidious.yml "$pkgdir/usr/lib/invidious/config/config.yml"
}
