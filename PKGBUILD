# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=egl-man-pages
pkgver=20181004.r116
pkgrel=1
pkgdesc="EGL Man Pages"
arch=('any')
url="http://www.opengl.org/wiki/Getting_started/XML_Toolchain_and_Man_Pages"
license=('custom')
makedepends=('libxslt' 'docbook-xsl' 'subversion')
source=('git+https://github.com/KhronosGroup/EGL-Registry')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/EGL-Registry/sdk/docs/man

  printf '%s.r%d' \
    $(date -d"$(git log -1 --format=%aD .)" +%Y%m%d) \
    $(git rev-list --count $(git log -1 --format=%h .))
}

build() {
  for file in "$srcdir"/EGL-Registry/sdk/docs/man/egl*.xml; do
    xsltproc --noout --nonet --xinclude \
      --stringparam funcsynopsis.style ansi \
      --stringparam man.authors.section.enabled 0 \
      --stringparam man.output.quietly 1 \
      /usr/share/xml/docbook/xsl-stylesheets-*/manpages/docbook.xsl \
      "$file"
  done

  # Output is corrupted because the xml indentation is kept
  for file in *.3G; do
    sed 's/^ \+//' -i "$file"
  done
}

package() {
  install -d "$pkgdir"/usr/share/man/man3
  install -m644 "$srcdir"/*.3G "$pkgdir"/usr/share/man/man3/

  install -D -m644 "$srcdir"/EGL-Registry/sdk/docs/man/copyright.xml \
    "$pkgdir/usr/share/licenses/$pkgname/copyright.xml"
}
