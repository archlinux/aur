# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: skydrome <skydrome at@at proton mail dot com>
# Contributor: Thynix

# NOTICE: The original Freenet from 1999-2023 is renamed to Hyphanet 
# https://www.hyphanet.org/freenet-renamed-to-hyphanet.html

pkgname=hyphanet
pkgver=0.7.5.1505
pkgrel=1
pkgdesc='A peer-to-peer network for censorship-resistant and privacy-respecting publishing and communication, a.k.a Freenet from 1999-2023. This is NOT Locutus.'
arch=('x86_64' 'aarch64')
url='https://www.hyphanet.org/'
license=('GPL-2.0-or-later')
depends=(
  'java-runtime>=11'
  'java-service-wrapper'
  'nss'
)
makedepends=(
  'git'
  'java-environment>=11'
  'zip'
)
replaces=('freenet')
backup=('opt/hyphanet/wrapper.config')
install='hyphanet.install'
source=(
  "git+https://github.com/hyphanet/fred.git?signed#tag=build0${pkgver##*.}"
  "git+https://github.com/hyphanet/seedrefs.git"
  hyphanet.{sh,ini.dist,service,tmpfiles}
  'wrapper.config'
)

# https://www.hyphanet.org/assets/keyring.gpg
validpgpkeys=('B30C3D91069F81ECFEFED0B1B41A6047FD6C57F9')

b2sums=('d8c08d1606f516bfa5c238889fd9d0aea2681874ad38c2441e378ead85275dbc13a14f807a44da7135771dcf6f5645b9d42c55508f1252e8448b925ef81517c7'
        'SKIP'
        '3af19432973a458dc1bfb7dc024d12d9fbaeeb910a066146d9a4acedfb5da7a2c15fb78d4b770330c17b23c1f9b99cdb5a64762d9a77a60b272a53fe01ffeb60'
        '497767d33e5f73439b5830f907fb17f64e53b21f849917c011951569127ee14dda60a18ff9264beee24af388ebbafaf4f307834c687b944fcce043d9729874a5'
        '59a94140471b0283eaf676a6c70d1eecc3b4170c7493da3d1838efb120e295039c14f99ac823207bdd636a4e12997126e8608ba14083faf422768b7b3b473f0a'
        'd901c84a02dc3ec6ebbabe58ceec7103e4cb11502b2efbaa2b19b53666501ab68569a9c89cb56722e63ba703776f488ade64d1c93ebfcb24af20d78f800853ff'
        '9783593600612cfdf588903f39f41bceddce989c8320bad23d2a9a5d19d67160eaf84b76b557089c154537f2629311f864cc69f6a97aca2c595e86f3d7971725')


prepare() {
  cd fred

  # create seednodes file for bootstrapping
  rm -f seednodes.fref
  for node in "$srcdir"/seedrefs/0* ;do
    printf "%s\n\n" "$(<"$node")" >>seednodes.fref
  done
}

build() {
  cd fred

  export GRADLE_USER_HOME="$SRCDEST/.gradle"
  export GRADLE_OPTS="-Dorg.gradle.internal.launcher.welcomeMessageEnabled=false"
  ./gradlew --no-build-cache --no-daemon copyRuntimeLibs
}

package() {
  cd fred

  # create folder structure
  install -dm755 "$pkgdir/usr/bin"
  install -dm750 "$pkgdir/opt/$pkgname"
  install -dm700 "$pkgdir/opt/$pkgname/tmp"
  install -dm750 "$pkgdir/opt/$pkgname/"{downloads,lib,conf,noderef,plugins,user}
  install -dm750 "$pkgdir/opt/$pkgname/"{plugins/data,user/{data,certs}}

  # install hyphanet
  install -m755  "$srcdir/hyphanet.sh"                      "$pkgdir/usr/bin/$pkgname"
  install -m640  "$srcdir/wrapper.config"                   "$pkgdir/opt/$pkgname"
  install -m640  "$srcdir/hyphanet.ini.dist"                "$pkgdir/opt/$pkgname/conf"
  install -m640  "$srcdir/fred/seednodes.fref"              "$pkgdir/opt/$pkgname/noderef"
  install -m640  "$srcdir/fred/build/output/"*.jar          "$pkgdir/opt/$pkgname/lib"

  # delete bundled wrapper
  zip -qd "$pkgdir/opt/$pkgname/lib/freenet-ext-29.jar" "org/tanukisoftware/*"

  # systemd
  install -Dm644 "$srcdir/hyphanet.tmpfiles"    "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "$srcdir/hyphanet.service"     "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # docs
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/fred/"{AUTHORS,CONTRIBUTING.md,NEWS.md,README.md,SECURITY.md}
}
