# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: annotat <post@annotat.net>

pkgname='schleuder'
pkgver=4.0.1
pkgrel=3
pkgdesc='An encrypting mailing list manager with remailing-capabilities'
arch=(any)
url='https://schleuder.org'
license=('GPL3')
install="${pkgname}.install"
options=(!emptydirs)
depends=('inetutils' 'ruby' 'ruby-activerecord' 'ruby-bcrypt' 'ruby-bigdecimal' 'ruby-charlock_holmes' 'ruby-gpgme' 'ruby-mail' 'ruby-mail-gpg' 'ruby-rake' 'ruby-sinatra' 'ruby-sinatra-contrib' 'ruby-sqlite3' 'ruby-thin' 'ruby-thor')
checkdepends=('procps-ng' 'ruby-bundler' 'ruby-database_cleaner' 'ruby-factory_bot' 'ruby-hirb' 'ruby-rack-test' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::https://0xacab.org/schleuder/schleuder/-/archive/schleuder-${pkgver}/schleuder-schleuder-${pkgver}.tar.gz"
        "rspec.patch")
sha512sums=('7ead37e7be9bc88dd304ecc2045eee0b72bc8eebd529bbec801347ff77b8da6bad7ed4817346add6162070ab1cf43c102e8f41f48d814a548f54c5fd16e56b54'
            '94229306500915fa99aac3085175306e202ad28f1decf6d5902419635c64fa2ed368bd88b5833822cfe7445683034583f838eb1d060cd024a62f92a34729c6f7')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  patch --verbose --strip=1 --input=../rspec.patch

  # we built based on a tar archive, not a git repo
  sed --in-place 's/git ls-files/find/' "${pkgname}.gemspec"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${pkgname}.gemspec" Gemfile

  # ignore code coverage
  sed --in-place '/simplecov-console/d' "${pkgname}.gemspec"

  # ignore code style checks
  sed --in-place '/rubocop/d' "${pkgname}.gemspec"

  # ignore debugger
  sed --in-place '/byebug/d' "${pkgname}.gemspec" spec/spec_helper.rb
}

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  rake build_gem
}

check() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  export CHECK_CODE_COVERAGE=false
  export SCHLEUDER_CONFIG=spec/schleuder.yml
  export SCHLEUDER_ENV=test

  bundle exec rake db:init
  bundle exec rspec

  rm -f ./db/test.sqlite3
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --no-document --install-dir "${pkgdir}${_gemdir}" --bindir "${pkgdir}/usr/bin" "${pkgname}-${pkgver}.gem"

  install -Dm 644 CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md MISSION_STATEMENT.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 man/*.8 --target-directory "${pkgdir}/usr/share/man/man8"

  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
