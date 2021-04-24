# Maintainer: Luke Street <luke@street.dev>
# Contributor: Arnaud Dovi <mr.dovi@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Danny Bautista <pyrolagus@gmail.com>

pkgname=ghidra-git
pkgver=9.2.3+r725+gb57744d4e
pkgrel=1
pkgdesc='Software reverse engineering framework (git)'
arch=('x86_64')
url='https://www.nsa.gov/ghidra'
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
  'unzip'
)
source=(
  "git+https://github.com/NationalSecurityAgency/ghidra"
  ghidra.desktop
)
sha512sums=(
  'SKIP'
  'a85b8b3276e2ff4ed8bda6470c15d02711ebaa48463c775cd2a36549fad738e9fe073dab80f8c57646490ffc959cdc27e9d25b1dc2a5810b0ddb249b5dc99a9b'
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
  cd "$_pkgname"
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
  unzip -u build/dist/ghidra_"${_appver}_${_relname}_$(date +"%Y%m%d")"_linux64.zip -d "$pkgdir"/opt

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
