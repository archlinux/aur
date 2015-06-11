# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_pkgname=mailcatcher
pkgname=ruby-$_pkgname
pkgver=0.6.1
pkgrel=3
pkgdesc='Catches mail and serves it through a dream.'
arch=('any')
url="http://$_pkgname.me"
license=('MIT')
depends=('ruby-activesupport' 'ruby-eventmachine' 'ruby-haml' 'ruby-mail' 'ruby-sinatra' 'ruby-skinny' 'ruby-sqlite3' 'ruby-thin')
makedepends=('rubygems')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=(!emptydirs)
install="$pkgname.install"
source=(
  "http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem"
  "$_pkgname.service"
  "$_pkgname-http.socket"
  "$_pkgname-http@.service"
  "$_pkgname-smtp.socket"
  "$_pkgname-smtp@.service"
)
md5sums=('bdeb5656e0931d1b211b52aa0f9e31f5'
         '877e07e9d8a2ddea3dd1d27644e77565'
         '26f37032d32b33b02388778d1d41601f'
         '2b9e475d3ba8d144b5fbf6f32162e3ac'
         '5d19076f812ba58be414955a7880d9d2'
         '0f7f88dd6c36fa69ea6635f27aa7d29b')
noextract=("$_pkgname-$pkgver.gem")

package() {
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-document --no-user-install --ignore-dependencies --install-dir "$pkgdir$_gemdir" --bindir "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"

  # Loosen version-specific dependencies
  sed -i '/dependency(%q<eventmachine>/{s/"<= 1.0.5", //}' "$pkgdir/usr/lib/ruby/gems/2.2.0/specifications/$_pkgname-$pkgver.gemspec"
  sed -i '/dependency(%q<thin>/{s/"~> 1.5.0"/"~> 1"/}' "$pkgdir/usr/lib/ruby/gems/2.2.0/specifications/$_pkgname-$pkgver.gemspec"

  # Install systemd units
  for file in "$_pkgname"{.service,{-http,-smtp}{@.service,.socket}}; do
    install -Dm644 "$file" "$pkgdir/usr/lib/systemd/system/$file"
  done
}
