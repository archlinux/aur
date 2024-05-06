pkgname=ruby-gollum-rugged_adapter
_name=gollum-rugged_adapter
pkgver=3.0
_commit=3763285835b9d47d72fdbdd77cc44cc46fca8a4f
pkgrel=1
pkgdesc='Adapter to make gollum use Rugged (libgit2) at the backend.'
arch=(x86_64)
url='https://github.com/gollum/rugged_adapter'
license=(MIT)
depends=(
ruby-rugged
ruby-mime-types
)
makedepends=(
git
rubygems
)
checkdepends=(
ruby-rack-test
ruby-rspec
ruby-shoulda
ruby-minitest-reporters
ruby-mocha
ruby-test-unit
)
options=(!emptydirs)
source=("git+https://github.com/gollum/rugged_adapter.git#commit=${_commit}")
sha1sums=('SKIP')

pkgver() {
	cd rugged_adapter
	git describe --tags | sed 's/^v//'
}


prepare() {
  cd rugged_adapter

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' rugged_adapter.gemspec
}

build() {
  cd rugged_adapter

  local _gemdir="$(gem env gemdir)"

  gem build rugged_adapter.gemspec

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

#check() {
#  cd rugged_adapter
#
#  local _gemdir="$(gem env gemdir)"
#
#  GEM_HOME="tmp_install/${_gemdir}" rake test
#}

package() {
  cd rugged_adapter

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}

