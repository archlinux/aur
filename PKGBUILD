# Maintainer: Tim Meusel <tim@bastelfreak.de>
_gemname="nats-pure"
_gembuilder=("install"
             "fix")
_gem="/usr/bin/gem"
pkgname="ruby-nats-pure"
pkgver="0.2.4"
pkgrel=1
pkgdesc="NATS is an open-source, high-performance, lightweight cloud messaging system."
arch=("any")
url="https://nats.io"
license=("MIT")
depends=("ruby")
source=("https://rubygems.org/gems/$_gemname-$pkgver.gem")
sha512sums=("32cd6df93a050004d116b25a0db1b8c3844aaa8f3047b431eaf5285531b4b3ae791272d1e2e20c19fa529ab0329d579b2c8a4393723e3a9fa31410102e9fad11")
noextract=("$_gemname-$pkgver.gem")
options=("!emptydirs")

_gem_install() {
  msg 'Installing gem...'

  # Install the gem
  install -d -m755 $_bindir $_gemdir
  $_gem install --no-ri --no-rdoc --ignore-dependencies --no-user-install \
                --bindir $_bindir --install-dir $_gemdir "$srcdir/$_gemname-$pkgver.gem"
}

_gem_fix() {
  msg 'Fixing gem installation...'

  # Set mode of executables to 755
  [[ -d "$_gemdir/bin" ]] && find "$_gemdir/bin" -type f -exec chmod 755 -- '{}' ';'

  # Remove cached gem file
  rm -f "$_gemdir/cache/$_gemname-$pkgver.gem"

  # Sometimes there are files which are not world readable. Fix this.
  find $pkgdir -type f '!' -perm '-004' -exec chmod o+r -- '{}' ';'
}

_gem_cleanext() {
  msg 'Removing native build leftovers...'
  local extdir="$_gemdir/gems/$_gemname-$pkgver/ext"
  [[ -d $extdir ]] && find "$extdir" -name '*.o' -exec rm -f -- '{}' ';'
}

_rbconfig() {
  ruby -e "require 'rbconfig'; puts RbConfig::CONFIG['$1']"
}

package() {
  # Directories defined inside build() because if ruby is not installed on the system
  # makepkg will barf when sourcing the PKGBUILD
  _gemdestdir=$($_gem environment gemdir)
  _gemdir=$pkgdir$_gemdestdir
  _bindir=$pkgdir$(_rbconfig bindir)

  local i
  for i in ${_gembuilder[@]}; do
    _gem_$i
  done
}
