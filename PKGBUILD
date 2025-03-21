# Maintainer: Luís Ferreira <luis at aurorafoss dot org>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

pkgname="ruby-stud"
pkgver=0.0.23
pkgrel=2
pkgdesc="small reusable bits of code"
arch=('any')
url="https://rubygems.org/gems/${pkgname#*-}"
license=('Apache')
depends=('ruby')
makedepends=('rubygems')
checkdepends=('ruby-rspec' 'ruby-insist')
source=("${pkgname}-${pkgver}::git+https://github.com/jordansissel/$pkgname.git"
        "https://github.com/jordansissel/ruby-stud/pull/33.patch"
       )
sha256sums=('SKIP'
           'b71e34262419c888317c6d8f28327298bcaf9664b8bb08eb66a600866ead1276'
           )
options=(!emptydirs)

prepare() {
  cd "${pkgname}-${pkgver}"

  # exists is deprecated and removed as of Ruby 3.2, see https://github.com/jordansissel/ruby-stud/pull/33
  patch -Np1 -i ../33.patch

  sed 's|~>|>=|g' -i "${pkgname#*-}.gemspec" # we don't do version pinning
}

build() {
  cd "${pkgname}-${pkgver}"

  gem build "${pkgname#*-}.gemspec"
}

check() {
  cd "${pkgname}-${pkgver}"

  rspec
}


package() {
  cd "${pkgname}-${pkgver}"

	local _gemdir
  _gemdir="$(gem env gemdir)"

	gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" \
    -n "$pkgdir/usr/bin" "${pkgname#*-}-$pkgver.gem"
  find "${pkgdir}" -type f -name '*.gem' -delete

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "$pkgdir/$_gemdir"
  rm -rf cache gems/${pkgname#*-}-${pkgver}/{ext,lib/*/*.so} \
    extensions/*/*/${pkgname#*-}-${pkgver}/{mkmf.log,gem_make.out}
}
