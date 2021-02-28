# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='puma'
pkgname="ruby-$_gemname"
pkgver=5.2.1
pkgrel=2
pkgdesc='A Ruby/Rack web server built for concurrency'
arch=('x86_64')
url='https://puma.io/'
license=('BDS-3-CLAUSE')
options=(!emptydirs)
depends=('ruby' 'ruby-nio4r' 'ruby-sd_notify')
makedepends=('git' 'ruby-bundler' 'ruby-minitest' 'ruby-minitest-proveit' 'ruby-minitest-retry' 'ruby-minitest-stub-const' 'ruby-rack' 'ruby-rake' 'ruby-rake-compiler' 'ruby-rdoc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/puma/puma/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
sha512sums=('8ec1a351badd68ce6559eb99592e3f4d836ca49406749a6c2cd9162c443eadf3b4cf24ceb6c92e0e27057217f6487ff9923888ff4a1590f8cf9061d06ec16e52')

prepare() {
  cd "${_gemname}-${pkgver}"

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${_gemname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the deps
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec" Gemfile

  # disable rubocop, we don't have that in our repos and it doesn't provide any benefits during building
  sed --in-place '/rubocop/Id' Rakefile Gemfile

  # disable m. Only required for debugging during development
  sed --in-place "/'m'/d" Gemfile
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -D --mode=644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D --mode=644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
