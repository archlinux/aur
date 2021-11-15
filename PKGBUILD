# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='byebug'
pkgname="ruby-${_gemname}"
pkgver=11.1.3
pkgrel=1
pkgdesc='Ruby debugger'
arch=('x86_64')
url="https://github.com/deivid-rodriguez/${_gemname}"
license=('BSD2')
options=(!emptydirs)
depends=('ruby')
makedepends=('ruby-bundler' 'ruby-rake' 'ruby-rake-compiler')
checkdepends=('ruby-minitest' 'ruby-pry')
source=(
    "${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
    "remove-unwanted-dependencies.patch"
)
sha512sums=('9f00697e2c953d7b8da09fa6da442c34dd3713b823b5dd0074e6998662d361d88a37ca4c530d9cbfeab8605dfb0eb7f95422c66f2c5f1d90080dd7aefc302952'
            'be7c712540f72d2bd998b71347463ef5d5aa114f77040247f7637cea2ad0df12021005f3649f17a6fffab4a68b01559744d6dbb5297e5f039c5c7b3396f7bfa9')

prepare() {
  cd "${_gemname}-${pkgver}"

  # remove unwanted dependencies
  patch --verbose --strip=1 --input=../remove-unwanted-dependencies.patch

  # update gemspec/Gemfile to allow newever version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec" Gemfile
  rm Gemfile.lock
}

build() {
  cd "${_gemname}-${pkgver}"

  rake build
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "pkg/${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md CONTRIBUTING.md GUIDE.md README.md Ruby_Grant_2014_Report.md code_of_conduct.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"
}
