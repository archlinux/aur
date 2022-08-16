# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: annotat <post@annotat.net>

pkgname='schleuder'
pkgver=4.0.3
pkgrel=1
pkgdesc='An encrypting mailing list manager with remailing-capabilities'
arch=(any)
url='https://schleuder.org'
license=('GPL3')
options=(!emptydirs)
depends=('inetutils' 'ruby' 'ruby-activerecord' 'ruby-bcrypt' 'ruby-bigdecimal' 'ruby-charlock_holmes' 'ruby-gpgme' 'ruby-mail' 'ruby-mail-gpg' 'ruby-rake' 'ruby-sinatra' 'ruby-sinatra-contrib' 'ruby-sqlite3' 'ruby-thin' 'ruby-thor')
checkdepends=('procps-ng' 'ruby-bundler' 'ruby-database_cleaner' 'ruby-factory_bot' 'ruby-hirb' 'ruby-rack-test' 'ruby-rspec')
source=("https://0xacab.org/schleuder/schleuder/-/archive/schleuder-${pkgver}/schleuder-schleuder-${pkgver}.tar.gz"
        "sysuser_schleuder.conf"
        "tmpfile_schleuder.conf"
        # these patches are planned to be included in the next major release in schleuder
        # this patch is based on https://0xacab.org/schleuder/schleuder/-/merge_requests/377 (without CHANGELOG.md changes)
        "log_gpg_warnings.patch"
)
sha512sums=('faf442ecb01829fc74b7c10748405164b13f231be1f562313a3800118af084f0b0d8b2d01dea5f113c04a924cb2bb1c3218beb7c0a66728a2e68132705b0e136'
            '91e37c2b35512ce0633d7c720ba3f16c2c077771308a7fe9d009d382b9ca4c57dba230f0ed4e7d2eab11f785cbf288b85bb1e5e32e03b0beee97a338019348d3'
            '5a355d32c12ef4598d2ce7b8812666d9ba415d1b1e935a5da5ddb528883acb5ec1d73cf3f1ca2df4b222126495356a55ce649943818e606876734fcf7ba8d8d7'
            'a99571e9f1bb979eff3648b22b53f8deb8eac767502f30b6aa2d81525aeea4619c0d148b4509b3f020ca8a1c8d08994c08963c1fff09ea8ab885b6c05c1c7ec3')

prepare() {
  cd "${pkgname}-${pkgname}-${pkgver}"

  patch --verbose --strip=1 --input=../log_gpg_warnings.patch

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

  # fix path in upstream files
  sed --in-place --regexp-extended 's|/usr/local|/usr|g' etc/schleuder-api-daemon.service etc/schleuder.yml
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

  install -Dm 640 etc/schleuder.yml etc/list-defaults.yml --target-directory "${pkgdir}/etc/schleuder"
  install -Dm 644 etc/schleuder-api-daemon.service etc/schleuder-weekly-key-maintenance.service etc/schleuder-weekly-key-maintenance.timer --target-directory "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md MISSION_STATEMENT.md README.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 man/*.8 --target-directory "${pkgdir}/usr/share/man/man8"
  install -Dm 644 ../sysuser_schleuder.conf "${pkgdir}/usr/lib/sysusers.d/schleuder.conf"
  install -Dm 644 ../tmpfile_schleuder.conf "${pkgdir}/usr/lib/tmpfiles.d/schleuder.conf"

  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
