# Maintainer: Šarūnas Gliebus <ssharunas at vivaldi.net>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dragonflydb
pkgver=1.24.0
pkgrel=1
pkgdesc='A fast in-memory store that is fully compatible with Redis and Memcached'
arch=('x86_64')
url='https://dragonflydb.io'
license=('custom:BSL1.1')
depends=(
  'glibc'
  'gcc-libs'
  'openssl'
  'boost-libs'
  'libunwind'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'boost'
)
optdepends=('logrotate')
source=(
  "$pkgname::git+https://github.com/dragonflydb/dragonfly#tag=v$pkgver"
  'github.com-romage-helio::git+https://github.com/romange/helio'
  'sysusers.conf'
  'tmpfiles.conf'
  'use-fhs-directories.patch'
  'gcc14.patch'
)
b2sums=('SKIP'
        'SKIP'
        'fa10c1cfbd47eb0bdaae77e66a89fc94ee8803f30e431ce498c99724653a63102c7c34e96b44847c45f43ebdd4a549fdb67f47b30698af582aa2e38a9a760fa3'
        'ed965facc221fa66c8803b6b7ddc91151ebbb857eb77f934a700f02940f8294d6c8d075b76eba8fccc550ba7054ec26dd7599fef7d7b608e5e76be7a138ae279'
        'ccb72430294479155b716e0aef2a6a85c0100ecd8560735af32211632363a3ef65c35f13be8ab57b5c363577a92e893213b81aed213091c280d9d4cda13c3554'
        '5eb6ee9fb6c253a8b85fa817a58d725e4273e58a59ff1247bf6a6273519dba1eae8d0a6c6f3f58edf46554e35a0734d8e6e7211dc7b24e77fba8f96b34a1f2b3')

prepare() {
  cd "$pkgname"

  # prepare git submodule(s)
  git submodule init
  git config submodule.helio.url "$srcdir/github.com-romage-helio"
  git -c protocol.file.allow=always submodule update

  # use FHS directories
  patch -p1 -i "$srcdir/use-fhs-directories.patch"
  patch -p1 -i "$srcdir/gcc14.patch"
}

build() {
  cd "$pkgname"

  ./helio/blaze.sh -release

  cd build-opt

  ninja dragonfly
}

package() {
  cd "$pkgname"

  # systemd integration
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" tools/packaging/debian/dragonfly.service
  install -vDm644 -t "$pkgdir/etc/dragonfly" tools/packaging/debian/dragonfly.conf

  # logrotate
  install -vDm644 tools/packaging/debian/dragonfly.logrotate "$pkgdir/etc/logrotate.d/$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build-opt/dragonfly

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
