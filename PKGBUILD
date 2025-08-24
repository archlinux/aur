# Maintainer: Zepman <the*UNDERSCOREHERE*zep*UNDERSCOREHERE*man@hotmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=lldap
pkgver=0.6.2
pkgrel=1
pkgdesc='Light LDAP implementation for authentication'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/lldap/lldap'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'rust' 'wasm-pack' 'rust-wasm' 'wasm-bindgen')
backup=('etc/lldap.toml')
options=('!lto')
_commit='5e83ed8eb0755af831ad36f114300299cc703615'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'config-template.patch'
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=('SKIP'
        '0460040b0541b4cf388ee4a81adbbfbb331a4fc52d484b7a4f4ba918cb7664e98ef3ae8a21a8eeb92f124f57a0d5a7814004a7d59a4282c22b89c3855b757ce8'
        '9d2688aae8e36d56759c407e76816f4d2a450c92fd956b92145fc0ba52902c32283d8a939478e6f866ba6624f1c11a47e243208f3aa11bfb453d5a937be3c914'
        'e491337a2ba4ca68ed6afe3a0779a608f718da4107547276562582bc24b7ab21af724b4026adfe3b845ef9e81284bb54da548b8f48b4b1b1bf8525316f990f82'
        '1caff6be850db02f3dcd8d4ca12a2f18acf40c2900cb2d0866cf3a3c131bda9c9bf5d32a072f250f1d0700ac7dd3e43f05d4d33dd2e5f21c6a983a57e1c5adcc')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # patch configuration template
  patch -p1 -i "$srcdir/config-template.patch"

  # download dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"

  # download frontend dependencies
  xargs curl --remote-name-all --output-dir app/static/fonts < app/static/fonts/fonts.txt
  xargs curl --remote-name-all --output-dir app/static < app/static/libraries.txt
}

build() {
  cd "$pkgname"

  # server
  cargo build \
    --frozen \
    --release \
    --all-features \
    -p lldap \
    -p lldap_migration_tool \
    -p lldap_set_password

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
