# Maintainer: Arnaud Dovi <mr.dovi@gmail.com>

pkgname=ghidra-dev
pkgbranch=debugger
pkgver=9.2.3.r704.1a3458ef7+debugger
pkgrel=1
pkgdesc='Software reverse engineering framework (git, current branch: debugger)'
arch=('x86_64')
url='https://www.nsa.gov/ghidra'
license=(Apache)
provides=(ghidra)
conflicts=(ghidra)
depends=(
  'java-environment>=11'
  'bash'
  'polkit'
)
makedepends=(
  'git'
  'unzip'
  'gradle'
  'java-environment>=11'
)
provides=(
  'ghidra'
)
conflicts=(
  'ghidra'
  'ghidra-git'
)
source=(
  "git+https://github.com/NationalSecurityAgency/ghidra#branch=${pkgbranch}"
  'ghidra.desktop'
  'ghidra-root.desktop'
  'ghidra.policy'
  '2735-attaching_with_gdb_doesnt_work.patch'
  '0000-uninitialized_attributes.patch'
)
sha512sums=(
  'SKIP'
  '23a112f25f0ac7c58c0e47ef269dcfbaf08e44a1543b3fa7202ac62479b7ef9301cef9ffe30a625ac68334ec22452654e14c0be2d30ba0ad06197cb2ddc5d5ef'
  'c717029cf31860e27b5563c3ff4b2740d4b1997bc50481214e24c38f12d9acbfa9ca2cbfe594d43071fbf8420ac8f022119c2c23ddef0c717d96860e22eb35c3'
  '0a35f58b1820ac65ce37d09b0a6904ab7018c773c73ecd29bcfda37cbd27f34af868585084b5cd408b1066b7956df043cb1573a1e3d890e173be737d2de51401'
  '0cd25c7ce6ce5c26da438f9d802cbe6665cba1579ca98ff04d5092e7226c07364ba7b311ab38ec9cbdd90f195a857122aed3c006ff140ef7e268f6e861f0f850'
  '928992568031abf5102070cc14036613fcacd27c1fab6e394095b9b43736244dd3c02b49bcaec451bfe8b03829825b14d8efa770d03c988780a7ed2390688750'
)
pkgname2="${pkgname/-dev/}"
stop='\e[m'
color="\e[33m"
bold='\e[1m'
prefix=" ${bold}${color}==>$stop "



pkgver() {
  cd "$pkgname2" || return
  printf "%s" "$(git describe --tags | sed 's/Ghidra_\([^_]*\)_build/\1/;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')+${pkgbranch}"
}

prepare() {
  cd "$pkgname2" || return

  # PATCH - Attaching with GDB doesn't work - https://github.com/NationalSecurityAgency/ghidra/issues/2735
  echo -e "${prefix}[PATCH] - Attaching with GDB doesn't work (https://github.com/NationalSecurityAgency/ghidra/issues/2735)"
  patch --no-backup-if-mismatch --forward --strip=2 --input="${srcdir}/2735-attaching_with_gdb_doesnt_work.patch"

  # DEPRECATED PATCH - Uninitialized attributes (ERROR Object GdbModelTargetSession ... is missing required attributes [_focus, _supported_attach_kinds])
#  echo "  ==> [PATCH] - Uninitialized attributes"
#  patch --no-backup-if-mismatch --forward --strip=2 --input="${srcdir}/0000-uninitialized_attributes.patch"

  echo -e "${prefix}Setting up the build dependencies"
  gradle --parallel --init-script gradle/support/fetchDependencies.gradle init

  ##
  ## FOR GHIDRA DEVELOPERS
  ## (Left commented because the steps below are only required if you want to develop and contribute to ghidra)
  ## https://github.com/NationalSecurityAgency/ghidra/blob/master/DevGuide.md
  ##

#  echo -e "${prefix}Setting up the developers environment"
#  gradle --parallel prepDev
#
#  echo -e "${prefix}Setting up the eclipse configurations"
#  gradle --parallel eclipse
#
#  echo -e "${prefix}Compiling the linux64 native binaries"
#  gradle --parallel buildNatives_linux64
#
#  echo -e "${prefix}Compiling the precompile language modules"
#  gradle --parallel sleighCompile
}

build() {
  cd "$pkgname2" || return
  echo -e "${prefix}Building Ghidra"
  gradle --parallel buildGhidra
}

package() {
  cd "$pkgname2" || return

  echo -e "${prefix}Creating the package base"
  install -d "$pkgdir"/{opt,usr/bin}

  echo -e "${prefix}Extracting the zip archive"
  _appver=$(grep -oP '(?<=^application.version=).*$' Ghidra/application.properties)
  _relname=$(grep -oP '(?<=^application.release.name=).*$' Ghidra/application.properties)
  unzip -u build/dist/ghidra_"${_appver}_${_relname}_$(date +"%Y%m%d")"_linux64.zip -d "$pkgdir"/opt

  echo -e "${prefix}Setting up a versionless directory name"
  mv "$pkgdir"/opt/ghidra{_"${_appver}_${_relname}",}

  echo -e "${prefix}Setting up /usr/bin launchers"
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  echo -e "${prefix}Setting up desktop shortcuts"
  install -Dm 644 ../ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 ../ghidra-root.desktop -t "$pkgdir"/usr/share/applications

  echo -e "${prefix}Setting up desktop icon"
  install -Dm 644 Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon64.png "$pkgdir"/usr/share/pixmaps/ghidra.png

  echo -e "${prefix}Setting up policy file for the \"run as root\" desktop shortcut"
  install -Dm 644 ../ghidra.policy -t "$pkgdir"/usr/share/polkit-1/actions
}
