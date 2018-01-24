# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Albert Graef <aggraef at gmail.com>
# Contributor: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: bjoern lindig (bjoern _dot_ lindig _at_ google.com)

pkgname=faust
pkgver=2.5.10
pkgrel=4
pkgdesc="A functional programming language for realtime audio signal processing."
arch=('x86_64')
url="https://faust.grame.fr/"
license=('GPL2')
depends=('llvm-libs' 'libsndfile' 'libmicrohttpd')
makedepends=('llvm' 'git' 'xxd')
optdepends=('clang: needed for sound2reader'
            'python2: needed for faust2md'
            'ruby: needed for faust2sc and scbuilder'
            'java-runtime=8: needed for faust2android')
provides=('faust')
conflicts=('faust-git')
options=('staticlibs')
source=("https://github.com/grame-cncm/${pkgname}/releases/download/v${pkgver//./-}/${pkgname}-${pkgver}.tar.gz"
        "git+https://github.com/agraef/emacs-faust-mode.git"
        'python2-fix.patch'
        'llvm-501-fix.patch')
sha512sums=('ee8e6a409eb092a59c2a5229087f8d5eb2a38c998df97398202aff48f0ad4ff4dd6c8f54f8f02aad24e32b54b0be7f273d2b7adc04f80a5fc4d607bafd4fc926'
            'SKIP'
            'aefee8c8bfe1115f8b2a576e6021bd0da3eeced9403878dc124fe7fbcb819d3910f1f119662ae09c52e60dff6ebfc76f0f63e07df3705e0849149fa540104482'
            '3af0037631a4663156b29b3cbff8d1914b290708919aedbeaf44cbc4cc1ef6bbe02d064e7a5f901689afe44038f4c048a7edfbf4e2fa6611ba5ebeb2d9aae2d5')

prepare() {
  cd "${pkgname}-${pkgver}"
  # fix scripts requiring python2
  patch -Np1 < "${srcdir}/python2-fix.patch"
  # temporary fix in 2.5.10
  patch -Np1 < "${srcdir}/llvm-501-fix.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr world
}

package() {
  cd "${pkgname}-${pkgver}"
  make install PREFIX=/usr DESTDIR="$pkgdir"

  # docs
  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -Dm644 documentation/*.{pdf,html}

  # examples
  install -d "${pkgdir}/usr/share/${pkgname}/examples"
  cp -R "examples/"* "${pkgdir}/usr/share/${pkgname}/examples/"

  cd syntax-highlighting
  # atom
  install -Dm644 "atom/language-${pkgname}/package.json" \
    "${pkgdir}/usr/lib/atom/dot-atom/packages/language-${pkgname}/package.json"
  install -Dm644 "atom/language-${pkgname}/grammars/${pkgname}.cson" \
    "${pkgdir}/usr/lib/atom/dot-atom/packages/language-${pkgname}/grammars/${pkgname}.cson"
  install -Dm644 "atom/language-${pkgname}/settings/language-${pkgname}.cson" \
    "${pkgdir}/usr/lib/atom/dot-atom/packages/language-${pkgname}/settings/language-${pkgname}.cson"
  install -t "${pkgdir}/usr/lib/atom/dot-atom/packages/language-${pkgname}/snippets/" \
    -Dm644 "atom/language-${pkgname}/snippets/"*
  install -Dm644 "atom/language-${pkgname}/process-palette.json.linux" \
    "${pkgdir}/usr/share/doc/${pkgname}/process-palette.json"
  # kate
  install -Dm644 "${pkgname}.xml" \
    "${pkgdir}/usr/share/apps/katepart/syntax/${pkgname}.xml"
  # gedit
  install -Dm644 "${pkgname}.lang" \
    "${pkgdir}/usr/share/gtksourceview-2.0/language-specs/${pkgname}.lang"
  install -Dm644 "${pkgname}.lang" \
    "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/${pkgname}.lang"
  # highlight
  install -Dm644 dsp.lang "$pkgdir/usr/share/highlight/langDefs/dsp.lang"
  # nano
  install -Dm644 "${pkgname}.nanorc" "$pkgdir/usr/share/nano/${pkgname}.nanorc"
  # vim
  install -Dm644 "${pkgname}.vim" \
    "$pkgdir/usr/share/vim/vimfiles/syntax/${pkgname}.vim"
  # emacs
  install -Dm644 "${srcdir}/emacs-${pkgname}-mode/${pkgname}-mode.el" \
    "$pkgdir/usr/share/emacs/site-lisp/${pkgname}-mode.el"
}
