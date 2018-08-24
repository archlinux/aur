# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi-lts
_pkgname=tp-smapi
pkgver=0.42
_extradir=/usr/lib/modules/extramodules-4.14-lts
pkgrel=39
pkgdesc="Modules for ThinkPad's SMAPI functionality"
arch=('x86_64')
url='https://github.com/evgeni/tp_smapi'
license=('GPL')
depends=('linux-lts>=4.14.67' 'linux-lts<4.15')
makedepends=('linux-lts-headers>=4.14.67' 'linux-lts-headers<4.15')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/evgeni/${pkgname/-lts/}/archive/$_pkgname/$pkgver.tar.gz")
md5sums=('6a51d3aa459ad7a6ebfbb8c29527b3ee')

build() {
  cd ${pkgname/-lts/}-$_pkgname-$pkgver

  # https://bugs.archlinux.org/task/54975 (kernel has no _GLOBAL_OFFSET_TABLE_):
  # Clear EXTRA_CFLAGS since it defaults to injecting CFLAGS and -fno-plt breaks the modules

  make HDAPS=1 KVER="$(<$_extradir/version)" EXTRA_CFLAGS=
}

package() {
  cd ${pkgname/-lts/}-$_pkgname-$pkgver

  # install kernel modules
  find . -name "*.ko" -exec install -Dt "$pkgdir$_extradir" {} +

  # compress kernel modules
  find "$pkgdir" -name "*.ko" -exec gzip -n -9 {} +

  # load module on startup
  echo tp_smapi | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
