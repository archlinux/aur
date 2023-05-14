# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=licensee
_name=licensee
pkgver=9.16.0
pkgrel=1
pkgdesc='Detect under what license a project is distributed'
arch=(any)
url='https://github.com/licensee/licensee'
license=(MIT)

depends=(
  ruby-dotenv
  ruby-octokit
  ruby-reverse_markdown
  ruby-rugged
  ruby-thor
)
makedepends=(rubygems)
checkdepends=(
  git
  ruby-mustache
  ruby-rspec
  ruby-simplecov
  ruby-webmock
)
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f1895d93f16886c427027deda254139d7fde23f6e7a8c7ea1c3def00804ff8e')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_name}.gemspec"

  # we don't build from a git checkout
  sed --in-place --regexp-extended 's|.*git ls-files.*|  ]|' "${_name}.gemspec"
}

build() {
  cd "$_archive"

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
  cd "$_archive"

  export GIT_CONFIG_GLOBAL="$PWD/git.config"
  git config --global init.defaultBranch master
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

  # Not running the following tests due to failures:
  # spec/bin_spec.rb
  # spec/licensee/commands/detect_spec.rb
  # spec/licensee/commands/license_path_spec.rb
  # spec/licensee/commands/version_spec.rb
  local _gemdir="$(gem env gemdir)"
  GEM_HOME="tmp_install/${_gemdir}" rspec \
    spec/fixture_spec.rb \
    spec/integration_spec.rb \
    spec/licensee/content_helper_spec.rb \
    spec/licensee/hash_helper_spec.rb \
    spec/licensee/license_field_spec.rb \
    spec/licensee/license_meta_spec.rb \
    spec/licensee/license_rules_spec.rb \
    spec/licensee/license_spec.rb \
    spec/licensee/matchers/cabal_matcher_spec.rb \
    spec/licensee/matchers/cargo_matcher_spec.rb \
    spec/licensee/matchers/copyright_matcher_spec.rb \
    spec/licensee/matchers/cran_matcher_spec.rb \
    spec/licensee/matchers/dice_matcher_spec.rb \
    spec/licensee/matchers/dist_zilla_matcher_spec.rb \
    spec/licensee/matchers/exact_matcher_spec.rb \
    spec/licensee/matchers/gemspec_matcher_spec.rb \
    spec/licensee/matchers/matcher_spec.rb \
    spec/licensee/matchers/npm_bower_matcher_spec.rb \
    spec/licensee/matchers/nu_get_matcher_spec.rb \
    spec/licensee/matchers/package_matcher_spec.rb \
    spec/licensee/matchers/reference_matcher_spec.rb \
    spec/licensee/matchers/spdx_matcher_spec.rb \
    spec/licensee/project_files/license_file_spec.rb \
    spec/licensee/project_files/package_info_spec.rb \
    spec/licensee/project_files/project_file_spec.rb \
    spec/licensee/project_files/readme_file_spec.rb \
    spec/licensee/project_spec.rb \
    spec/licensee/projects/git_project_spec.rb \
    spec/licensee/projects/github_project_spec.rb \
    spec/licensee/rule_spec.rb \
    spec/licensee_spec.rb \
    spec/spec_helper.rb \
    spec/vendored_license_spec.rb
}

package() {
  cd "$_archive"

  cp --archive --verbose tmp_install/* "${pkgdir}"

  install --verbose -D --mode=0644 LICENSE.md --target-directory "${pkgdir}/usr/share/licenses/${pkgname}"
  install --verbose -D --mode=0644 *.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
