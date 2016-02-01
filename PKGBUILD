# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Adrián Pérez de Castro <adrian at perezdecastro dor org> PGP-Key: 91C559DBE4C9123B
# Contributor: Boohbah <boohbah at gmail dot com>

pkgname=rkt-git
pkgver=0.16.0.r92.gfedaf31
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
makedepends=('cpio' 'go' 'wget' 'squashfs-tools' 'perl-capture-tiny' 'intltool' 'bc')
provides=('rkt')
replaces=('rocket' 'rkt')
conflicts=('rocket' 'rkt')
source=("$pkgname::git+$url")
md5sums=('SKIP')
install="rkt.install"

pkgver() {
  cd "$pkgname"
  git describe --long | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  ./autogen.sh
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr \
      --with-stage1-flavors=coreos \
      --with-stage1-default-location=/usr/lib/rkt/stage1.aci
  make -s
}

package() {
  cd "${pkgname}"
  local unit
  for unit in rkt-gc.{timer,service} rkt-metadata.{socket,service}
  do
    install -Dm644 "dist/init/systemd/${unit}" \
      "${pkgdir}/usr/lib/systemd/system/${unit}"
  done

  install -Dm644 "dist/bash_completion/rkt.bash" "${pkgdir}/usr/share/bash-completion/completions/rkt"

  cd build-rkt-*+git
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm644 bin/stage1-coreos.aci "$pkgdir/usr/lib/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
