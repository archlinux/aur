# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=god
pkgver=0.13.6
pkgrel=1
pkgdesc="A process monitoring framework in Ruby"
arch=('i686' 'x86_64')
url="http://godrb.com"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem
        god.service)
sha256sums=('691f862e96392d20788d8f50de5f08e7c6c79cac3d05a6a892623d36a7fff85c'
            '4b2ec4edbc94dd11b5178ec66846b94232157d1f9710de5f58fc2deb0a1e1596')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('god' 'ruby-god')
conflicts=('god' 'ruby-god')
install=god.install

_rbver=$(gem env gempath | awk -F: '{print $2}' | sed 's@.*gems/@@')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem

  msg 'Readying directories...'
  mkdir -p "$pkgdir"/{etc/god/conf.d,/var/log/god,}

  msg 'Installing executables in /usr/bin...'
  find "$pkgdir/usr/lib/ruby/gems/$_rbver/bin" -type f -execdir \
    install -Dm 755 '{}' "$pkgdir/usr/bin/"'{}' \;
  rm -rf "$pkgdir/usr/bin/home"

  msg 'Installing systemd service file...'
  install -Dm644 "$srcdir/god.service" "$pkgdir/usr/lib/systemd/system/god.service"
}
