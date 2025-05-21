# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: David Runge <dvzrv@archlinux.org>

_pkgname=liquidsfz
pkgname="$_pkgname-git"
pkgver=0.3.2.r720.2fc0713
pkgrel=1
pkgdesc='SFZ Sampler (git version)'
arch=(x86_64)
url='https://github.com/swesterfeld/liquidsfz'
license=(MPL-2.0)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(lv2 libjack.so libsndfile readline)
checkdepends=(lv2lint)
optdepends=(
  'libjack.so: for standalone application'
  'lv2-host: for loading the LV2 plugin'
)
provides=(lib$_pkgname $_pkgname $_pkgname-lv2 $_pkgname-standalone)
conflicts=(lib$_pkgname $_pkgname $_pkgname-lv2 $_pkgname-standalone)
source=("$_pkgname::git+https://github.com/swesterfeld/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=`grep ^AC_INIT configure.ac | sed -E 's/[^0-9]*([0-9]+\.[0-9]+\.[0-9]+).*/\1/'`
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --enable-shared
  make
}

check() {
  cd $_pkgname
  make -k check

  local lv2specs=(
    atom buf-size core data-access dynmanifest event instance-access log midi
    morph options parameters patch port-groups port-props resize-port schemas
    state time ui units uri-map urid worker)

  mkdir -p .lv2/$_pkgname.lv2
  cp lv2/*.{so,ttl} .lv2/$_pkgname.lv2

  for spec in ${lv2specs[@]}; do
    ln -sf /usr/lib/lv2/$spec.lv2 .lv2
  done

  LV2_PATH="${PWD}/.lv2" lv2lint "http://spectmorph.org/plugins/liquidsfz"
}

package() {
  depends+=(libreadline.so libsndfile.so)
  provides+=(lib$_pkgname.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -vDm 644 {NEWS,TODO,{OPCODES,README}.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
