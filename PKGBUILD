# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_gemname=md2man
pkgname=ruby-md2man
pkgver=5.1.2
pkgrel=1
pkgdesc="Converts markdown into UNIX manpages and HTML webpages"
arch=('any')
url="http://sunaku.github.io/md2man/"
license=('ISC')
depends=('ruby' 'ruby-binman' 'ruby-redcarpet' 'ruby-rouge')
provides=('md2man' 'ruby-md2man')
conflicts=('md2man')
options=('!emptydirs')
source=("https://rubygems.org/downloads/$_gemname-$pkgver.gem")
noextract=("$_gemname-$pkgver.gem")
b2sums=('4487fb03c72f9b601ccac940369e0bd5511b63390ee6cf63d5e2edee5e8512441c7087e493c69159a0754cde5e999616cecd67cc49ab017238bba375ac96ace6')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install \
    --ignore-dependencies \
    --no-user-install \
    --no-document \
    --install-dir "$pkgdir/$_gemdir" \
    --bindir "$pkgdir/usr/bin" \
    "$_gemname-$pkgver.gem"

  # delete cache
  cd "$pkgdir/$_gemdir"
  rm -vrf cache

  # delete unnecessary files and folders
  cd "gems/$_gemname-$pkgver"
  rm -rf .gitignore man/man0 test
  find man -type f -regextype sed -not -regex ".*[[:digit:]]$" -delete

  # move documentation
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  mv -vt "$pkgdir/usr/share/doc/$pkgname" *.markdown

  # move license
  install -vd "$pkgdir/usr/share/licenses/$pkgname"
  mv -vt "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # move man pages
  mv -vt "$pkgdir/usr/share" man
}
