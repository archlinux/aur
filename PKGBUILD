# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: earnestly

pkgname=llpp
pkgver=34
pkgrel=1
pkgdesc='opengl accelerated pdf viewer based on mupdf'
arch=('x86_64')
url=https://github.com/moosotc/llpp
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
source=("git+$url#tag=v$pkgver"
        'system-makedeps.patch')
b2sums=('SKIP'
        '3701e6163b8c584c2fc71352273769357cc289b9d298325bfd6cb86dd87196fcb53f416691074ef5e9279f084d24b93f2091bd49bb36a4a1be30c2846526b107')

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
