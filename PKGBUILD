# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Vladislav Minakov <v@minakov.pro>
# Contributor: Markus Richter <mqus at disroot dot org>
# Contributor: Timothée Ravier <tim@siosm.fr

pkgname=oidcwarden
_pkgname=vaultwarden
pkgver=1.34.3
pkgrel=1
pkgdesc='Soft fork from vaultwarden. Goal is to provide an OIDC compatible solution with the ultimate goal of merging features back in Vaultwarden.'
arch=(x86_64)
url=https://github.com/timshel/vaultwarden
#url=https://github.com/Timshel/OIDCWarden
license=(AGPL-3.0-only)
depends=(
  gcc-libs
  glibc
  openssl
  postgresql-libs
  sqlite
)
conflicts=(vaultwarden)
depends_x86_64=(mariadb-libs)
makedepends=(
  git
  rust
)
optdepends=('oidcwarden-web: for the web app')
backup=(etc/vaultwarden.env)
options=(!lto)
install=$pkgname.install
source=(
  "git+$url.git#branch=sso-support"
#  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
  systemd.service
  sysusers.conf
  tmpfiles.conf
  env-overrides.patch
)
sha512sums=('SKIP'
            'a12e993bbb568370b9a19f1634085eceda33c1f6bc98ea2c4fa2686a91676f3e9aafc681ab83450bf90b52e553770aabec871c311746faf2098e589cb67c7436'
            'd133aec7f75cc5653e847e81bd11c36374eb20da62b2e197bbdcd306ef9c5d4d1de9fc41b7afe88645bebecc1397f64089bfd57c22eb2c9fb83b1da7b44c23aa'
            'efbe316f8d22f14c88b5020ea163b58a42e9a0de1028d04af6e439276a55eefc7f7631dd9c4aee5cf5ca2fb642e4fa5b31eedef4370d6d785e106474c0940afe'
            'bcd7fcd50f8939601f142e18a0f0e548183fce732f1c9648c9ec43f3a9a4a06731e82340498f45f676642aee8ee5df889bc2a13d3dddf8de594198c2b8e37d07')

prepare() {
  cd ${_pkgname}
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
#  patch --forward --strip=1 --input=../env-overrides.patch
}

build() {
  cd ${_pkgname}
  export VW_VERSION=$pkgver
  if [[ $(getconf LONG_BIT) -eq 32 ]]; then
    # https://github.com/dani-garcia/vaultwarden/issues/4320
    cargo build --profile release-low --frozen --features sqlite,postgresql
  else
    cargo build --release --frozen --features sqlite,mysql,postgresql
  fi
}

check() {
  cd ${_pkgname}
  if [[ $(getconf LONG_BIT) -eq 32 ]]; then
    cargo test --frozen --features sqlite,postgresql
  else
    cargo test --frozen --features sqlite,mysql,postgresql
  fi
}

package() {
  install -vDm644 systemd.service \
    "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
  install -vDm644 sysusers.conf "$pkgdir"/usr/lib/sysusers.d/$_pkgname.conf
  install -vDm644 tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/$_pkgname.conf
  cd ${_pkgname}
  install -Dm640 .env.template "$pkgdir"/etc/$_pkgname.env
  install -vDm755 -t "$pkgdir/usr/bin" target/release*/$_pkgname
}
