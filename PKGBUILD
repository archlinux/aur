# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Adrián Pérez de Castro <adrian at perezdecastro dor org> PGP-Key: 91C559DBE4C9123B
# Contributor: Carl George <arch at cgtx dot us> PGP-Key: 4BA2F7E101D9F512

pkgname=rkt
pkgver=1.4.0
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
depends=('glibc' 'openssl' 'zlib')
makedepends=('cpio' 'git' 'go' 'squashfs-tools' 'wget')
provides=('rkt')
replaces=('rocket')
conflicts=('rocket')
source=("https://github.com/coreos/rkt/archive/v${pkgver}.tar.gz"
        "rkt.sysusers")
sha256sums=('1ce98ff74aef3dc2c43025f2b458e6dbfeb6c7f756a313f4ecc2827fc84ce031'
            '1ad8d343191be731289577d249a2467fbe5a69949117601e760b459f599d311f')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --enable-tpm=auto \
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

  install -Dm644 "dist/init/systemd/tmpfiles.d/rkt.conf" "${pkgdir}/usr/lib/tmpfiles.d/rkt.conf"
  install -Dm644 "${srcdir}/rkt.sysusers" "${pkgdir}/usr/lib/sysusers.d/rkt.conf"
  install -Dm644 "dist/bash_completion/rkt.bash" "${pkgdir}/usr/share/bash-completion/completions/rkt"

  cd "build-${pkgname}-${pkgver}"
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 bin/stage1-coreos.aci "$pkgdir/usr/lib/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
