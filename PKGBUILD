# Maintainer: libele <libele@disroot.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: xaw <xawl.ch@gmail.com>

pkgname=cwm
pkgver=7.1
pkgrel=3
pkgdesc="Fork of calmwm, a clean and lightweight window manager"
arch=('aarch64' 'x86_64')
url="https://github.com/leahneukirchen/cwm"
license=('BSD')
depends=('libxft' 'libxrandr')
changelog=cwm.changelog
source=("https://leahneukirchen.org/releases/cwm-${pkgver}.tar.gz"{,.asc}
	'fix-overlapping-menu-items.diff::https://github.com/leahneukirchen/cwm/commit/4a6128d5e461515b87da0dabf31dd1c7288b26db.diff'
	'fix-semi-transparency.diff::https://github.com/leahneukirchen/cwm/commit/9eb763ab8781610b67df44b9914a018d32dfe1fe.diff'
	'cwm.desktop')
sha256sums=('4a58c5cb4312d8d0f03ba657d7656c12d8d7c1277aeb1c05272984501597bd90'
            'SKIP'
            'a2ec87bb407cbe5adeff60700af7fea264a83f92c7baebdefe85fc3246fb5d50'
	    '28055e84b5de69b9a4913ca4ac7576ca05925baf7190c8e1f34afed7c86f92b6'
            'SKIP')
validpgpkeys=('E6F6848A1B95EE313CF5B7EE95FF633C90A8F025') # Leah Neukirchen <leah@vuxu.org>

prepare() {
  cd $pkgname-$pkgver
  patch -u -p 1 -l <../fix-overlapping-menu-items.diff
  # https://marc.info/?l=openbsd-misc&m=167896796615081&w=2
  patch -u -p 1 -l <../fix-semi-transparency.diff
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "${srcdir}/cwm.desktop" "${pkgdir}/usr/share/xsessions/cwm.desktop"
  install -Dm644 <(sed -n '/Copyright/,/PERFORMANCE/p' <calmwm.c) "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
