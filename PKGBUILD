# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=licensee
_name=licensee
pkgver=9.16.1
pkgrel=1
pkgdesc="Detect under what license a project is distributed"
arch=(any)
url="https://github.com/licensee/licensee"
license=(MIT)
depends=(
  ruby
  ruby-dotenv
  ruby-octokit
  ruby-reverse_markdown
  ruby-rugged
  ruby-thor
)
makedepends=(
  git
  rubygems
)
checkdepends=(
  ruby-mustache
  ruby-rspec
  ruby-simplecov
  ruby-webmock
)
options=(!emptydirs)

_commit=7a206e936e479bf7dfaf396d7f6658f07319d6bd # git rev-parse "$pkgver"
source=("git+$url.git?signed#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') # GitHub (web-flow commit signing)

_archive="$pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$_name.gemspec"
}

build() {
  cd "$_archive"

  local _gemdir
  _gemdir="$(gem env gemdir)"

  gem build "$_name.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$_gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$_name-$pkgver.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$_gemdir/cache/" \
    "tmp_install/$_gemdir/doc/$_name-$pkgver/ri/ext/"

  find "tmp_install/$_gemdir/gems/" \
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

  find "tmp_install/$_gemdir/extensions/" \
    -type f \
    \( \
    -iname "mkmf.log" -o \
    -iname "gem_make.out" \
    \) \
    -delete
}

check() {
  cd "$_archive"

  export GIT_CONFIG_GLOBAL="$PWD/git.config"
  git config --global init.defaultBranch master
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

  _excluded_tests=(
    bin_spec.rb
    licensee/commands/detect_spec.rb
    licensee/commands/license_path_spec.rb
    licensee/commands/version_spec.rb
  )
  _exclude_pattern_arg="spec/{$(printf "%s," "${_excluded_tests[@]}")"
  _exclude_pattern_arg="${_exclude_pattern_arg%,}}"

  local _gemdir
  _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/$_gemdir" rspec \
    --exclude-pattern "$_exclude_pattern_arg"
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "$pkgdir"

  install --verbose -D --mode=0644 ./*.md --target-directory "$pkgdir/usr/share/doc/$pkgname"
  install --verbose -D --mode=0644 LICENSE.md --target-directory "$pkgdir/usr/share/licenses/$pkgname"
}
