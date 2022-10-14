# Maintainer: Zeal Wierslee <zeal@wierslee.me>
pkgname=sugarjar
pkgver=0.0.11
pkgrel=2
pkgdesc="A git/github helper inspired by arcanist (and others)"
arch=('x86_64')
url="https://github.com/jaymzh/sugarjar"
license=('Apache')
depends=('git' 'hub' 'libxcrypt-compat' 'ruby' 'rubygems' 'ruby-mixlib-log' 'ruby-mixlib-shellout' 'ruby-pastel')
source=("https://github.com/jaymzh/sugarjar/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1706a82e75ef7ac0469b8f7e9f6d0105cf731cd77280079464c2cfe89f86bef9")

package() {
  local _gemdir="$(env -i ruby -e'puts Gem.default_dir')"
  cd "$pkgname-$pkgver"
  gem install \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}/${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    --bindir "$pkgdir/usr/bin" \
    "${pkgname}-${pkgver}.gem"

  # If you use RVM the shebang will use the `ruby_executable_hooks` from your RVM installation, not the system one.
  # Since sugarjar is installed in the system ruby, we want it to use the correct install of ruby.
  sed -i "s%/usr/bin/env ruby_executable_hooks%/usr/bin/ruby%" "$pkgdir/usr/bin/sj"

  rm "${pkgdir}/${_gemdir}/cache/${pkgname}-${pkgver}.gem"
}
