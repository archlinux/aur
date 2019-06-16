# Maintainer: Georg Krause <mail@georg-krause.net>
pkgname=loopp-git
pkgver=1.2.1.r70.g82e3fbc
pkgrel=1
pkgdesc="A music creation tool, intended for live use"
arch=('x86_64')
url="https://loopp.soundship.de/"
license=('GPL3')
groups=('pro-audio')
depends=('jack' 'liblo' 'ntk')
makedepends=('meson' 'git')
source=($pkgname::git+https://git.netzspielplatz.de/soundship/loopp.git)
sha512sums=(SKIP)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^release.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  arch-meson --prefix=/usr \
             --libdir=lib \
             --buildtype=release \
             build
  ninja -C build
}

package() {
  cd $pkgname
  DESTDIR="${pkgdir}" meson install -C build
  #docs
  install -vDm 644 {CHANGELOG.md,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
  # controllers
  install -vDm 644 "resources/controllers/"*.ctlr \
    -t "${pkgdir}/usr/share/${pkgname}/"
}
