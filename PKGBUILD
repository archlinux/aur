# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Adrián Pérez de Castro <adrian at perezdecastro dor org> PGP-Key: 91C559DBE4C9123B

pkgname=rkt
pkgver=0.16.0
pkgrel=2
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
depends=('glibc')
makedepends=('cpio' 'go' 'wget' 'squashfs-tools' 'perl-capture-tiny' \
  'intltool' 'gperf' 'git' 'libseccomp')
provides=('rkt')
replaces=('rocket')
conflicts=('rocket')
source=("https://github.com/coreos/rkt/archive/v${pkgver}.tar.gz")
sha256sums=('a828b1350535a34bff373b9e782b1dd0166d59b1c3d50ace808ded1ccdc4cf55')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --with-stage1-flavors=coreos \
    --with-stage1-default-location=/usr/lib/rkt/stage1.aci
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

  install -Dm644 "dist/bash_completion/rkt.bash" "${pkgdir}/usr/share/bash-completion/completions/rkt"

  cd "build-${pkgname}-${pkgver}"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 bin/stage1-coreos.aci "$pkgdir/usr/lib/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
