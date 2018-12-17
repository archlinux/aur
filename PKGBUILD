# Maintainer: no one
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: xduugu
# Contributor: nh2
# Contributor: Steven Davidovitz <steviedizzle ð gmail đ com>
# Contributor: Nick B <Shirakawasuna ð gmail đ com>
# Contributor: Christof Musik <christof ð senfdax đ de>
# Contributor: Stefan Rupp <archlinux ð stefanrupp đ de>
# Contributor: Ignas Anikevicius <anikevicius ð gmail đ com>

pkgname=tp_smapi-ck
pkgver=0.43
pkgrel=1
pkgdesc="Modules for ThinkPad's SMAPI functionality for ck kernel"
arch=('x86_64')
url='https://github.com/evgeni/tp_smapi'
license=('GPL')
depends=('linux-ck>=4.19' 'linux-ck<4.20')
makedepends=('linux-ck-headers' 'git')
_extradir=/usr/lib/modules/extramodules-ck
_commit=a63729ab30d85430048f65c37f29188ab484cd52  # tags/tp-smapi/0.43
source=("git+https://github.com/evgeni/tp_smapi#commit=$_commit")
sha256sums=('SKIP')
provides=('tp_smapi')

pkgver() {
  cd "${pkgname%-*}"
  git describe --tags | sed 's/^tp-smapi\///;s/-/+/g'
}

build() {
  cd "${pkgname%-*}"

  # https://bugs.archlinux.org/task/54975 (kernel has no _GLOBAL_OFFSET_TABLE_):
  # Clear EXTRA_CFLAGS since it defaults to injecting CFLAGS and -fno-plt breaks the modules

  make HDAPS=1 KVER="$(<$_extradir/version)" EXTRA_CFLAGS=
}

package() {
  cd "${pkgname%-*}"

  # install kernel modules
  find . -name "*.ko" -exec install -Dt "$pkgdir$_extradir" {} +

  # compress kernel modules
  find "$pkgdir" -name "*.ko" -exec chmod 644 {} +
  find "$pkgdir" -name "*.ko" -exec xz {} +

  # load module on startup
  echo tp_smapi | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgname.conf"
}
