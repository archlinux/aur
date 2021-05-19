# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge-config-ui-x
pkgver=4.41.1
pkgrel=2
pkgdesc="Web-based management tool for Homebridge"
arch=('any')
url="https://github.com/oznu/homebridge-config-ui-x"
license=('MIT')
depends=('homebridge')
makedepends=('npm')
options=('!emptydirs' '!strip')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
install="$pkgname.install"
b2sums=('30e27e383e08af0fa1c6525531143280c0c54e081378001abde17bcf038874c7c6a2654b2c37b82fbe85cb75ccdd6ed42890eaef0c940ac4547aec8c75348e25'
        'a0861270612dfe3ee33fab9fda23ab351625a76bfc006d44f39387c8b4fd7b67b7937d8c6dc94dbb584fe6e3fa657fd8754d3c823f2a2dd3d93f210d6b5d8102'
        'c60e965907e85b4a6dac12b60419b5446085794bdbdba0221c41e7557ff520c3688ff79b1219e17ac982d585f2cf616140717b44f8ad2a5e5a72fd360617be65'
        '17039410c1e7aa8efd781a6a9acd31084a632998f0ea57f0df40fa028d12527b24bec71fdf28691b8e23fbfdef10c9b327875477ee113ffa9ad022d84a35552e')

build() {
  cd "$pkgname-$pkgver"
  
  # NOTE: package is built this way because the dist/ directory is not
  # included in the source, only in npm source due to a prepublish script
  # which does not get installed correctly if the npm source is used.

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
  npm install --global --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"
 
  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE"

  # systemd integration
  install -vDm644 "$srcdir/sysusers.conf" \
    "$pkgdir/usr/lib/sysusers.d/homebridge.conf"
  install -vDm644 "$srcdir/tmpfiles.conf" \
    "$pkgdir/usr/lib/tmpfiles.d/homebridge.conf"
  install -vDm644 "$srcdir/systemd.service" \
    "$pkgdir/usr/lib/systemd/system/homebridge.service"
}
