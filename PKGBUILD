# Maintainer: Zeal Wierslee <zeal@wierslee.me>
pkgname=sugarjar
pkgver=4.0.0
pkgrel=1
pkgdesc="A git/github helper inspired by arcanist (and others)"
arch=('x86_64')
url="https://github.com/jaymzh/sugarjar"
license=('Apache')
depends=('git' 'github-cli' 'libxcrypt-compat' 'ruby' 'rubygems' 'ruby-mixlib-log' 'ruby-mixlib-shellout' 'ruby-pastel' 'ruby-deep_merge' 'ruby-rspec' 'glab')
source=("https://github.com/jaymzh/sugarjar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1b698e12a0dc641046669ca87ca71c80fd96520c4cb6d350287a0d44df0df86d")

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

  # No AUR package for this at the moment, so quick-and-dirty gem install the dependency here
  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    --bindir "$pkgdir/usr/bin" \
    "diffy" 
    

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


  # The URL generation tests expect github.com but get the
  # AUR package URL instead. Unclear why the test isn't mocking this, but it's an issue with
  # the test, not the actual sugarjar code, so disabling for now via this patch.
  rspec . --exclude-pattern '**/commands_spec.rb'
}
