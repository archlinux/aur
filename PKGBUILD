# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi-lts
pkgver=0.43
pkgrel=299
pkgdesc="Modules for ThinkPad's SMAPI functionality"
arch=('x86_64')
url='https://github.com/evgeni/tp_smapi'
license=('GPL')
makedepends=('linux-lts-headers' 'git')
_commit=a63729ab30d85430048f65c37f29188ab484cd52  # tags/tp-smapi/0.43
source=("git+https://github.com/evgeni/tp_smapi#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd tp_smapi
  git describe --tags | sed 's/^tp-smapi\///;s/-/+/g'
}

build() {
  cd tp_smapi

  # https://bugs.archlinux.org/task/54975 (kernel has no _GLOBAL_OFFSET_TABLE_):
  # Clear EXTRA_CFLAGS since it defaults to injecting CFLAGS and -fno-plt breaks the modules

  make HDAPS=1 KVER="$(</usr/src/linux-lts/version)" EXTRA_CFLAGS=
}

package() {
  depends=('linux-lts')

  local extradir=/usr/lib/modules/$(</usr/src/linux-lts/version)/extramodules
  cd tp_smapi

  # install kernel modules
  find . -name "*.ko" -exec install -Dt "$pkgdir$extradir" {} +

  # compress kernel modules
  find "$pkgdir" -name "*.ko" -exec xz {} +

  # load module on startup
  echo tp_smapi | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
