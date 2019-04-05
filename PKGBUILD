# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-git
pkgver=9.0.2+10+g49c2010
_d2j=2.0
_yajsw=12.12
_hfsx=0.21
pkgrel=1
pkgdesc='Software reverse engineering framework (git)'
arch=(i686 x86_64)
url=https://github.com/NationalSecurityAgency/ghidra
license=(Apache)
conflicts=(ghidra ghidra-bin)
depends=('java-environment>=11')
makedepends=(gradle unzip)
source=(git+$url
        repositories
        https://github.com/pxb1988/dex2jar/releases/download/$_d2j/dex-tools-$_d2j.zip
        https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar
        https://sourceforge.net/projects/yajsw/files/yajsw/yajsw-stable-$_yajsw/yajsw-stable-$_yajsw.zip
        https://sourceforge.net/projects/catacombae/files/HFSExplorer/$_hfsx/hfsexplorer-${_hfsx/./_}-bin.zip)
noextract=(AXMLPrinter2.jar
           yajsw-stable-$_yajsw.zip
           hfsexplorer-${_hfsx/./_}-bin.zip)
sha512sums=('SKIP'
            '15a2232450ed6f3dd6b3ce684c0ded9ba156cfa44b9fdbb915350e855b0d8955a976bff992174baace21b5c68b8b0c73072840390d265ad84820319138d65179'
            'c4a6c72ea09b58a44fcb8918cfada600467f10f99a02b53d2436ac68295e73c8daf9ba0a8bc7160ba1e28e87f032ee034435ebe40af35b6e2fe9fa4607581358'
            'c1168ec913f1fbb0675915d4fd865ec9a8e8573f6c8aedcb6e68166f61f11aeaececc7548d54d78134843c0102c57d6350973f6d3027d0ffdae52a5c57a7f601'
            '0ff5a228ae1c5251c8ba59f9bcd9b4a199b0caaf688f6eccba42c3d227784d8f56f9164b2fad73fc173ec314340c036144123ce152fe911013df5598bd708944'
            'b85b4316115695acc78cc7c675c673058c05a238451562be0c6a48b2d11a28e5645a42cb62cdf063be015369df26201dfab6cf2e60f39e6468d1d53b23f94415')

pkgver() {
  cd ghidra
  git describe --tags | sed 's/Ghidra_//;s/_build//;s/-/+/g'
}

prepare() {
  install -d hfsx
  unzip -u hfsexplorer-${_hfsx/./_}-bin.zip -d hfsx

  cd ghidra

  # Allow use of any Gradle version
  sed -i '/gradleVersion/,+2d' build.gradle

  # Add repositories
  cat ../repositories >> build.gradle

  # Copy libs to common folder
  install -Dm 644 ../dex2jar-$_d2j/lib/dex-*.jar \
    ../AXMLPrinter2.jar \
    ../hfsx/lib/{csframework,hfsx*,iharder-base64}.jar \
    -t lib

  # YAJSW expects this symlink
  ln -sf ghidra ../ghidra.bin
  install -Dm 644 ../yajsw-stable-$_yajsw.zip -t Ghidra/Features/GhidraServer

  # Fix bug where no license is found for the YAJSW zip
  sed -i '/FileTree tree/a\\t\texclude "yajsw-stable-**.zip"' gradleScripts/ip.gradle
}

build() {
  cd ghidra
  gradle yajswDevUnpack
  gradle buildGhidra
}

[ "$CARCH" = i686 ] && _platform=linux32
[ "$CARCH" = x86_64 ] && _platform=linux64

package() {
  cd ghidra
  install -d "$pkgdir"/{opt,usr/bin}
  _ghidra=ghidra_${pkgver:0:5}_PUBLIC_`date +"%Y%m%d"`_$_platform.zip
  unzip -u build/dist/$_ghidra -d "$pkgdir"/opt
  mv "$pkgdir"/opt/ghidra{_${pkgver:0:5},}
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/ghidra/LICENSE
}
