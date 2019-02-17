# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Nikita Nikishin <i.nnikishi@gmail.com>
# Contributor: Christian Mauderer <oss@c-mauderer.de>
# Contributor: Jonas Strassel <jo.strassel@gmail.com>

pkgname=pdfbeads
pkgver=1.1.2
pkgrel=1
pkgdesc="A small utility written in Ruby which takes scanned page images and converts them into a single PDF file"
arch=('any')
url='https://github.com/ImageProcessing-ElectronicPublications/ruby-pdfbeads'
license=('GPL')

depends=(
'ruby'
'openjpeg2'
'imagemagick6'
'ruby-iconv'
'ruby-multiio'
'ruby-rdoc'
'ruby-rmagick'
)

optdepends=(
'jbig2enc: for better JPEG2000 compression'
'ruby-nokogiri: to create hidden text layer from hOCR files'
'ruby-hpricot: to read data from hOCR files'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ImageProcessing-ElectronicPublications/ruby-${pkgname}/archive/${pkgver}.tar.gz"
        "license.patch")
sha256sums=('f77d7a33cb9ef5963bc735f7b7bb4ffdadd94291291bb3581a4ec4ece39b9ab3'
            'b6805425d464ba6da5de764f849ac309fc6805e5215d635da4ec972325c77bbe')

prepare() {
  cd ruby-${pkgname}-${pkgver}
  sed 's|git ls-files -z|find -print0|' -i ${pkgname}.gemspec
  sed 's|~>|>=|g' -i ${pkgname}.gemspec # don't give a fuck about rubys bla bla

  patch -p0 -i ../license.patch
}

build() {
  cd ruby-${pkgname}-${pkgver}
  gem build ${pkgname}.gemspec
}

package() {
  cd "${srcdir}/ruby-${pkgname}-${pkgver}"
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig \
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README ChangeLog doc/pdfbeads.en.html doc/pdfbeads.ru.html -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
