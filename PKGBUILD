# Maintainer: Luke Street <luke@street.dev>
# Based on AUR ghidra-git
# Original Darcula patch from https://digmi.org/2019/03/26/ghidracula/

pkgname=ghidra-darcula
_darcula=08c13c5f1a12624f4d8df8723b39061e11c93241
_darcula_version=2019.09
pkgver=9.2.3
pkgrel=1
pkgdesc='Software reverse engineering framework (with dark theme)'
arch=('x86_64')
url='https://ghidra-sre.org'
license=(Apache)
provides=(ghidra)
conflicts=(ghidra)
depends=(
  'java-runtime-common'
  'jdk11-openjdk'
)
makedepends=(
  'git'
  'gradle'
)
source=(
  "git+https://github.com/NationalSecurityAgency/ghidra#tag=Ghidra_${pkgver}_build"
  "git+https://github.com/encounter/darcula-laf.git#commit=${_darcula}"
  ghidra.desktop
  darcula.patch
)
sha512sums=(
  'SKIP'
  'SKIP'
  '4cf019d5bfde5265d667400111fb0c2473caa2457756c9c73e33d6128da3b116bf8d1b8cbb4092bbe27ea65ea5ab46f922e05a1e53ff36b90f76d8fcc4bfc1e7'
  '833fc176889f7682028f167b3093d1828b79805aa58d7f8ed8387b4baeeec1da2f30e5d607aebdb460580b939ea9dceb35e4aabf03b0a0f29f328efaa58e2f82'
)
_pkgname="${pkgname/-*/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>$_stop "

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's#Ghidra_##;s#_build##;s#-#+#g;s#+#+r#'
}

prepare() {
  cd "$_pkgname"

  echo -e "${_prefix}Setting up the build dependencies"
  gradle --parallel --init-script gradle/support/fetchDependencies.gradle init

  echo -e "${_prefix}Applying Darcula patch"
  patch -Np1 -i "$srcdir"/darcula.patch
  sed -i "/dependencies {/a\\\\tcompile ':darcula-laf:${_darcula_version}'" Ghidra/Framework/Docking/build.gradle
  echo "MODULE FILE LICENSE: lib/darcula-laf-${_darcula_version}.jar Apache License 2.0" >> Ghidra/Framework/Docking/Module.manifest

  echo -e "${_prefix}Setting release to PUBLIC"
  sed -i 's/application\.release\.name=.*/application.release.name=PUBLIC/' Ghidra/application.properties

  ##
  ## FOR GHIDRA DEVELOPERS
  ## (Left commented because the steps below are only required if you want to develop and contribute to ghidra)
  ## https://github.com/NationalSecurityAgency/ghidra/blob/master/DevGuide.md
  ##

#  echo -e "${_prefix}Setting up the developers environment"
#  gradle --parallel prepDev
#
#  echo -e "${_prefix}Setting up the eclipse configurations"
#  gradle --parallel eclipse
#
#  echo -e "${_prefix}Compiling the linux64 native binaries"
#  gradle --parallel buildNatives_linux64
#
#  echo -e "${_prefix}Compiling the precompile language modules"
#  gradle --parallel sleighCompile
}

build() {
  cd "$srcdir"/darcula-laf
  echo -e "${_prefix}Building darcula-laf"
  gradle --parallel jar
  mkdir -p "$srcdir/$_pkgname"/flatRepo
  cp build/libs/darcula-laf-${_darcula_version}.jar -t "$srcdir/$_pkgname"/flatRepo

  cd "$srcdir/$_pkgname"
  echo -e "${_prefix}Building Ghidra"
  gradle --parallel buildGhidra
}

package() {
  cd "$_pkgname"

  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt,usr/bin}

  echo -e "${_prefix}Extracting the zip archive"
  _appver=$(grep -oP '(?<=^application.version=).*$' Ghidra/application.properties)
  _relname=$(grep -oP '(?<=^application.release.name=).*$' Ghidra/application.properties)
  (cd "$pkgdir"/opt && jar xf "$srcdir/$_pkgname"/build/dist/ghidra_"${_appver}_${_relname}_$(date +"%Y%m%d")"_linux64.zip)

  echo -e "${_prefix}Setting up a versionless directory name"
  mv "$pkgdir"/opt/ghidra{_"${_appver}_${_relname}",}

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  echo -e "${_prefix}Setting up desktop shortcut"
  install -Dm 644 ../ghidra.desktop -t "$pkgdir"/usr/share/applications

  echo -e "${_prefix}Setting up desktop icon"
  install -Dm 644 Ghidra/Framework/Generic/src/main/resources/images/GhidraIcon256.png "$pkgdir"/usr/share/pixmaps/ghidra.png
}
