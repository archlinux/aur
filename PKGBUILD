# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=gedit-plugin-markdown_preview-git
pkgver=r172.b1f81cc
pkgrel=2
pkgdesc="A gedit plugin previewing markdown (.md) documents"
arch=('any')
url="https://github.com/maoschanz/gedit-plugin-markdown_preview"
license=('GPL3')
depends=('gedit' 'python-markdown' 'webkit2gtk')
makedepends=('git')
optdepends=('pymdown-extensions: extra Python Markdown extensions'
            'python-pygments: for CodeHilite extension'
            'pandoc: export and stylesheet support'
            'texlive-bin: export to PDF with pandoc (pdflatex)'
            'texlive-fontsextra: export to PDF with pandoc (lmodern)')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/maoschanz/gedit-plugin-markdown_preview.git'
        'https://github.com/maoschanz/gedit-plugin-markdown_preview/pull/55.patch')
sha256sums=('SKIP'
            '9cc3f3800aa6f4d02e8e185581c266b2286aa5c0f1d3f768fc32269c2582c4f6')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # fixes #46 for export_assistant.py
  # https://github.com/maoschanz/gedit-plugin-markdown_preview/issues/46
  patch -Np1 -i ../55.patch
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 org.gnome.gedit.plugins.markdown_preview.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas"
  install -Dm644 markdown_preview.plugin -t "$pkgdir/usr/lib/gedit/plugins"
  cp -r markdown_preview "$pkgdir/usr/lib/gedit/plugins"
  install -Dm644 example.css -t "$pkgdir/usr/share/doc/${pkgname%-git}"

  rm "$pkgdir/usr/lib/gedit/plugins/markdown_preview/locale/gedit-plugin-markdown-preview.pot"
  rm "$pkgdir"/usr/lib/gedit/plugins/markdown_preview/locale/{fr,nl}/LC_MESSAGES/*.po
}
