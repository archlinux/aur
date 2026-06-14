# Maintainer: Zeal Wierslee <zeal@wierslee.me>
pkgname=sugarjar
pkgver=3.0.0
pkgrel=1
pkgdesc="A git/github helper inspired by arcanist (and others)"
arch=('x86_64')
url="https://github.com/jaymzh/sugarjar"
license=('Apache')
depends=('git' 'github-cli' 'libxcrypt-compat' 'ruby' 'rubygems' 'ruby-mixlib-log' 'ruby-mixlib-shellout' 'ruby-pastel' 'ruby-deep_merge' 'ruby-rspec' 'glab')
source=("https://github.com/jaymzh/sugarjar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("abccb802954dbf1cf37941516e3f750c64d56f24c99a730585c49609135f3456")

package() {
  local _gemdir="$(env -i ruby -e'puts Gem.default_dir')"
  cd "$pkgname-$pkgver"

  gem build \
    --norc \
    --output "${pkgname}-${pkgver}.gem" \
    "${pkgname}.gemspec"

  gem install \
    --local \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    --bindir "$pkgdir/usr/bin" \
    "${pkgname}-${pkgver}.gem"

  mkdir -p -m755 "$pkgdir/etc/sugarjar"

  install -Dm644 "examples/sample_config.yaml" "$pkgdir/etc/sugarjar/sample_config.yaml"
  install -Dm644 "examples/sample_repoconfig.yaml" "$pkgdir/etc/sugarjar/sample_repoconfig.yaml"

  # If you use RVM the shebang will use the `ruby_executable_hooks` from your RVM installation, not the system one.
  # Since sugarjar is installed in the system ruby, we want it to use the correct install of ruby.
  sed -i "s%/usr/bin/env ruby_executable_hooks%/usr/bin/ruby%" "$pkgdir/usr/bin/sj"
}

check() {
  local _gemdir="$(env -i ruby -e'puts Gem.default_dir')"
  cd "$pkgname-$pkgver"

  #rspec .

  # Temporarily disable this tests to work around an issue
  # with forge_host not being properly mocked in the unit tests.
  # Shouldn't be necessary after 3.0.0
  rspec --exclude-pattern './spec/commands_spec.rb' .
}
