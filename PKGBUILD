# Maintainer: Dmitry Kharitonov <darksab0r at gmail com>
# Contributor: Nikita Nikishin <i.nnikishi@gmail.com>
# Contributor: Christian Mauderer <oss@c-mauderer.de>
# Contributor: Jonas Strassel <jo.strassel@gmail.com>

pkgname=pdfbeads
pkgver=1.1.2.pre.beta
pkgrel=5
pkgdesc="A small utility written in Ruby which takes scanned page images and converts them into a single PDF file"
arch=('any')
url='https://github.com/boredland/pdfbeads'
license=('GPL')

depends=(
'ruby'
'openjpeg2'
'imagemagick6'
'ruby-rmagick>=2.0.0'
'ruby-rdoc'
)

optdepends=(
'jbig2enc: for better JPEG2000 compression'
'ruby-iconv>=1.0.0'
'ruby-nokogiri>=1.7.0.0: to create hidden text layer from hOCR files'
'ruby-hpricot>=0.8.3: to read data from hOCR files'
)

source=("https://github.com/boredland/pdfbeads/releases/download/$pkgver/$pkgname-$pkgver.gem"
        "req-rmagick.patch"
        "spec-rmagick.patch")
noextract=($pkgname-$pkgver.gem)
sha256sums=('e25dba6e172136f38fa4947a7c017d5f3a2ba5bb548d9e46632e568e7ebf51e9'
            'b5fc59a954df14551dfd421f919dcdfea975cdf00605c3619bf6f815550168d3'
            '8d3e81b6781c4d080710cbb2397cec992b0e4ed73e22ee5ce8c18dc3ecd2bc0d')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig \
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  cd $pkgdir/$_gemdir/gems/$pkgname-$pkgver
  patch -p0 -i "${srcdir}/req-rmagick.patch"

  cd $pkgdir/$_gemdir/specifications
  patch -p0 -i "${srcdir}/spec-rmagick.patch"  
}

# vim:set ts=2 sw=2 et:
