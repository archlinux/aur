# shellcheck shell=bash
# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-new
_pkgname=HMCL
_ver=3.10
_build=2
_pkgver=v$_ver.$_build
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that trying to compile and run HMCL with the latest LTS version of java. (with HMCL-Clean changes)'
arch=('any')
url='https://github.com/HMCL-dev/HMCL'
license=('GPL3')
depends=('java-runtime>=21' 'java-openjfx>=21' 'hicolor-icon-theme')
makedepends=('java-environment>=21' 'gradle')
provides=('hmcl')
conflicts=('hmcl')
source=('hmcl.desktop'
  'hmcl-launch-script'
  "${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz"
  "0001-Target-Java-21.patch"
  "0002-Cleanup.patch")
sha256sums=('b4e8aa0f349bb3f5dd15a31c5a13ac3e10e5a5bcd2f97cf390041924275e43ef'
  '4fcd4bf8f8d2ca39cf25a8d59daeb53ffa54fbca0356bd55aa17a5ee31d59a95'
  'f6d3ded0dd3205142be48b37ad4b99b9a9fe828721553efa10fa88d6cabbc26e'
  '5dcc4a379d8b5af065a8d561b8cb69f1f3e1ab1b3a6afc3b17e7a9b959fc5812'
  '436f81e4d67d80fbce92a21d6877d8ffc37e742c058153564fe1cf54d7125a5d')

prepare() {
  cd "$_pkgname-$pkgver"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src == *.patch ]] || continue
    patch -Np1 <"../$src"
  done
}

build() {
  cd "$_pkgname-$pkgver"
  VERSION_TYPE=stable \
    VERSION_ROOT="$_ver" BUILD_NUMBER="$_build" \
    MICROSOFT_AUTH_ID='6a3728d6-27a3-4180-99bb-479895b8f88e' MICROSOFT_AUTH_SECRET='dR.50SWwVez4-PQOF2-e_2GHmC~4Xl-p4p' \
    CURSEFORGE_API_KEY='$2a$10$o8pygPrhvKBHuuh5imL2W.LCNFhB15zBYAExXx/TqTx/Zp5px2lxu' \
    gradle build -x test --no-daemon \
    -D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

check() {
  cd "$_pkgname-$pkgver"
  gradle test --no-daemon \
    -D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

package() {
  install -Dm755 'hmcl-launch-script' "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'hmcl.desktop' "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$_pkgname-$pkgver/HMCL/build/libs/$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "$_pkgname-$pkgver/HMCL/image/hmcl.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
