# shellcheck shell=bash
# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-new
_pkgname=HMCL
_ver=3.5.5
_build=237
_pkgver=$_ver.$_build
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that trying to compile and run HMCL with the latest LTS version of java. (with HMCL-Clean changes)'
arch=('any')
url='https://github.com/HMCL-dev/HMCL'
license=('GPL3')
depends=('java-runtime>=17' 'java-openjfx>=17' 'hicolor-icon-theme')
makedepends=('java-environment>=17' 'gradle')
provides=('hmcl')
conflicts=('hmcl')
source=('hmcl.desktop'
  'hmcl-launch-script'
  "${url}/raw/v${_pkgver}/HMCL/image/hmcl.png"
  "${_pkgname}-v${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz"
  "0001-Target-Java-17.patch"
  "0002-Cleanup.patch")
sha256sums=('b4e8aa0f349bb3f5dd15a31c5a13ac3e10e5a5bcd2f97cf390041924275e43ef'
  '4fcd4bf8f8d2ca39cf25a8d59daeb53ffa54fbca0356bd55aa17a5ee31d59a95'
  'd4e56ae2e8c0d991dba01ef3124ef4d38918825f58728338a8bab5e78319306a'
  '910e4128f846636552f34640e05fe5b4e2e1e00213a93aecf6ac253ba9c1aaee'
  '179db8d388d1ceb6f882587e67c00a76ef14e7ab5aee488fdaed3db67307dbbc'
  'c80a41ec6a1b8813e9faeaf1a3c9ac6eaa86bd78f711322128dba579d121901c')

prepare() {
  cd "$_pkgname-$_pkgver"
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src == *.patch ]] || continue
    patch -Np1 <"../$src"
  done
}

build() {
  cd "$_pkgname-$_pkgver"
  VERSION_TYPE=stable \
    VERSION_ROOT="$_ver" BUILD_NUMBER="$_build" \
    MICROSOFT_AUTH_ID='6a3728d6-27a3-4180-99bb-479895b8f88e' MICROSOFT_AUTH_SECRET='dR.50SWwVez4-PQOF2-e_2GHmC~4Xl-p4p' \
    CURSEFORGE_API_KEY='$2a$10$o8pygPrhvKBHuuh5imL2W.LCNFhB15zBYAExXx/TqTx/Zp5px2lxu' \
    gradle build -x test --no-daemon \
    -D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

check() {
  cd "$_pkgname-$_pkgver"
  gradle test --no-daemon \
    -D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

package() {
  install -Dm755 'hmcl-launch-script' "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'hmcl.desktop' "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$_pkgname-$_pkgver/HMCL/build/libs/$_pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 'hmcl.png' "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
