# Credits: George Rawlinson <grawlinson@archlinux.org>
# taken from the official arch package

pkgname=garage-consul
pkgver=2.1.0
pkgrel=3
pkgdesc='A S3-compatible distributed object storage service tailored for self-hosting (with consul)'
arch=(x86_64 aarch64)
url='https://garagehq.deuxfleurs.fr/'
license=(AGPL-3.0-only)
conflicts=('garage')
provides=('garage')
depends=(
  glibc
  gcc-libs
  libsodium
  sqlite
  lmdb
  zstd
)
makedepends=(git rust)
options=(!lto)
backup=(etc/garage.toml)
source=(
  "garage::git+https://git.deuxfleurs.fr/Deuxfleurs/garage#tag=v$pkgver"
  systemd.service
  sysusers.conf
  tmpfiles.conf
  config.toml
)
sha512sums=('6fe2ea4ea5aa43e477aceda3ba62da88b4a4485b282762b0f7aff532e5c21137d8814e8091b3c7cfe188517df5c9a5dc784a87713d2b368ec19ceed8865e8c5a'
            '025787397df86bceeed9aff556bc347a7d7a87715eb7dac8e89edd37945edf7fce807cb5adade85fb2f3a35d3ea78565d5a122fb978fbe48f3036e3876063c3a'
            '26b7de667e7f51e7cbe231f6cca08e4360ae9182e36e70223bf9d5882a29248daed0a3c8397bc4528b7be1ea0b3ae78d6216faa7c817d9f53e9d920eb78730ae'
            'e8640cd3d565362468fb01008ca02d0e8477e4575ea74b86bf521517ef318daad06fde1fed3287ebfbf64c01989e8bb5ebac0a09c02f01abe79fb08a509a40d1'
            '66262f93a174efb5716b94bac2f76600502f4e4f22fc87e025b53d568a7c9488700e6d40d31514effcacda9951c927c4cb055fa4fdec8368433fc773e937a33a')
b2sums=('a732d7e35db4c29172d2552139e60b1cd92ca26aabdde21372bfd3705ead2bb57e6051ec1ed43e584839579922ffbeb0b71293b2db7c78ad17d1f08856516591'
        'f15192cb21937d7adf3979f0c30a04913fa688990a8f4d14900571d1279f6d08af57f899d4388eb032b94f1410721ec4752c6666a3c9db1dce7a3dff4683c11f'
        '6a1a01ef5cd3aac6d7ad02a3300e21cb7b89c83249e774bbe53173bab8d365ec42c2aa4a5a59a5ee2f744feeff53bf532085691db666d76f3f501efa9bb43f58'
        'f008d23ab7e2d976cc70d4be5a91debfec623170d57be1dd6794ee0d93f8b96edb847b2be3abcfe8eb00b62607ab4bd36328216ab171c64ad996f8ada74cdf6b'
        '53cd43be33a32ede02e13c5b44300661c2afb444acbcc4206251a8d22fe628356c5c40cfd7f7a0152ad6b30500d135a6b377cc202ec0c8652e6c92f522d5992f')

prepare() {
  cd garage

  # download dependencies
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd garage

  local _cargo_options=(
    --frozen
    --release
    --no-default-features
    --features 'system-libs,metrics,lmdb,sqlite,k2v,consul-discovery'
  )

  cargo build "${_cargo_options[@]}"
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/garage.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/garage.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/garage.conf"
  install -vDm640 config.toml "$pkgdir/etc/garage.toml"

  cd garage

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/garage"
}
