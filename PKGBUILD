# Maintainer: Florian Stecker <oss@florianstecker.net>
# Contributor: Sagnik Mandal <criticic>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: earnestly

pkgname=llpp
pkgver=43
pkgrel=0
pkgdesc='opengl accelerated pdf viewer based on mupdf'
arch=('x86_64')
url=https://repo.or.cz/llpp.git
_commit=6f7680baea6f1b5d227674613be262d90c57636f
license=('GPL3')
depends=('freetype2' 'gumbo-parser' 'jbig2dec' 'libgl' 'libjpeg' 'openjpeg2' 'libmupdf')
makedepends=('asciidoc' 'git' 'ocaml' 'ocaml-lablgl')
optdepends=('djvulibre: for llppac djvu conversion'
            'ghostscript: for llppac ps, dvi, and djvu conversion'
            'imagemagick: for llppac image conversion'
            'inotify-tools: for the llpp.inotify autoreload wrapper'
            'librsvg: for llppac svg conversion'
            'unoconv: for llppac office conversion')
options=('!strip' '!debug')
source=("git+$url#commit=$_commit"
        'build-fixes.patch')
b2sums=('d636fcef072534ebfd79aa6dc2d214cca99f1fe0c814c201fed5ac68238034f78b5c5c7f2c2f19e238eed3be881b636c44e22a97901e5f09335eb89e3355cd4a'
        'fef20e6a79cd649a20051b8ce170bdf66387c2fc4ac960c17e886cfb8429a53b5cd540361705c93c534e2faa8fb7a710b73a7749ece8f9cce9e8b2fdd0531e51')

prepare() {
    cd $pkgname
    patch --forward --strip=1 --input=../build-fixes.patch

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
