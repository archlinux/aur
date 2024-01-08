# Maintainer: Matt Cuneo <m@cuneo.au>

_name=photon
pkgname="$_name-lemmy"
pkgver=1.25.2
pkgrel=2
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
        'cb52a8b9c6bacf1a458ce778958b4417de5b214ba1e8fa67f8a7951441a7fe2d4b1c4959a55bfd20a97b70e3fbdb77857e716d2a8b1ecf3831e1bc31fafae44d'
        '02f70ad3274186cb9f5ba50e0717ebf17fc76450816174ed761d1c8a37c5f08bd906a1fe0573db647c92d91f900c67f9595478c625c2d22cf98f3769b55198d1'
        '4c403c969af4489b80fd76e662aa3a9fce354bb6441a5c68f4309205954fb71df2e29e45e6d87196db6ce0eeb157fb2d956e9b264507523eecf548ce29687c4e'
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
