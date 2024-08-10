# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname='rubygems-user'
pkgver=3.5.17
pkgrel=1
pkgdesc='Package management framework for Ruby (user default)'
arch=('any')
url='https://rubygems.org/'
license=('MIT')
depends=('ruby')
makedepends=('rubygems')
checkdepends=('ruby-rake' 'ruby-webrick' 'git' 'cmake')
options=('!emptydirs')
source=("https://github.com/rubygems/rubygems/archive/refs/tags/v${pkgver}.tar.gz"
	'Gem.default_install.patch'
	'operating_system.rb')
sha512sums=('1c34f881c5130394bc443f573421e8d04b435fb268723d67215ed4c4b6f2aec64bb74ad7c7f27950d146f8077c8ecd07841abf5af620ea4e6a8deed51c50f7d9'
            '84ac1ea8ccaa350db8d9176d357d0d09f95e32411887c45f939e9d8dd6be6a55bb4a4087580d4a3bd9c2aeee65dc0313088e96ecac5653fd95f0105060fd8e53'
            '3462dfe94f51d31dd616fae4107c7410d8513323dd8dffd657271a31363abd3b87d2150cda47fd9b1a8b9b63b4c57c03740e26941ac6ef55be9848fe56db8af4')

provides=("rubygems=$pkgver" 'ruby-rubygems')
conflicts=(rubygems)

prepare() {
  cd "rubygems-${pkgver}"

  patch -p1 -i "$srcdir/Gem.default_install.patch"
}

check() {
  cd "rubygems-${pkgver}"

  # Remove unnecessary check
  sed --in-place -e '/File.read("Manifest.txt")/,+2d' Rakefile

  # Workaround because json default spec is wrongly built
  # https://github.com/rubygems/rubygems/issues/5951
  export GEM_COMMAND=gem

  # The tests get confused with our operating_system.rb
  mkdir -p test/rubygems/defaults/
  touch test/rubygems/defaults/operating_system.rb

  rake test
}

package() {
  cd "rubygems-${pkgver}"

  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  local _extension_api_version="$(ruby -e 'puts Gem.extension_api_version')"
  local _rubygems_dir="/usr/lib/ruby/${_extension_api_version}"

  export GEM_HOME="${pkgdir}${_gemdir}"

  install --verbose -d --mode=0755 \
      "${GEM_HOME}" \
      "${pkgdir}${_rubygems_dir}"

  # define the current version as previous version to avoid printing the changelog
  ruby setup.rb \
    --destdir="${pkgdir}" \
    --prefix="/usr" \
    --previous-version="${pkgver}" \
    --no-regenerate-binstubs \
    --ri \
    --verbose

  # fix package structure
  mv --verbose "${pkgdir}/usr/lib/rubygems.rb" "${pkgdir}${_rubygems_dir}"
  mv --verbose "${pkgdir}/usr/lib/rubygems" "${pkgdir}${_rubygems_dir}"

  # cleanup - remove any bundler references as they are provided by https://archlinux.org/packages/community/any/ruby-bundler/
  rm --force --verbose --recursive \
    "${pkgdir}/usr/bin/"{bundle*,rake,rake-compiler,rspec,rdbg,rbs,typeprof,erb} \
    "${pkgdir}/usr/gems" \
    "${pkgdir}/usr/lib/bundler.rb" \
    "${pkgdir}/usr/lib/bundler" \
    "${pkgdir}/usr/specifications"

  install --verbose -D --mode=0644 $srcdir/operating_system.rb --target-directory "${pkgdir}${_rubygems_dir}/rubygems/defaults/"
  install --verbose -D --mode=0644 LICENSE.txt MIT.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
