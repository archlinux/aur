# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='activemodel-serializers-xml'
pkgname="ruby-${_gemname}"
pkgver=1.0.2
pkgrel=1
pkgdesc='XML serialization for your Active Model objects and Active Record models - extracted from Rails'
arch=('any')
url='https://github.com/rails/activemodel-serializers-xml'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activemodel' 'ruby-activesupport' 'ruby-builder')
makedepends=('ruby-bundler' 'ruby-rake')
#checkdepends=('ruby-capybara' 'ruby-rack-cache' 'ruby-railties' 'ruby-rexml' 'ruby-selenium-webdriver')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('888db4822f9ed4fd17ba93f2e03e4edc204bc14f62e3622949140a3497f56ad7cd7d49cd7f38fbf557098ceed9f2f1334093fd8493ccc82e56be15f6bf138af9')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files -z/find -print0/' "${_gemname}.gemspec"

  # update gemspec to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

#check() {
#  cd "rails-${pkgver}/${_gemname}"
#
#  rake test
#}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CONTRIBUTING.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
