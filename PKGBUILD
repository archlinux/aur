# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=homebridge-config-ui-x
pkgver=4.41.2
pkgrel=1
pkgdesc="Web-based management tool for Homebridge"
arch=('any')
url="https://github.com/oznu/homebridge-config-ui-x"
license=('MIT')
depends=('homebridge' 'npm')
options=('!emptydirs' '!strip')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  'systemd.service'
  'tmpfiles.conf'
  'sysusers.conf'
)
install="$pkgname.install"
sha512sums=('8f2431de0d63ad89d01813b44338e7165da8456b6bc909044d578bd80e991bbc867a3e1fa4f32aeb5943470b05abd345afb7880da9085ee3129b6d2f7c8d4ee4'
            '6a758eeea0cee8e262e9209226b3c4ff5e8982f8d3671bfb18287656eca71309694f3f9f11317ce80696991640fa277771ec21536546ea46d2565f64e08fff44'
            '68e756b0b6b78a53b1198bf630821abe470293c53ebd74d5a42acd589b41940920cfc949853695270f4b5de7c6e7e1b3d42d408694eec8551782a4ef163baeb1'
            'a1722316d9c2e2130a3a7c808fc6570e0176863b72f0a8c511bd8a5a5a5a3c9064f22c25479ca43c856facdcc67d8c161feeefc1225e543471c73b693a493313')
b2sums=('723f411f6fe219b24d8a5fb7a7aaa9fabc2913555b8676481ddc95b0672f279a22dcf2ca4e8798f0bb92cd285c9bfd91a892dd2c621ffaae5ede9e159b5b6274'
        'a0861270612dfe3ee33fab9fda23ab351625a76bfc006d44f39387c8b4fd7b67b7937d8c6dc94dbb584fe6e3fa657fd8754d3c823f2a2dd3d93f210d6b5d8102'
        'c60e965907e85b4a6dac12b60419b5446085794bdbdba0221c41e7557ff520c3688ff79b1219e17ac982d585f2cf616140717b44f8ad2a5e5a72fd360617be65'
        '17039410c1e7aa8efd781a6a9acd31084a632998f0ea57f0df40fa028d12527b24bec71fdf28691b8e23fbfdef10c9b327875477ee113ffa9ad022d84a35552e')

build() {
  cd "$pkgname-$pkgver"

  # NOTE: package is built this way because the dist/ directory is not
  # included in the source, only in npm source due to a prepublish script
  # which does not get installed correctly if the npm source is used.

  # ensure npm is quiet
  local NPM_FLAGS=(--no-audit --no-fund --no-update-notifier)

  # install dependencies
  npm install --cache "$srcdir/npm-cache" "${NPM_FLAGS[@]}"

  # install subproject dependencies
  cd ui
  npm install --cache "$srcdir/npm-cache" "${NPM_FLAGS[@]}"

  cd "$srcdir/$pkgname-$pkgver"

  # generate dist dir
  npm run build "${NPM_FLAGS[@]}"

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
