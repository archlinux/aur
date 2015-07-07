# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_pkgname=mailcatcher
pkgname=ruby-$_pkgname
pkgver=0.6.1
pkgrel=4
pkgdesc='Catches mail and serves it through a dream.'
arch=('any')
url="http://$_pkgname.me"
license=('MIT')
depends=('ruby-activesupport' 'ruby-eventmachine' 'ruby-haml' 'ruby-mail' 'ruby-sinatra' 'ruby-skinny' 'ruby-sqlite3' 'ruby-thin')
makedepends=('rubygems')
provides=("$_pkgname" 'smtp-forwarder')
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
         'cf357f9859b6f24210d07ccce7313879'
         'd21981c2877a578555bcd61c0c6bc718'
         'a8a07564d971bc1df3cc786cda27c333'
         '2c1d5788aff53e89600f037b523cab69'
         '8e57104285979856653f99e5564b613d')
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
