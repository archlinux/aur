# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Jesse Harjunpää <harjuje1@gmail.com>
# Contributor: Jens Adam <jra@byte.cx>

pkgname=bastet
pkgver=0.43.2
pkgrel=4
pkgdesc="Tetris(r) clone with 'bastard' block-choosing AI"
url="http://fph.altervista.org/prog/bastet.html"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('boost-libs' 'ncurses')
makedepends=('boost')
backup=('var/games/bastet.scores2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fph/bastet/archive/${pkgver}.tar.gz"
        "fix_build_new_boost.patch"
	"tmpfiles.conf"
	"sysusers.conf")
install=$pkgname.install
sha512sums=('e81ca8bf674b537b539b7f6b35b1233a714f03750ce1b3947f84e70ca5f98ed4583902e7b4800c5bdde66ee95a4ef8ed0f5854675c2d149cd26d2498dc187a41'
            'c6b65f3fd44eef43126b051990c2e0075f970c451f1d944d8a48f6f530bf792e875ac485dd3048d72433b636adc85bcb36f798d9b001021a2c3a4e39894f972e'
            '8aa5d06313a5bc072449cf5b04298d98086403649aa84e335fa33775c71afc798f0f5ca2fa6b2c4644273b4750022584b8944b86d86c8c2fa820df6d666c4b38'
            'd1780270f4548cb1b22f7174fb1fe7a6cbabb37129264c14a003841a957f92f3a4b1a49068feae3c5592d1d8a8999f4ee0e2fbedf57b7f3b12b542853c7f428b')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}"/fix_build_new_boost.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  # populate files
  install -Dm755 bastet "${pkgdir}"/usr/bin/bastet
  install -Dm644 bastet.6 "${pkgdir}"/usr/share/man/man6/bastet.6
  install -Dm644 bastet.png "${pkgdir}"/usr/share/pixmaps/bastet.png
  install -Dm644 bastet.desktop "${pkgdir}"/usr/share/applications/bastet.desktop
  install -Dm644 bastet.appdata.xml "${pkgdir}"/usr/share/appdata/bastet.appdata.xml
  for F in AUTHORS INSTALL NEWS README; do
    install -Dm644 ${F} "${pkgdir}/usr/share/doc/${pkgname}/${F}"
  done

  # prepare the (optional) global highscore file
  # (users need to be in 'games' group, obviously)
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
