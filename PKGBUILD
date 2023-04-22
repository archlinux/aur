# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lldap
pkgver=0.4.3
pkgrel=1
pkgdesc='Light LDAP implementation'
arch=('x86_64')
url='https://github.com/lldap/lldap'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust' 'wasm-pack' 'rust-wasm' 'wasm-bindgen')
backup=('etc/lldap.toml')
options=('!lto')
_commit='252132430cdbf22f3c8e549e1826f9c68ae0e6ae'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'config-template.patch'
  'Cargo.lock.patch'
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=('SKIP'
        '469c0e188396a25087a81c3c751a6ba17736d177fbf4695125781361212f6b60918d1b082bf0b133ffd1cafb17e101d61819f2a812fb46f354d8ab77bde1e0ad'
        'e9027e99d2ea2779ece257c8ec5ceb94dd3068959588c9d595cc2f8bedc7387398dbd2f39f1188f9e3484a396e62630d676767bf3156d11243aadc084f92baf8'
        'a03e0d02f423626e3c5796f2867b7a8f2207949987cb655967c85952db2f283c5fd0a5d1bc869332aec04ede54aa0f9740b507110ac5b604eb5703afe315f43a'
        'e491337a2ba4ca68ed6afe3a0779a608f718da4107547276562582bc24b7ab21af724b4026adfe3b845ef9e81284bb54da548b8f48b4b1b1bf8525316f990f82'
        '1caff6be850db02f3dcd8d4ca12a2f18acf40c2900cb2d0866cf3a3c131bda9c9bf5d32a072f250f1d0700ac7dd3e43f05d4d33dd2e5f21c6a983a57e1c5adcc')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # patch Cargo
  patch -p1 -i "$srcdir/Cargo.lock.patch"

  # patch configuration template
  patch -p1 -i "$srcdir/config-template.patch"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

  # download frontend dependencies
  xargs curl --remote-name-all --output-dir app/static/fonts < app/static/fonts/fonts.txt
  xargs curl --remote-name-all --output-dir app/static < app/static/libraries.txt
}

build() {
  cd "$pkgname"

  # server
  cargo build --frozen --release --all-features

  # frontend
  ./app/build.sh
}

check() {
  cd "$pkgname"

  cargo test --frozen --all-features
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  find target/release \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -vDm755 -t "$pkgdir/usr/bin/" {} +

  # configuration
  install -vDm640 lldap_config.docker_template.toml "$pkgdir/etc/$pkgname.toml"

  # frontend assets
  # TODO consider patching source to point to /usr/share/lldap instead of a local directory?
  install -vd "$pkgdir/var/lib/$pkgname"
  install -vDm644 app/index_local.html "$pkgdir/var/lib/$pkgname/app/index.html"
  install -vDm644 -t "$pkgdir/var/lib/$pkgname/app/static" app/static/*.{css,js,gif}
  install -vDm644 -t "$pkgdir/var/lib/$pkgname/app/static/fonts" app/static/fonts/*.woff2
  install -vDm644 -t "$pkgdir/var/lib/$pkgname/app/pkg" app/pkg/*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"
}
