# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=ghidra-dev
branch=debugger
pkgver=9.2.2.debugger.r413.b69c3d6c5
_d2j=2.0
_yajsw=12.12
_hfsx=0.21
pkgrel=2
pkgdesc='Software reverse engineering framework (git, current branch: debugger)'
arch=(x86_64)
url=https://www.nsa.gov/ghidra
_git=https://github.com/NationalSecurityAgency/ghidra
license=(Apache)
provides=(ghidra)
conflicts=(ghidra)
depends=('java-environment>=11' 'bash' 'polkit')
makedepends=('git' 'gradle' 'unzip' 'java-environment>=11')
source=(
  git+$_git#branch=$branch
  git+$_git-data
  https://github.com/pxb1988/dex2jar/releases/download/$_d2j/dex-tools-$_d2j.zip
  https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/android4me/AXMLPrinter2.jar
  https://sourceforge.net/projects/yajsw/files/yajsw/yajsw-stable-$_yajsw/yajsw-stable-$_yajsw.zip
  https://sourceforge.net/projects/catacombae/files/HFSExplorer/$_hfsx/hfsexplorer-${_hfsx/./_}-bin.zip
  ghidra.desktop
  ghidra-root.desktop
  ghidra.policy
  2735-attaching_with_gdb_doesnt_work.patch
  0000-uninitialized_attributes.patch
)
noextract=(
  AXMLPrinter2.jar
  yajsw-stable-$_yajsw.zip
  hfsexplorer-${_hfsx/./_}-bin.zip
)
sha512sums=(
  'SKIP'
  'SKIP'
  'c4a6c72ea09b58a44fcb8918cfada600467f10f99a02b53d2436ac68295e73c8daf9ba0a8bc7160ba1e28e87f032ee034435ebe40af35b6e2fe9fa4607581358'
  'c1168ec913f1fbb0675915d4fd865ec9a8e8573f6c8aedcb6e68166f61f11aeaececc7548d54d78134843c0102c57d6350973f6d3027d0ffdae52a5c57a7f601'
  '0ff5a228ae1c5251c8ba59f9bcd9b4a199b0caaf688f6eccba42c3d227784d8f56f9164b2fad73fc173ec314340c036144123ce152fe911013df5598bd708944'
  'b85b4316115695acc78cc7c675c673058c05a238451562be0c6a48b2d11a28e5645a42cb62cdf063be015369df26201dfab6cf2e60f39e6468d1d53b23f94415'
  '23a112f25f0ac7c58c0e47ef269dcfbaf08e44a1543b3fa7202ac62479b7ef9301cef9ffe30a625ac68334ec22452654e14c0be2d30ba0ad06197cb2ddc5d5ef'
  'c717029cf31860e27b5563c3ff4b2740d4b1997bc50481214e24c38f12d9acbfa9ca2cbfe594d43071fbf8420ac8f022119c2c23ddef0c717d96860e22eb35c3'
  '0a35f58b1820ac65ce37d09b0a6904ab7018c773c73ecd29bcfda37cbd27f34af868585084b5cd408b1066b7956df043cb1573a1e3d890e173be737d2de51401'
  '0cd25c7ce6ce5c26da438f9d802cbe6665cba1579ca98ff04d5092e7226c07364ba7b311ab38ec9cbdd90f195a857122aed3c006ff140ef7e268f6e861f0f850'
  '928992568031abf5102070cc14036613fcacd27c1fab6e394095b9b43736244dd3c02b49bcaec451bfe8b03829825b14d8efa770d03c988780a7ed2390688750'
)

pkgver() {
  cd ghidra
  printf "%s" "$(git describe --tags | sed 's/Ghidra_\([^_]*\)_build/\1\.'"${branch}"'/;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  # HFSExplorer isn't archived in a folder, so let's make one to extract it into
  mkdir -p hfsx
  unzip -o hfsexplorer-${_hfsx/./_}-bin.zip -d hfsx

  cd ghidra

  # Copy needed libraries into a flat repo
  mkdir -p flatRepo
  cp ../dex2jar-$_d2j/lib/dex-*.jar \
    ../AXMLPrinter2.jar \
    ../hfsx/lib/{csframework,hfsx*,iharder-base64}.jar \
    flatRepo
  cp ../yajsw-stable-$_yajsw.zip Ghidra/Features/GhidraServer

  # YAJSW expects this symlink
  ln -nsf ghidra ../ghidra.bin

  # Add FID datasets
  install -Dm 644 ../ghidra-data/FunctionID/*.fidb -t Ghidra/Features/FunctionID/src/main/fidb

  # Ignore lack of licensing for YAJSW zip, packed FID datasets, and the native binaries
  sed -i '/FileTree tree/a\\t\texclude "yajsw-stable-**.zip"\n\t\texclude "src/main/fidb/**.fidb"\n\t\texclude "os/linux64/**"' gradle/support/ip.gradle

  # TEMPFIX - Attaching with GDB doesn't work - https://github.com/NationalSecurityAgency/ghidra/issues/2735
  patch --forward --strip=2 --input="${srcdir}/2735-attaching_with_gdb_doesnt_work.patch"

  # TEMPFIX - Uninitialized attributes (ERROR Object GdbModelTargetSession ... is missing required attributes [_focus, _supported_attach_kinds])
  patch --forward --strip=2 --input="${srcdir}/0000-uninitialized_attributes.patch"
}

build() {
  cd ghidra

  # GhidraServer requires YAJSW
  gradle yajswDevUnpack

  # Build native components
  gradle buildNatives_linux64

  # Pre-compile language modules
  gradle sleighCompile

  # Let's go
  gradle buildGhidra
}

package() {
  cd ghidra

  install -d "$pkgdir"/{opt,usr/bin}

  # Extract built archive into destination folder
  _appver=$(grep -oP '(?<=^application.version=).*$' Ghidra/application.properties)
  _relname=$(grep -oP '(?<=^application.release.name=).*$' Ghidra/application.properties)

  unzip -u build/dist/ghidra_${_appver}_${_relname}_$(date +"%Y%m%d")_linux64.zip -d "$pkgdir"/opt
  # Use a simple directory name
  mv "$pkgdir"/opt/ghidra{_${_appver}_${_relname},}

  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  install -Dm 644 ../ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 ../ghidra-root.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 ../ghidra.policy -t "$pkgdir"/usr/share/polkit-1/actions

  for i in 16 24 32 40 48 64 128 256; do
    install -Dm 644 Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon$i.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/ghidra.png
  done
}
