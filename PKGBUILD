# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=FatFrog
pkgname=fatfrog.lv2
pkgver=1.0
pkgrel=3
pkgdesc='A high gain valve amplifier simulation LV2 plugin'
arch=(aarch64 x86_64)
url="https://github.com/brummer10/$_name.lv2"
license=(custom:0BSD)
groups=(lv2-plugins pro-audio)
depends=(cairo gcc-libs libx11)
makedepends=(lv2)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 plugin')
source=("https://github.com/brummer10/$_name.lv2/releases/download/v$pkgver/${_name}_$pkgver.tar.gz"
        'fatfrog-fix-ttl.diff::https://github.com/brummer10/FatFrog.lv2/commit/cb4c537171dc30f88cda0311d8c7944971d2ea4c.diff')
sha256sums=('29e2ae9588d403af4e05b27fc84fae77fa80aeb69d10ac725e0ee48b76009b46'
            'ebb21cc909227472fe63c6f466d380a65f550a2b032ec36ddc0fcafcbb80c501')

build() {
  cd ${_name}_$pkgver
  make
}

prepare() {
  cd ${_name}_$pkgver
  patch -p1 -N -r - -i "$srcdir"/fatfrog-fix-ttl.diff
}

check() {
  cd ${_name}_$pkgver
  mkdir -p lv2
  ln -sf ../$_name/$_name.lv2 lv2/$_name.lv2
  LV2_PATH="$PWD/lv2:/usr/lib/lv2" lv2lint -M pack "https://github.com/brummer10/$_name#_${_name}_"
}

package() {
  cd ${_name}_$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 README.md $_name.png -t "$pkgdir"/usr/share/doc/$pkgname
}
