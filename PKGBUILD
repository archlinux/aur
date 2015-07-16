# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F
# Contributor: Kenny Rasschaert <kenny dot rasschaert at gmail dot com> PGP-Key: 1F70454121E41419
# Contributor: Adrián Pérez de Castro <adrian at perezdecastro dor org> PGP-Key: 91C559DBE4C9123B
# Contributor: Boohbah <boohbah at gmail dot com>

pkgname=rkt-git
pkgver=0.7.0.r47.gfd6e630
pkgrel=1
pkgdesc="App container runtime"
arch=('x86_64')
url="https://github.com/coreos/rkt"
license=(apache)
makedepends=('cpio' 'go' 'squashfs-tools' 'perl-capture-tiny')
provides=('rkt')
replaces=('rocket' 'rkt')
conflicts=('rocket' 'rkt')
source=("$pkgname::git+$url")
md5sums=('SKIP')

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
    --with-stage1=coreos \
    --with-stage1-image-path=/usr/share/rkt/stage1.aci
  make -s
}

package() {
  cd "${pkgname}"/build-rkt-*+git
  install -Dm755 bin/rkt "$pkgdir/usr/bin/rkt"
  install -Dm755 bin/actool "$pkgdir/usr/bin/actool"
  install -Dm644 bin/stage1.aci "$pkgdir/usr/share/rkt/stage1.aci"
}

# vim:set ts=2 sw=2 et:
