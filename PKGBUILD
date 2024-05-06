pkgname=ruby-gollum-lib
_name=gollum-lib
pkgver=6.0
_commit=15aae49016860a7fa3c04bd6f48fee9fd43a518d
pkgrel=2
pkgdesc='A simple, Git-powered wiki with a sweet API.'
arch=(x86_64)
url='http://github.com/gollum/gollum-lib'
license=(MIT)
depends=(
ruby-rouge
ruby-nokogiri
ruby-loofah
ruby-github-markup
ruby-gemojione
ruby-twitter-text
ruby-gollum-rugged_adapter
)
makedepends=(
git
rubygems
)
checkdepends=(
ruby-rack-test
ruby-shoulda
ruby-minitest-reporters
ruby-mocha
ruby-test-unit
ruby-twitter_cldr
)
#options=(!emptydirs)
source=("git+https://github.com/gollum/gollum-lib.git#commit=${_commit}")
sha1sums=('SKIP')

pkgver() {
	cd gollum-lib
	git describe --tags | sed 's/^v//'
}


prepare() {
  cd gollum-lib

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"
  
  sed -i "s|s.add_dependency 'rouge', '~> 3.1'|s.add_dependency 'rouge'|" gemspec.rb
  sed -i "s|s.add_dependency 'twitter-text', '1.14.7'|s.add_dependency 'twitter-text'|" gemspec.rb
}

build() {
  cd gollum-lib

  local _gemdir="$(gem env gemdir)"

  gem build "${_name}.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/${_gemdir}" \
    --bindir "tmp_install/usr/bin" \
    "${_name}-${pkgver}.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/${_gemdir}/cache/" \
    "tmp_install/${_gemdir}/gems/${_name}-${pkgver}/vendor/" \
    "tmp_install/${_gemdir}/doc/${_name}-${pkgver}/ri/ext/"

  find "tmp_install/${_gemdir}/gems/" \
    -type f \
    \( \
      -iname "*.o" -o \
      -iname "*.c" -o \
      -iname "*.so" -o \
      -iname "*.time" -o \
      -iname "gem.build_complete" -o \
      -iname "Makefile" \
    \) \
    -delete

  find "tmp_install/${_gemdir}/extensions/" \
    -type f \
    \( \
      -iname "mkmf.log" -o \
      -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd gollum-lib

  local _gemdir="$(gem env gemdir)"

  GEM_HOME="tmp_install/${_gemdir}" rake test | true  # needs ruby-nokogiri-diff at least
}

package() {
  cd gollum-lib

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

