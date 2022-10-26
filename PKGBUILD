# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Evgeny Kurnevsky <kurnevsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=motion-git
pkgver=4.4.0.r44.db94a89
pkgrel=1
pkgdesc="Monitor and record video signals from many types of cameras"
arch=('x86_64')
license=('GPL')
url="https://motion-project.github.io"
conflicts=(motion)
depends=('sqlite' 'ffmpeg' 'libmicrohttpd' 'libwebp' 'mariadb-libs')
makedepends=(git)
optdepends=('gettext: native language support')
backup=('etc/motion/motion.conf')
source=("git+https://github.com/Motion-Project/motion.git"
        'motion.service'
        'motion.sysusers'
        'motion.tmpfiles')
b2sums=('SKIP'
        'c66ca8a7723b78f05cf4750377276891cb6025a74ec33960ccaa3939a25edb6eca713d36ded94d20db70cd1bd6694629eb6d43ba63e8165be145bb9d6a668771'
        'e923b20ceb893fb52cffc530f3d777ccbaffd7aef447f368a6a83b73043795acfb6a26da0bcdeb695a3b356baebe9ad89ea9aabd27e986c482dcd71670957a84'
        '3f39854b561200ad052529f187a83f135be3ca4ea20e9897fe41fbae7ed898850017bdd496996199afc00f151a2302314aef8c2f6847337cf1b8e8e7579be4e7')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/release-//g;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd ${pkgname%-git}
  autoreconf -fi
  ./configure --prefix=/usr \
    --without-pgsql \
    --without-mysql \
    --sysconfdir=/etc \
    --with-ffmpeg \
    --with-webp
  make
}

package(){
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  install -Dm644 data/motion-dist.conf "$pkgdir"/etc/motion/motion.conf
  install -Dm644 "$srcdir"/motion.service "$pkgdir"/usr/lib/systemd/system/motion.service
  install -Dm644 "$srcdir"/motion.sysusers "$pkgdir"/usr/lib/sysusers.d/motion.conf
  install -Dm644 "$srcdir"/motion.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/motion.conf
}
