# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>

pkgname=licensee
pkgver=10.1.0
pkgrel=1
pkgdesc="Detect under what license a project is distributed"
arch=(any)
url="https://licensee.github.io/licensee"
license=(MIT)
depends=(
  ruby
  ruby-dotenv
  ruby-octokit
  ruby-reverse_markdown
  ruby-thor
)
makedepends=(
  git
  rubygems
)
checkdepends=(
  ruby-faraday-retry
  ruby-mustache
  ruby-rspec
  ruby-rugged
  ruby-simplecov
  ruby-webmock
)
optdepends=('ruby-rugged: Git repository scanning')
options=(!emptydirs)
source=("git+https://github.com/licensee/licensee.git#tag=v$pkgver")
sha256sums=('9073b6dad9879d6433ce90ce54aa247170fc66f58e624596a15040682219644c')

_archive="$pkgname"

prepare() {
  cd "$_archive"

  # Update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "$pkgname.gemspec"
}

build() {
  cd "$_archive"

  local gemdir="$(gem env gemdir)"

  gem build "$pkgname.gemspec"

  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "tmp_install/$gemdir" \
    --bindir "tmp_install/usr/bin" \
    "$pkgname-$pkgver.gem"

  # remove unrepreducible files
  rm --force --recursive --verbose \
    "tmp_install/$gemdir/cache/" \
    "tmp_install/$gemdir/doc/$pkgname-$pkgver/ri/ext/"

  find "tmp_install/$gemdir/gems/" \
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

  find "tmp_install/$gemdir/extensions/" \
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

  local excluded_tests=(
    bin_spec.rb
    licensee/commands/detect_spec.rb
    licensee/commands/diff_spec.rb
    licensee/commands/license_path_spec.rb
    licensee/commands/version_spec.rb
  )
  local excluded_tests_pattern="spec/{${excluded_tests[0]}$(printf ',%s' "${excluded_tests[@]:1}")}"

  GEM_HOME="tmp_install/$(gem env gemdir)" rspec \
    --exclude-pattern "$excluded_tests_pattern"
}

package() {
  cd "$_archive"

  cp -a -t "$pkgdir" tmp_install/*

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
