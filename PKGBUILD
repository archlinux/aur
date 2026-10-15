# Maintainer: Josia Pietsch <arch@jrpie.de>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

# Based on extra/forgejo. This is a drop-in replacement using the statically compiled binary provided by forgejo.

_appname=forgejo
pkgname="${_appname}-bin"
pkgver=17.0.0
pkgrel=1
pkgdesc='A lightweight software forge'
arch=('x86_64' 'aarch64')
url='https://forgejo.org'
license=(GPL-3.0-or-later)
depends=(
  git
)
optdepends=(
  'mariadb: MariaDB support'
  'memcached: MemCached support'
  'openssh: GIT over SSH support'
  'pam: Authentication via PAM support'
  'postgresql: PostgreSQL support'
  'valkey: Redis support'
)
provides=("${_appname}")
conflicts=("${_appname}")
backup=(etc/${_appname}/app.ini)
options=(!debug)
validpgpkeys=('EB114F5E6C0DC2BCDD183550A4B61A2DC5923710') # Forgejo Releases <release@forgejo.org>; see https://forgejo.org/download/#:~:text=EB114F5E6C0DC2BCDD183550A4B61A2DC5923710

# taken from extra/forgejo
source=(
  systemd.service
  sysusers.conf
  tmpfiles.conf
  app.ini # see use-correct-variables.patch in extra/forgejo
)
source_x86_64=(
  "$_appname::https://codeberg.org/forgejo/forgejo/releases/download/v$pkgver/forgejo-$pkgver-linux-amd64"
  "$_appname.asc::https://codeberg.org/forgejo/forgejo/releases/download/v$pkgver/forgejo-$pkgver-linux-amd64.asc"
)

source_aarch64=(
  "$_appname::https://codeberg.org/forgejo/forgejo/releases/download/v$pkgver/forgejo-$pkgver-linux-arm64"
  "$_appname.asc::https://codeberg.org/forgejo/forgejo/releases/download/v$pkgver/forgejo-$pkgver-linux-arm64.asc"
)

sha512sums=('a88aefed4aaee9c4d356444a2b3cbad384e07d738da4c87c7298744222ed784c6d5079d74596b8440605da0ad85699ced20106897c345a12994bd1d3ee84da37'
            '7eb2766c06bb0e104da5860c16fbb9743220b01eec2760a84353b315d0d91a03a10939a105a8b06c6e074782cb76d26e0af8bf8f10881fef6e942dc43300208a'
            'f18cbfa60912221b29e3b3b824c77571797ac76b90cacd28f2014f295c90c964990d4d5079822d280681fa6b0bb80248cd98d0479a3ac6441a3eaf8179f640a3'
            'e2882f5b7fb4425ede97e8115a1960c0789a838340526b632c51b98ce6216e520c6fda7eec923bf4bc29966853785767c13370ad2dad24107bb9e78f8669d3f6')
sha512sums_x86_64=('76115bd2dcc11f7c1d9d96ed73312eb1b9ff64b070c3198d2b4d01f88f847b530e19df4099db0f196e24d5b0cedf225df42ee1f55b71f11902b807052bb9be11'
                   'SKIP')
sha512sums_aarch64=('8d4697b4912e7124e4e92e0b31e8f89a812b580dff99930f6cfa0bf06ccc775f3da3c5867427cf3948590095a6372503b7d9cb0519f2aee7ddc01f59d9066f4e'
                    'SKIP')

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$_appname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_appname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_appname.conf"

  # binary
  install -vDm755 "$_appname" "$pkgdir/usr/bin/$_appname"

  # configuration
  install -vdm750 -o root -g "$_appname" "$pkgdir/etc/$_appname"
  install -vDm660 -o root -g "$_appname" app.ini "$pkgdir/etc/$_appname/app.ini"
}
