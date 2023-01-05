# Maintainer: Reid McKenzie <me@arrdem.com>

pkgname=forgejo-bin
pkgver=1.18.0
pkgrel=1
pkgdesc='A lightweight software forge'
arch=('x86_64')
url='https://forgejo.org'
license=('MIT')
depends=('git')
conflicts=(
  'forgejo'
  'forgejo-git'
)
optdepends=(
  'mariadb: MariaDB support'
  'memcached: MemCached support'
  'openssh: GIT over SSH support'
  'pam: Authentication via PAM support'
  'postgresql: PostgreSQL support'
  'redis: Redis support'
  'sqlite: SQLite support'
)
backup=('etc/forgejo/app.ini')
_commit="88445b62374e8165d44d5520de736a7b7c98fd1b"
source=(
  # FIXME: No clear way to reference specific release binaries by logical filename on codeberg?
  # Per https://codeberg.org/forgejo/forgejo/releases/tag/v1.18.0-1, this is amd64
  "forgeo-${pkgver}::https://codeberg.org/attachments/a26d3acd-5c2e-4132-a283-8110da2872d4"
  "app.example.ini::https://codeberg.org/forgejo/forgejo/raw/commit/${_commit}/custom/conf/app.example.ini"
  "LICENSE::https://codeberg.org/forgejo/forgejo/raw/commit/${_commit}/LICENSE"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha256sums=('109577e82dd06a57b47b54999c711f58d636af6dad5da90f6f39b0a13c1a2253'
            '7b5b56a6403ffcf1c962ac76288de4bc52852e2e74f06068fdd55d21e327869a'
            'ed2f10a9d78b8c6c9ef33f1420d0eb266981891caf2f15d630553f02dc60d3ae'
            '55890bb0f98ea76f92db83daf77f8cbe6f01c9d3f1eb013e2a3a5fc48e74b09d'
            '563ebe7e826c351786612102a303b9b3726a218e471b89817af94b2326f46a83'
            'f0f34da0f12606fa44ee3a03839b12c9f77576fd6d63659a0aaf5b336643555f')

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 app.example.ini -t "$pkgdir/etc/$pkgname"

  # binary
  install -vDm755 "forgeo-${pkgver}" "$pkgdir/usr/bin/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
