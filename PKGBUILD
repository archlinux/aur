# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

_pkgname=mailcatcher
pkgname=ruby-$_pkgname
pkgver=0.6.1
pkgrel=12
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
  "$_pkgname-http@.socket"
  "$_pkgname-http.service"
  "$_pkgname-smtp@.socket"
  "$_pkgname-smtp.service"
)
md5sums=('bdeb5656e0931d1b211b52aa0f9e31f5'
         'c6e70c3b5b061fb3e13ad56fea757b01'
         '5058d837ddef08507197a1cb17dcab34'
         'a3be575ff001fedc044ba43e6fdd31f7'
         '354d0e3422ef2f890ad5c598c709372b'
         'be35bfe4c621b7f2ff733e2c21bee54d')
noextract=("$_pkgname-$pkgver.gem")

package() {
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  local _gemdir="$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')"
  local _gemspec="$_gemdir/specifications/$_pkgname-$pkgver.gemspec"

  gem install --no-document --no-user-install --ignore-dependencies --install-dir "$_gemdir" --bindir "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
  rm "$_gemdir/cache/$_pkgname-$pkgver.gem"

  # Loosen version-specific dependencies
  sed -i '/dependency(%q<eventmachine>/{s/".*"/"~> 1"/}' $_gemspec
  sed -i '/dependency(%q<thin>/{s/".*"/"~> 1"/}' $_gemspec

  # Install systemd units
  for file in "$_pkgname"{.service,{-http,-smtp}{.service,@.socket}}; do
    install -Dm644 "$file" "$pkgdir/usr/lib/systemd/system/$file"
  done
}
