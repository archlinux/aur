# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Maintainer: Bret Comnes <bcomnes@gmail.com>

pkgname=homebridge-config-ui-x
pkgver=4.55.1
pkgrel=6
pkgdesc='Web-based management tool for Homebridge'
arch=('any')
url='https://github.com/oznu/homebridge-config-ui-x'
license=('MIT')
depends=('homebridge' 'nodejs')
makedepends=('npm' 'jq')
options=('!emptydirs' '!strip')
source=(
  "https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
  'systemd.service'
  'systemd.env'
  'tmpfiles.conf'
  'sysusers.conf'
)
noextract=("$pkgname-$pkgver.tgz")
install="$pkgname.install"
sha512sums=('5e88f008e101e8bb09798b7a3456a45c6088b3d58503fc62ada5610b5475fbffdb40f9afd53d45dec66facfc69d544c12cac68c53dfb48c76dab4bacf294726b'
            '2802f787e1ed60105c853576294552ab6bf544588576bb07c3c8af2ad98be70d2401ef79d746cfe574dd340ca2121c496c552d8cf84a3ae0bdcf668d3bb5725b'
            'ac1e506ea0ed97580bface4afdeb6535168fc187d3c1e88bd44d7be6cc4ac1f4b030553bcbbaadf8cecbe6847d41f59f0cb7e4dca0eddbe3684f6d33e023badb'
            '68e756b0b6b78a53b1198bf630821abe470293c53ebd74d5a42acd589b41940920cfc949853695270f4b5de7c6e7e1b3d42d408694eec8551782a4ef163baeb1'
            'a1722316d9c2e2130a3a7c808fc6570e0176863b72f0a8c511bd8a5a5a5a3c9064f22c25479ca43c856facdcc67d8c161feeefc1225e543471c73b693a493313')
b2sums=('e9021bd2ca6306da4ac0d2a8a1d9eda6530e4d5b3950aa95fb177d2191ac3dc00898e2935a5a724cb6bc807b8de988baefeaffb744431862eae21963b6f596b2'
        '02079c6475bd1d4a1741dd73a6fb5b5a8fdd41049d85c24247eda8e0614f386f48bff77c49de3772fcf2753d0b64bb5932a40c1c441cf0d7a5b00b1426e9514c'
        '739dedb161f3f35da7c423c1298fbb0d4b88c2886382ea17d842469f8d02a11ea4e8fb3322e9b2c05b5235ce87391dcf205b58b42b7ee2fd8289aa1086edc3a0'
        'c60e965907e85b4a6dac12b60419b5446085794bdbdba0221c41e7557ff520c3688ff79b1219e17ac982d585f2cf616140717b44f8ad2a5e5a72fd360617be65'
        '17039410c1e7aa8efd781a6a9acd31084a632998f0ea57f0df40fa028d12527b24bec71fdf28691b8e23fbfdef10c9b327875477ee113ffa9ad022d84a35552e')

package() {
  npm install \
    --global \
    --cache "${srcdir}/npm-cache" \
    --prefix "$pkgdir/usr" \
    --no-audit --no-fund --no-update-notifier \
    "$srcdir/$pkgname-$pkgver.tgz"

  # remove a non-runtime file that kills the packaging step
  rm -r "$pkgdir/usr/lib/node_modules/$pkgname/node_modules/@fastify/send/test/fixtures/snow ☃/"

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
  install -vDm644 "$srcdir/systemd.env" \
    "$pkgdir/etc/default/homebridge"


  # Clean up srcdir references
  # https://wiki.archlinux.org/title/Node.js_package_guidelines#Package_contains_reference_to_$srcdir/$pkgdir
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  local tmppackage="$(mktemp)"
  local pkgjson="$pkgdir/usr/lib/node_modules/$pkgname/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "$pkgjson" > "$tmppackage"
  mv "$tmppackage" "$pkgjson"
  chmod 644 "$pkgjson"

  find "$pkgdir" -type f -name package.json | while read pkgjson; do
    local tmppackage="$(mktemp)"
    jq 'del(.man)' "$pkgjson" > "$tmppackage"
    mv "$tmppackage" "$pkgjson"
    chmod 644 "$pkgjson"
  done
}
