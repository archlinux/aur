# shellcheck shell=bash
# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-new
_pkgname=HMCL
_ver=3.5.5
_build=235
_pkgver=ffeabbf1f144ba14462e27c2ac9d46e231c1482e
_java_version=17
_jar_path="/usr/share/java/$pkgname.jar"
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that trying to compile and run HMCL with the latest LTS version of java. (with HMCL-Clean changes)'
arch=('any')
url='https://github.com/huanghongxun/HMCL'
license=('GPL3')
depends=("java-runtime>=$_java_version" "java-openjfx>=$_java_version" 'hicolor-icon-theme' 'archlinux-java-run')
makedepends=("java-environment>=$_java_version" 'gradle')
provides=('hmcl')
conflicts=('hmcl')
source=('hmcl.desktop'
  'hmcl-launch-script'
  'craft_table.png'
  "${_pkgname}-${_pkgver}.tar.gz::${url}/archive/${_pkgver}.tar.gz"
  "0001-Target-Java-$_java_version.patch"
  "0002-Cleanup.patch"
)
sha256sums=('04ee0621a295728d4ad5d23d6bf8853d5715053153b336203ce7e73ce8b66440'
  '505c335bce8685fff97f6fbd0c4b916fa697dfc73ff22735d7c188b3811bc422'
  '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
  '1e152212e1507d49c867fe8715c4ec337972795cd9f4947e285677a56257cb3d'
  'c650fa0d34f22f9700dd047fbe243a63528c629312b94f499d4aa341b9b5193f'
  '3eb85d8b6f1affcf33fb1e5ec12127eac4962d0c980e2884ccf954578e12a131')

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
  install -Dm644 "$_pkgname-$_pkgver/HMCL/build/libs/$_pkgname-$pkgver.jar" "$pkgdir/$_jar_path"
  install -Dm644 'craft_table.png' "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  sed -i -e "s|%JAVA_VERSION%|$_java_version|" -e "s|%JAR_PATH%|$_jar_path|" "$pkgdir/usr/bin/$pkgname"
}
