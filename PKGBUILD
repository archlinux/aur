# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Adrián Pérez de Castro <adrian at perezdecastro dor org> PGP-Key: 91C559DBE4C9123B

pkgname=rkt
pkgver=0.8.0
pkgrel=2
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
depends=('glibc')
makedepends=('cpio' 'go' 'wget' 'squashfs-tools' 'perl-capture-tiny')
provides=('rkt')
replaces=('rocket')
conflicts=('rocket')
source=("https://github.com/coreos/rkt/archive/v${pkgver}.tar.gz")
sha256sums=('c9eb0126b8ff2f059d7cedaab17ca73dce256f342092c9bf4a7ae20661f2a5aa')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --with-stage1=src \
    --with-stage1-image-path=/usr/share/rkt/stage1.aci \
    --with-functional-tests
  make -s
}

package() {
  cd "${pkgname}-${pkgver}"
  local unit
  for unit in rkt-gc.{timer,service} rkt-metadata.{socket,service}
  do
    install -Dm644 "dist/init/systemd/${unit}" \
      "${pkgdir}/usr/lib/systemd/system/${unit}"
  done

  cd "build-${pkgname}-${pkgver}"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm755 bin/actool "$pkgdir/usr/bin/actool"
  install -Dm644 bin/stage1.aci "$pkgdir/usr/share/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
