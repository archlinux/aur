# Maintainer: Zeal Wierslee <zeal@wierslee.me>
pkgname=sugarjar
pkgver=1.1.0
pkgrel=1
pkgdesc="A git/github helper inspired by arcanist (and others)"
arch=('x86_64')
url="https://github.com/jaymzh/sugarjar"
license=('Apache')
depends=('git' 'hub' 'libxcrypt-compat' 'ruby' 'rubygems' 'ruby-mixlib-log' 'ruby-mixlib-shellout' 'ruby-pastel')
source=("https://github.com/jaymzh/sugarjar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5a75fab10cfb1509ae9e7ee5cfced13afbfec19e44e5020acf4a219f9c04f79c")

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

  # If you use RVM the shebang will use the `ruby_executable_hooks` from your RVM installation, not the system one.
  # Since sugarjar is installed in the system ruby, we want it to use the correct install of ruby.
  sed -i "s%/usr/bin/env ruby_executable_hooks%/usr/bin/ruby%" "$pkgdir/usr/bin/sj"
}
