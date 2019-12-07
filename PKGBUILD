# Maintainer: Minzord

pkgname=remakepkg
pkgver=0.9.6
pkgrel=1
arch=(any)

pkgdesc='Apply changes to pacman packages'
url='https://gitlab.com/ayekat/pacman-hacks'
license=(GPL3)

# Both are part of pacman-hacks. If you want both makemetapkg and remakepkg,
# just install pacman-hacks:
# https://gitlab.com/ayekat/PKGBUILDs/tree/pacman-hacks
conflicts=(makemetapkg)

depends=(coreutils)
makedepends=(asciidoc git)


source=("git+https://gitlab.com/ayekat/pacman-hacks.git#tag=v$pkgver"
        'diffrepo.hook.example')
sha256sums=(SKIP
            4b723cf33b30f6176f8f50623c2325d05d5dc70463ca2bcd893fae2ccab5776e)

_tools='diffrepo fetchpkg  getpkg pkgmirror remakepkg repkg'

build() {
  cd pacman-hacks
  make PREFIX=/usr SCRIPTS="$_tools" MANPAGES="$_tools"
}

package() {
  depends+=(bash curl expac grep gzip fakeroot libarchive pacman sed sh vi)

  cd pacman-hacks
  make \
    PREFIX=/usr \
    DESTDIR="$pkgdir" \
    SCRIPTS="$_tools" \
    MANPAGES="$_tools" \
    install
  install -Dm 0644 README "$pkgdir"/usr/share/doc/remakepkg/README
  install -Dm 0644 CHANGELOG "$pkgdir"/usr/share/doc/remakepkg/CHANGELOG
  install -Dm 0644 "$srcdir"/diffrepo.hook.example \
                   "$pkgdir"/usr/share/doc/remakepkg/diffrepo.hook.example
}
