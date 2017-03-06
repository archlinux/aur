# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=egl-man-pages
pkgver=20140330.r33416
pkgrel=1
pkgdesc="EGL Man Pages"
arch=('any')
url="http://www.opengl.org/wiki/Getting_started/XML_Toolchain_and_Man_Pages"
license=('custom')
makedepends=('libxslt' 'docbook-xsl' 'subversion')
source=('svn+https://cvs.khronos.org/svn/repos/registry/trunk/public/egl/sdk/docs/man/')
md5sums=('SKIP')

pkgver() {
  cd man

  printf '%s.r%d' \
    $(svn info --show-item last-changed-date | cut -dT -f1 | tr -dc 0-9) \
    $(svn info --show-item revision)
}

build() {
  cd man

  for file in egl*.xml; do
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
  install -m644 "$srcdir"/man/*.3G "$pkgdir"/usr/share/man/man3/

  install -D -m644 "$srcdir"/man/copyright.xml \
    "$pkgdir/usr/share/licenses/$pkgname/copyright.xml"
}
