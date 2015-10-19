# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=god
pkgver=0.13.7
pkgrel=1
pkgdesc="A process monitoring framework in Ruby"
arch=('i686' 'x86_64')
url="http://godrb.com"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem
        god.service)
sha256sums=('3f8ea08b39310d55a20d54308b4cba6c5c88d35f9796b271d7f38dc93802f8f2'
            '4b2ec4edbc94dd11b5178ec66846b94232157d1f9710de5f58fc2deb0a1e1596')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('god' 'ruby-god')
conflicts=('god' 'ruby-god')
install=god.install

_rbver=$(gem env gempath | awk -F: '{print $2}' | sed 's@.*gems/@@')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem

  msg2 'Readying directories...'
  mkdir -p "$pkgdir"/{etc/god/conf.d,/var/log/god,}

  msg2 'Installing executables in /usr/bin...'
  find "$pkgdir/usr/lib/ruby/gems/$_rbver/bin" -type f -execdir \
    install -Dm 755 '{}' "$pkgdir/usr/bin/"'{}' \;
  rm -rf "$pkgdir/usr/bin/home"

  msg2 'Installing systemd service file...'
  install -Dm644 "$srcdir/god.service" "$pkgdir/usr/lib/systemd/system/god.service"
}
