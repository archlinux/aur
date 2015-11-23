# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=eye
pkgver=0.8
pkgrel=1
pkgdesc="Process monitoring tool inspired by Bluepill and God"
arch=('any')
url="https://github.com/kostya/eye"
license=('MIT')
depends=('ruby'
         'ruby-celluloid'
         'ruby-celluloid-io'
         'ruby-sigar'
         'ruby-state_machine'
         'ruby-thor'
         'ruby-timers')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem
        eye.service)
sha256sums=('9071e75d0423028c0ee1c4bac6c0ff1f69bee93640b3f6c85b60a81edf27838e'
            'db91c9344e409635f66a981bd2735e8c34484f0246f06c1cdc5ad516ddcbdf5b')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('eye' 'ruby-eye')
conflicts=('eye' 'ruby-eye')
install=eye.install

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
  mkdir -p "$pkgdir"/{etc/eye/conf.d,/var/log/eye,}

  msg2 'Installing executables in /usr/bin...'
  find "$pkgdir/usr/lib/ruby/gems/$_rbver/bin" -type f -execdir \
    install -Dm 755 '{}' "$pkgdir/usr/bin/"'{}' \;
  rm -rf "$pkgdir/usr/bin/home"

  msg2 'Installing systemd service file...'
  install -Dm 644 "$srcdir/eye.service" "$pkgdir/usr/lib/systemd/system/eye.service"
}
