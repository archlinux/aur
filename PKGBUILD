# Maintainer: Andrea Richiardi <a.richiardi.work@gmail.com>
# Co-Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
#
# namcap warns that ruby-sexp_processor is an unnecessary dependency. This is
# untrue.
#
# this package is also depended up by Emacs' feature-mode aka cucumber.el

_gemname='ruby_parser'
pkgname="ruby-${_gemname}"
pkgver=3.18.0
pkgrel=1
pkgdesc='Ruby parser written in pure ruby.'
arch=('any')
url='https://github.com/seattlerb/ruby_parser'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-sexp_processor')
makedepends=('ruby-hoe' 'ruby-minitest' 'ruby-oedipus_lex' 'ruby-racc' 'ruby-rake' 'unifdef')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  # https://github.com/seattlerb/ruby_parser/issues/324
  LICENSE
)
sha512sums=('ccf0119e419cc5c507d238a6e372f7493478924afa96ce65566b6b22c4f4e7bedcc2a5767213abb0ab9ad9d4d57d5bbbdd493a2e97afc6778d9cdc7490926525'
            '780be83e5a9d52d6c336433c02d59907ed06e336877e1dbf52170f2ad87cba6d5e8a4e0b99699aa609c7729e263b9ed57f772c1687b564537b5d133db5a12548')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' Rakefile
}

build() {
  cd "${_gemname}-${pkgver}"

  PATH=/usr/lib/ruby/gems/3.0.0/gems/racc-1.6.0/bin:${PATH} rake gem
}

check() {
  cd "${_gemname}-${pkgver}"

  rake test
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 History.rdoc README.rdoc debugging.md gauntlet.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
