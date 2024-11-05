# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Mario Finelli <mario at finel dot li>
pkgname=ruby-bump
pkgver=0.10.0
_commit=73c206174ca02549d120402b9a007db0d0bc9699
pkgrel=6
pkgdesc='Bump your gem version file'
arch=(any)
url='https://github.com/gregorym/bump'
license=(MIT)
depends=(
  ruby
)
makedepends=(
  git
  ruby-rdoc
)
checkdepends=(
  ruby-bundler
  ruby-byebug
  ruby-rake
  ruby-rspec
  ruby-rubocop
)
options=(!emptydirs)
source=(git+https://github.com/gregorym/bump.git#commit=$_commit)
sha256sums=('SKIP')

prepare() {
  cd bump
  git config user.email "pony@arch"
  git config user.name "Lucky Pony"
}

build() {
  local _gemdir="$(gem env gemdir)"
  cd bump
  gem build bump.gemspec
  gem install \
    --local \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "../tmp_install/$_gemdir" \
    --bindir "../tmp_install/usr/bin" \
    bump-$pkgver.gem
  find "../tmp_install/$_gemdir/gems/" \
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
  rm -r ../tmp_install/$_gemdir/cache
}

check() {
  local _gemdir="$(gem env gemdir)"
  cd bump
  GEM_HOME="../tmp_install/$_gemdir" rake spec
}

package() {
  cd bump
  cp -a ../tmp_install/* "$pkgdir"/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
