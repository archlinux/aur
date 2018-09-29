# Maintainer: Saren Arterius <saren@wtako.net>

# Upstream package
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
# Contributor: nofxx <x@nofxx.com>

pkgname=iodine-frekky
_pkgname=iodine
pkgver=62e3437
pkgrel=1
epoch=1
pkgdesc='Tunnel IPv4 data through a DNS server | iodine fork to improve performance and add features'
arch=('x86_64')
url='http://code.kryo.se/iodine'
license=('custom:ISC')
depends=('zlib' 'net-tools')
provides=(iodine)
conflicts=(iodine)
backup=('etc/conf.d/iodined')
source=("git+https://github.com/frekky/iodine.git#commit=62e3437c6ec501a23b1a64f19a9c376a83596623"
        'iodined.service'
        'iodined.conf.d')
sha256sums=('SKIP'
            '4019f95432c7b272b96c80a112abd56f4c308bfab4cc920525880c30f417cb84'
            '47e710954cdf68b4c2f66cac367c2bf4e750f682cd393001b8da67da1cdee54b')

pkgver() {
  cd $_pkgname
  git describe --tags --always
}

prepare() {
  cd $_pkgname
  # sed -e 's/-lsystemd-daemon/-lsystemd/' -i src/osflags
}

build() {
  cd ${_pkgname}
  autoreconf --install
  ./configure
  make -j$(nproc)
}

package() {
  cd ${_pkgname}

  make prefix=/usr sbindir=/usr/bin DESTDIR="${pkgdir}" install
  install -d "${pkgdir}/usr/share/licenses/iodine"
  sed -n '/AUTHORS & LICENSE/,$p' README.md > "${pkgdir}/usr/share/licenses/iodine/LICENSE"

  install -Dm644 "$srcdir/iodined.service" "$pkgdir/usr/lib/systemd/system/iodined.service"
  install -Dm644 "$srcdir/iodined.conf.d" "$pkgdir/etc/conf.d/iodined"
}

