# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge-config-ui-x
pkgver=4.41.1
pkgrel=1
pkgdesc="Web-based management tool for Homebridge"
arch=('any')
url="https://github.com/oznu/homebridge-config-ui-x"
license=('Apache')
depends=('nodejs' 'avahi' 'homebridge')
makedepends=(
  'git'
  'npm'
  'python'
  'node-gyp'
)
options=('!emptydirs' '!strip')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'systemd.service'
  'environment.conf'
  'tmpfiles.conf'
  'sysusers.conf'
)
b2sums=('30e27e383e08af0fa1c6525531143280c0c54e081378001abde17bcf038874c7c6a2654b2c37b82fbe85cb75ccdd6ed42890eaef0c940ac4547aec8c75348e25'
        '4cba429db47cc84567b08bbeb5a7e3238870df66cfbca241ece4b98354c4af0180688e3de6528b1fcc0cf6f3e19a645c08bf6457ee5c69d3f1609102363b2039'
        '178bf94ccaac2dbcbb908c98e724da60656766eb6058583e644ea6cd7014f928cb5ad018ebc37c17429ad0a3daf09d3903b51c0da3a40282163a3ff4fa78e5a0'
        'c60e965907e85b4a6dac12b60419b5446085794bdbdba0221c41e7557ff520c3688ff79b1219e17ac982d585f2cf616140717b44f8ad2a5e5a72fd360617be65'
        '87e6a3ddcd70bd926d17ec33b007dea4108b7386714404a12647508766189c7bf863ab47515396d2ea149da791053beacb6854fa0b57fc409c09cc6aeaffd7e5')

build() {
  cd "$pkgname-$pkgver"
  
  # install dependencies
  npm install
  
  # install subproject dependencies
  cd ui
  npm install

  cd "$srcdir/$pkgname-$pkgver"

  # generate dist dir
  npm run build

  # generate tarball
  npm pack
}

package() {
  cd "$pkgname-$pkgver"
  npm install --global --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver/$pkgname-$pkgver.tgz"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/cli/issues/1103 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
 
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"

  # systemd integration
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/homebridge.conf"
  install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/homebridge.conf"
  install -vDm644 "$srcdir/systemd.service" "$pkgdir/usr/lib/systemd/system/homebridge.service"
  install -vDm644 "$srcdir/environment.conf" "$pkgdir/etc/conf.d/homebridge"
}
