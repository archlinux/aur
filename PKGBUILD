# Maintainer: Sagnik Mandal <criticic>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: earnestly

pkgname=llpp
pkgver=41
pkgrel=1
pkgdesc='opengl accelerated pdf viewer based on mupdf'
arch=('x86_64')
url=https://github.com/criticic/llpp
cloneurl=https://github.com/criticic/llpp
license=('GPL3')
depends=('freetype2' 'gumbo-parser' 'jbig2dec' 'libgl' 'libjpeg' 'openjpeg2')
makedepends=('asciidoc' 'git' 'libmupdf' 'ocaml' 'ocaml-lablgl')
optdepends=('djvulibre: for llppac djvu conversion'
            'ghostscript: for llppac ps, dvi, and djvu conversion'
            'imagemagick: for llppac image conversion'
            'inotify-tools: for the llpp.inotify autoreload wrapper'
            'librsvg: for llppac svg conversion'
            'unoconv: for llppac office conversion')
options=('!strip')
source=("git+$cloneurl#tag=v$pkgver"
        'system-makedeps.patch')
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input=../system-makedeps.patch

  # Restore desktop file
  git revert --no-commit aad4b1e65e581ff7a096a3c3901b222a9c127a1c
}

build() {
  cd $pkgname
  bash ./build.bash build
  bash ./build.bash build doc
}

package() {
  cd $pkgname
  install -Dt "$pkgdir"/usr/bin build/llpp misc/llpp{.inotify,ac}
  install -Dm644 -t "$pkgdir"/usr/share/applications misc/llpp.desktop
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 build/doc/*.1
}
