# Contributor: wido <widomaker2k7@gmail.com>
# Contributor: SakalisC <chrissakalis (gmail)>
# Maintainer: SanskritFritz (gmail)

pkgname=logkeys-git
_gitname="logkeys"
pkgver=r62.c0a2971
epoch=1
pkgrel=1
pkgdesc="Simple keylogger supporting also USB keyboards."
license=('GPLv3')
arch=('i686' 'x86_64')
makedepends=('git')
conflicts=('logkeys')
provides=('logkeys')
url="https://github.com/kernc/logkeys"
install=logkeys.install
backup=('etc/conf.d/logkeysd')
source=("logkeysd.conf" "logkeys.service"
        "$_gitname::git+https://github.com/kernc/logkeys")

md5sums=('c05608a47e303e8f604f46d1ed22aa4a'
         'bd70a5e5601168bbf7bf7f91ee530d14'
         'SKIP')

pkgver() {
	cd "$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"
	./autogen.sh
	cd "build"
	../configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$_gitname/build"
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install

	install -Dm0644 "$srcdir/logkeysd.conf" "$pkgdir/etc/conf.d/logkeysd"
	install -Dm0644 "$srcdir/logkeys.service" "$pkgdir/usr/lib/systemd/system/logkeys.service"

	cd "../keymaps"
	for filename in $(ls *.map); do
		install -D -m 644 "${filename}" "${pkgdir}/usr/share/lkmaps/${filename}"
	done
}
