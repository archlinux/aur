# Maintainer: Tinu Weber <http://ayekat.ch>

pkgname=makemetapkg
pkgver=0.7.8
pkgrel=1
arch=(any)

pkgdesc='Create meta-packages for pacman'
url='https://gitlab.com/ayekat/pacman-hacks'
license=(GPL3)

# Both are part of pacman-hacks. If you want both makemetapkg and remakepkg,
# just install pacman-hacks:
# https://gitlab.com/ayekat/PKGBUILDs/tree/pacman-hacks
conflicts=(remakepkg)

depends=(coreutils sed)
makedepends=(asciidoc git)

changelog='changelog'

source=("git+https://gitlab.com/ayekat/pacman-hacks.git#tag=v$pkgver")
sha256sums=(SKIP)

_tools='makemetapkg metapkg'

build() {
  cd pacman-hacks
  make clean
  make PREFIX=/usr SCRIPTS="$_tools" MANPAGES="$_tools"
}

package() {
  # Remark: Since makemetapkg ends up calling makepkg at some point, the
  # upstream author assumes that everything necessary for running makepkg is
  # installed (i.e. the base-devel group). Since we cannot depend on base-devel
  # directly (since it's only a group), but to avoid having to list everything
  # in that group explicitly here, we just take a wild guess about which
  # packages in base-devel we REALLY need:
  depends+=(bash fakeroot pacman sh)

  cd pacman-hacks
  make \
    PREFIX=/usr \
    DESTDIR="$pkgdir" \
    SCRIPTS="$_tools" \
    MANPAGES="$_tools" \
    install
  install -Dm 0644 README "$pkgdir"/usr/share/doc/remakepkg/README
  install -Dm 0644 CHANGELOG "$pkgdir"/usr/share/doc/remakepkg/CHANGELOG
}
