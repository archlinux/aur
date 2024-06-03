# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mrxx <mrxx at cyberhome dot at>
# Contributor: Evgeny Kurnevsky <kurnevsky@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=motion-git
pkgver=4.6.0.r11.629b3ba
pkgrel=2
pkgdesc='Monitor and record video signals from many types of cameras'
arch=(x86_64)
license=(GPL-2.0-or-later)
url='https://motion-project.github.io'
conflicts=(motion)
provides=(motion)
depends=(glibc libjpeg-turbo sqlite ffmpeg libmicrohttpd libwebp mariadb-libs)
makedepends=(git)
optdepends=('gettext: native language support')
backup=('etc/motion/motion.conf')
source=("git+https://github.com/Motion-Project/motion.git"
        ${pkgname%-git}.{service,sysusers,tmpfiles})
b2sums=('SKIP'
        'f2ecae6cdf3e650edca4b69c859c9f16b1a8541d94a880cb29a73237a2b1abd65d3e20ca701603c250d96564294c6967d6bfe917e0aa9aface0c0b41fe65d90f'
        'e923b20ceb893fb52cffc530f3d777ccbaffd7aef447f368a6a83b73043795acfb6a26da0bcdeb695a3b356baebe9ad89ea9aabd27e986c482dcd71670957a84'
        '3f39854b561200ad052529f187a83f135be3ca4ea20e9897fe41fbae7ed898850017bdd496996199afc00f151a2302314aef8c2f6847337cf1b8e8e7579be4e7')

pkgver() {
	cd ${pkgname%-git}
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
  install -Dm644 ../motion.service "$pkgdir"/usr/lib/systemd/system/motion.service
  install -Dm644 ../motion.sysusers "$pkgdir"/usr/lib/sysusers.d/motion.conf
  install -Dm644 ../motion.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/motion.conf
}

# vim:set ts=2 sw=2 et:
