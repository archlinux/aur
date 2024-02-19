# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge-config-ui-x
pkgver=4.55.1
pkgrel=1
pkgdesc='Web-based management tool for Homebridge'
arch=('any')
url='https://github.com/oznu/homebridge-config-ui-x'
license=('MIT')
depends=('homebridge' 'nodejs')
makedepends=('npm')
options=('!emptydirs' '!strip')
source=(
  "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
install="$pkgname.install"
sha512sums=('5e88f008e101e8bb09798b7a3456a45c6088b3d58503fc62ada5610b5475fbffdb40f9afd53d45dec66facfc69d544c12cac68c53dfb48c76dab4bacf294726b'
            '6a758eeea0cee8e262e9209226b3c4ff5e8982f8d3671bfb18287656eca71309694f3f9f11317ce80696991640fa277771ec21536546ea46d2565f64e08fff44'
            '68e756b0b6b78a53b1198bf630821abe470293c53ebd74d5a42acd589b41940920cfc949853695270f4b5de7c6e7e1b3d42d408694eec8551782a4ef163baeb1'
            'a1722316d9c2e2130a3a7c808fc6570e0176863b72f0a8c511bd8a5a5a5a3c9064f22c25479ca43c856facdcc67d8c161feeefc1225e543471c73b693a493313')
b2sums=('e9021bd2ca6306da4ac0d2a8a1d9eda6530e4d5b3950aa95fb177d2191ac3dc00898e2935a5a724cb6bc807b8de988baefeaffb744431862eae21963b6f596b2'
        'a0861270612dfe3ee33fab9fda23ab351625a76bfc006d44f39387c8b4fd7b67b7937d8c6dc94dbb584fe6e3fa657fd8754d3c823f2a2dd3d93f210d6b5d8102'
        'c60e965907e85b4a6dac12b60419b5446085794bdbdba0221c41e7557ff520c3688ff79b1219e17ac982d585f2cf616140717b44f8ad2a5e5a72fd360617be65'
        '17039410c1e7aa8efd781a6a9acd31084a632998f0ea57f0df40fa028d12527b24bec71fdf28691b8e23fbfdef10c9b327875477ee113ffa9ad022d84a35552e')

package() {
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)
  npm install \
    --global \
    --prefix "$pkgdir/usr" \
    "${NPM_FLAGS[@]}" \
    "$pkgname-$pkgver.tgz"

  # remove a non-runtime file that kills the packaging step
  rm -r "$pkgdir/usr/lib/node_modules/$pkgname/node_modules/@fastify/send/test/fixtures/snow ☃/"

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
