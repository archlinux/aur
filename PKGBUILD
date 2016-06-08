# Maintainer: James An <james@jamesan.ca>
# Contributor: fzerorubigd <fzerorubigd {AT} gmail>

pkgname=ruby-mailcatcher
_pkgname="${pkgname#ruby-}"
pkgver=0.6.3
pkgrel=2
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
  "https://github.com/sj26/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.gem"
  "$_pkgname.service"
  "$_pkgname-http@.socket"
  "$_pkgname-http.service"
  "$_pkgname-smtp@.socket"
  "$_pkgname-smtp.service"
)
md5sums=('SKIP'
         'c6e70c3b5b061fb3e13ad56fea757b01'
         '5058d837ddef08507197a1cb17dcab34'
         'a3be575ff001fedc044ba43e6fdd31f7'
         '354d0e3422ef2f890ad5c598c709372b'
         'be35bfe4c621b7f2ff733e2c21bee54d')
noextract=("$_pkgname-$pkgver.gem")

# Derive the latest release's version string from its tag name.
pkgver() {
    (
        set -o pipefail
        curl https://api.github.com/repos/sj26/mailcatcher/releases/latest |
        sed -n '/"tag_name"/{s/^ \+"tag_name": "v\?\([^"]*\)",/\1/;p}'
    )
}

package() {
  # _gemdir is defined inside package() because if ruby[gems] is not installed on
  # the system, makepkg will exit with an error when sourcing the PKGBUILD.
  _gemdir="$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')"
  _gemspec="$_gemdir/specifications/$_pkgname-$pkgver.gemspec"

  echo $_gemdir
  echo $_gemspec
  echo "$_pkgname-$pkgver.gem"

  gem install --no-document --no-user-install --ignore-dependencies --install-dir "$_gemdir" --bindir "$pkgdir/usr/bin" "$_pkgname-$pkgver.gem"
  rm "$_gemdir/cache/$_pkgname-$pkgver.gem"

  # Loosen version-specific dependencies (doesn't appear to affect the software)
  sed -i '/dependency(%q<eventmachine>/{s/".*"/"~> 1"/}' $_gemspec
  sed -i '/dependency(%q<thin>/{s/".*"/"~> 1"/}' $_gemspec

  # Install systemd units
  for file in "$_pkgname"{.service,{-http,-smtp}{.service,@.socket}}; do
    install -Dm644 "$file" "$pkgdir/usr/lib/systemd/system/$file"
  done
}
