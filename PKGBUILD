# Maintainer: Luke Street <luke@street.dev>
# Contributor: Arnaud Dovi <mr.dovi@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Danny Bautista <pyrolagus@gmail.com>
# Contributor: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=ghidra-git
pkgver=10.2.3.r655.601ab94c1
pkgrel=1
pkgdesc='Software reverse engineering framework (git)'
arch=('x86_64' 'aarch64')
options=(!strip)
url='https://www.nsa.gov/ghidra'
license=(Apache)
provides=('ghidra')
conflicts=(
  'ghidra'
  'ghidra-dev'
  'ghidra-desktop'
)
depends=(
  'bash'
  'java-environment>=17'
  'polkit'
)
makedepends=(
  'fop'
  'git'
  'gradle'
  'unzip'
)
source=(
  "git+https://github.com/NationalSecurityAgency/ghidra"
  'ghidra.desktop'
  'ghidra-root.desktop'
  'ghidra.policy'
)
sha512sums=('SKIP'
            'a85b8b3276e2ff4ed8bda6470c15d02711ebaa48463c775cd2a36549fad738e9fe073dab80f8c57646490ffc959cdc27e9d25b1dc2a5810b0ddb249b5dc99a9b'
            'c717029cf31860e27b5563c3ff4b2740d4b1997bc50481214e24c38f12d9acbfa9ca2cbfe594d43071fbf8420ac8f022119c2c23ddef0c717d96860e22eb35c3'
            '0a35f58b1820ac65ce37d09b0a6904ab7018c773c73ecd29bcfda37cbd27f34af868585084b5cd408b1066b7956df043cb1573a1e3d890e173be737d2de51401')
_pkgname="${pkgname/-git/}"
_stop='\e[m'
_color="\e[33m"
_bold='\e[1m'
_prefix=" ${_bold}${_color}==>$_stop "



pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --tags | sed 's/Ghidra_\([^_]*\)_build/\1/;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$_pkgname"

  # Check Java version (thanks @ignapk)
  JDK_VERSION=$(java -version 2>&1)
  if [[ ! $JDK_VERSION =~ 1[7|9]\.0 ]]; then
    echo "FAILURE: You seem to have jdk17 or jdk19 installed correctly but your system defaults to another java version. To enable it please type: sudo archlinux-java set java-17-openjdk"
    exit 1
  fi

  # DEPRECATED PATCH - GP-793 corrected missing IP info - https://github.com/NationalSecurityAgency/ghidra/commit/70675fce99a4c6e6e650729e5dda6ccbbbbbd40d
#  echo -e "${_prefix}[PATCH] - GP-793 corrected missing IP info (https://github.com/NationalSecurityAgency/ghidra/commit/70675fce99a4c6e6e650729e5dda6ccbbbbbd40d)"
#  patch --no-backup-if-mismatch --forward --strip=2 --input="${srcdir}/0000-GP-793-corrected-missing-IP-info.patch"

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
  gradle --parallel buildGhidra -x ip
}

package() {
  cd "$_pkgname"

  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt,usr/bin}

  echo -e "${_prefix}Extracting the zip archive"
  _appver=$(grep -oP '(?<=^application.version=).*$' Ghidra/application.properties)
  _relname=$(grep -oP '(?<=^application.release.name=).*$' Ghidra/application.properties)
  unzip -u build/dist/ghidra_"${_appver}_${_relname}_$(date +"%Y%m%d")"_linux_*.zip -d "$pkgdir"/opt

  echo -e "${_prefix}Setting up a versionless directory name"
  mv "$pkgdir"/opt/ghidra{_"${_appver}_${_relname}",}

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  echo -e "${_prefix}Setting up desktop shortcuts"
  install -Dm 644 ../ghidra.desktop -t "$pkgdir"/usr/share/applications
  install -Dm 644 ../ghidra-root.desktop -t "$pkgdir"/usr/share/applications

  echo -e "${_prefix}Setting up desktop icon"
  install -Dm 644 Ghidra/Framework/Gui/src/main/resources/images/GhidraIcon64.png "$pkgdir"/usr/share/pixmaps/ghidra.png

  echo -e "${_prefix}Setting up policy file for the \"run as root\" desktop shortcut"
  install -Dm 644 ../ghidra.policy -t "$pkgdir"/usr/share/polkit-1/actions
}
