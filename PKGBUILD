# Maintainer: Jamin Collins <jamin.collins@gmail.com>

_gemname=omnigollum
pkgname=$_gemname
pkgver=0.1.5
pkgrel=1
pkgdesc='OmniAuth for Gollum.'
arch=(any)
url='https://github.com/arr2036/omnigollum'
license=(MIT)
depends=(
    ruby
)
options=(!emptydirs)

_omniauth=omniauth-1.8.1.gem
_omniauth_ldap=omniauth-ldap-2.0.0.gem
_hashie=hashie-3.5.7.gem
_net_ldap=net-ldap-0.16.1.gem
_pyu_ruby_sasl=pyu-ruby-sasl-0.0.3.3.gem
_rubyntlm=rubyntlm-0.6.2.gem
source=(
    https://rubygems.org/downloads/$_gemname-$pkgver.gem
    enabled-indicator.patch
    https://rubygems.org/downloads/$_omniauth
    https://rubygems.org/downloads/$_omniauth_ldap
    https://rubygems.org/downloads/$_hashie
    https://rubygems.org/downloads/$_net_ldap
    https://rubygems.org/downloads/$_pyu_ruby_sasl
    https://rubygems.org/downloads/$_rubyntlm
    https://raw.githubusercontent.com/arr2036/omnigollum/master/config.rb.example
)
sha256sums=('ac04e9de6951a30601b68871a48028d0627141b9e9a7b58368debe4dc4359073'
            '85e66e8349cf959a2d443dc461c62498920d500b2c0e5f4c8e5e197e0f81217a'
            'afbee730b76811af34884fc82b372ca9ecac631225a19707ddcdd58331c958d7'
            'c2b554f9f53f627ff05057b1898516e4ad529ed28bb150a38472ac2192a752fa'
            'ab1bfea321472acaf2e4d621469dd01977547787a876a2fb69a742e496a705c2'
            'f0492138e45da35f961d329ee27c9d5aac8a7d866b95fb31671fa9803e7ed104'
            '5683a6bc5738db5a1bf5ceddeaf545405fb241b4184dd4f2587e679a7e9497e5'
            'be81d7cbe7042c3a582299d89f0b07ef142b9854d260b648b498ad49a7eecbdc'
            'e62eb216aa5c71427811f264061e02f1834b6a67328708ed6683b28c3704a8a4')
noextract=(
    $_omniauth
    $_omniauth_ldap
    $_hashie
    $_net_ldap
    $_pyu_ruby_sasl
    $_rubyntlm
    $_gemname-$pkgver.gem
)

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    $_omniauth \
    $_omniauth_ldap \
    $_hashie \
    $_net_ldap \
    $_pyu_ruby_sasl \
    $_rubyntlm \
    $_gemname-$pkgver.gem

  # apply the patch
  pushd "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/"
  patch -p1 < $srcdir/enabled-indicator.patch
  popd

  # remove some build path leakage
  find "$pkgdir/$_gemdir/" -name "gem_make.out" | xargs rm -f

  rm -rf "$pkgdir/$_gemdir/cache"
  install \
    -D \
    --mode=644 \
    "config.rb.example" \
    "$pkgdir/usr/share/doc/$pkgname/config.rb.example"
  install \
    -D \
    --mode=644 \
    "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
