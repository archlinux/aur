# Maintainer: Matt Cuneo <m@cuneo.au>

_name=photon
pkgname="$_name-lemmy"
pkgver=1.25.2
pkgrel=1
pkgdesc='An alternative front end for Lemmy'
arch=('any')
url="https://github.com/Xyphyn/$_name"
license=('AGPL3')
depends=(
  'nodejs'
)
makedepends=(
  'npm'
)
backup=('etc/photon-lemmy/config.env')
source=(
  "$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
  'config.env'
)
b2sums=('387c47736e9a26d2f89947a7ac9e89cd8796ae4d1347100213403d6471cca314c1f60af54e3c1fc416e0959ec122c04b1a7817cc461ecbdc99abf87ec05f9199'
        'fa15b1362b4a794464577181eada8432bff9842a4f0a29c4096e203139b3f333d2c25d7837f507fbfd0544a2631ed2321409e2b864a85e6faadcbea35345d2cf'
        '02f70ad3274186cb9f5ba50e0717ebf17fc76450816174ed761d1c8a37c5f08bd906a1fe0573db647c92d91f900c67f9595478c625c2d22cf98f3769b55198d1'
        '5c09b5b05a7e5438912fb73d140683dbaab5a450af194ec97dbc30e4118ce21e769dbb6034c40a7d3ffabfaf3b4bf757ed12d189bd9ae6fe99c084063cc52328'
        '22567c2e2fac19a9c1acbb3ea2e811b30847429a2a14fafa21991fc8281a24bc3acb111b78e3a83b9261c193349156ccdd5b0fa20aa7c1fcd2113af47857e053')

build() {
  cd "$_name-$pkgver"

  npm install
  ADAPTER=node npm run build
  rm -rf node_modules
  npm ci --omit dev
}

package() {
  # systemd integration
  install -vDm644 config.env "$pkgdir/etc/$pkgname/config.env"
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$_name-$pkgver"

  # binary
  install -vd "$pkgdir/usr/share/$pkgname"
  cp -R build node_modules package.json "$pkgdir/usr/share/$pkgname"
}
