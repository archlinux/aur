# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname='rubygems-user'
pkgver=3.7.1
pkgrel=2
pkgdesc='Package management framework for Ruby (user default)'
arch=('any')
url='https://rubygems.org/'
license=('MIT')
depends=('ruby')
makedepends=('rubygems' 'ruby-rdoc')
checkdepends=('ruby-rake' 'ruby-test-unit' 'ruby-webrick' 'git' 'cmake')
options=('!emptydirs')
source=("https://github.com/rubygems/rubygems/archive/refs/tags/v${pkgver}.tar.gz"
	'Gem.default_install.patch'
	'gem-home-fix.patch'
	'operating_system.rb')
sha512sums=('ee365f31fe17061cb86669457748a3074bbf7df9c931aae545214672a778e59addb2cd6febf1393cb6fbcc78f7f55dd1d48a11a99d8274f4570c7b80ae50c6f3'
            '2cce51efea751b63ea7eaa8e9e6909b32bc72598ed46824da4ee7fed43c912aadb00d419071616a1734c7b201a0b76d6faf6c446cca337f4331f3eaf44c67fbc'
            'c6263ab9deb34febf3cf4552727e32390388fd8c70765c7762cab103952bb0d4b888a0f8eccedc02d7bd774c9bf5f86f3815ab33f5dbe775c5fc7c75bdc504c7'
            'e47fd705d50933d39133b61f83a110691965d7698a984052c07875cc6c8ed88ec970589bd32d0a5c97f33c3aca137d6b2f0d8037330d81011cb0b7bba13b4d3b')

provides=("rubygems=$pkgver" 'ruby-rubygems')
conflicts=(rubygems)

prepare() {
  cd "rubygems-${pkgver}"

  patch -p1 -i "$srcdir/Gem.default_install.patch"
  patch -p1 -i "$srcdir/gem-home-fix.patch"
}

check() {
  cd "rubygems-${pkgver}"

  # Remove unnecessary checks
  rm "test/rubygems/test_project_sanity.rb"

  # The tests get confused with our operating_system.rb
  mkdir -p test/rubygems/defaults/
  touch test/rubygems/defaults/operating_system.rb

  rake test
}

package() {
  cd "rubygems-${pkgver}"

  # Don't install bundler stuff
  sed --in-place -e '/install_default_bundler_gem bin_dir/,+1d' -e '/bundler\/lib/d' lib/rubygems/commands/setup_command.rb

  # Install in the right location
  sed --in-place -e 's/sitelibdir/rubylibdir/' lib/rubygems/commands/setup_command.rb

  export GEM_HOME="${pkgdir}$(ruby -e 'puts Gem.default_dir')"

  install --verbose -D $srcdir/operating_system.rb --target-directory "lib/rubygems/defaults/"

  ruby setup.rb \
    --destdir="${pkgdir}" \
    --norc \
    --verbose

  rm lib/rubygems/defaults/operating_system.rb

  install --verbose -D --mode=0644 LICENSE.txt MIT.txt --target-directory "${pkgdir}/usr/share/licenses/rubygems"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/rubygems"
}
