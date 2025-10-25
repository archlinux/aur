# Maintainer: Matt Cuneo <m@cuneo.au>

_name=photon
pkgname="$_name-lemmy"
pkgver=2.1.1
pkgrel=1
pkgdesc='An alternative front end for Lemmy'
arch=('any')
url="https://github.com/Xyphyn/$_name"
license=('AGPL3')
depends=(
  'bun'
)
backup=('etc/photon-lemmy/config.env')
source=(
  "$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
  'config.env'
)
b2sums=('0920eee59b3ee30019ceabfae2bc9fbeb650cdedd863e020b21ab728ce1f07b0c813dd16c813efa13ce71d8698b8c8045ffd722383f315e036a5c3273662b69e'
        'bed8fd89aac2ee4e33f14605a0bccad351d33164b002ee5c0fe8c46a4b97f6d8387b49321a734fbf2eb67256310cb7e9e9e8bffe8210d1107cf04882d87f1cd5'
        '02f70ad3274186cb9f5ba50e0717ebf17fc76450816174ed761d1c8a37c5f08bd906a1fe0573db647c92d91f900c67f9595478c625c2d22cf98f3769b55198d1'
        '4c403c969af4489b80fd76e662aa3a9fce354bb6441a5c68f4309205954fb71df2e29e45e6d87196db6ce0eeb157fb2d956e9b264507523eecf548ce29687c4e'
        '22567c2e2fac19a9c1acbb3ea2e811b30847429a2a14fafa21991fc8281a24bc3acb111b78e3a83b9261c193349156ccdd5b0fa20aa7c1fcd2113af47857e053')
build() {
  cd "$_name-$pkgver"
  bun install
  ADAPTER=bun bun run build
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
