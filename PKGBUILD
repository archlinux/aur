# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname='rubygems-user'
pkgver=3.5.0
pkgrel=1
pkgdesc='Package management framework for Ruby (user default)'
arch=('any')
url='https://rubygems.org/'
license=('MIT')
depends=('ruby')
checkdepends=('ruby-rake' 'ruby-webrick' 'git' 'cmake')
options=('!emptydirs')
source=("https://github.com/rubygems/rubygems/archive/refs/tags/v${pkgver}.tar.gz"
	'Gem.default_install.patch'
	'operating_system.rb')
sha512sums=('48b9631e87d7a447cec3e2ea071deb75711e4baa20c5d0ea7842c1f3a1d4770fe1abd663a54ddc2493756e830e348e4bd0a57e13aa983188dff8259fed0a1790'
	'84ac1ea8ccaa350db8d9176d357d0d09f95e32411887c45f939e9d8dd6be6a55bb4a4087580d4a3bd9c2aeee65dc0313088e96ecac5653fd95f0105060fd8e53'
	'3462dfe94f51d31dd616fae4107c7410d8513323dd8dffd657271a31363abd3b87d2150cda47fd9b1a8b9b63b4c57c03740e26941ac6ef55be9848fe56db8af4')

provides=("rubygems=$pkgver")
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

  install --verbose -D --mode=0644 $srcdir/operating_system.rb --target-directory ${pkgdir}${_rubygems_dir}/rubygems/defaults/

  # cleanup - remove any bundler references as they are provided by https://archlinux.org/packages/community/any/ruby-bundler/
  rm --recursive \
    "${pkgdir}/usr/bin/"bundle* \
    "${pkgdir}/usr/gems" \
    "${pkgdir}/usr/lib/bundler.rb" \
    "${pkgdir}/usr/lib/bundler" \
    "${pkgdir}/usr/specifications"

  install --verbose -D --mode=0644 LICENSE.txt MIT.txt --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
