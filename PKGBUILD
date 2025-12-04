# Maintainer: kStor2poche <kStor2poche [at] orange [dot] fr>
# Contributor: Luke Street <luke@street.dev>
# Contributor: Arnaud Dovi <mr.dovi@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Danny Bautista <pyrolagus@gmail.com>
# Contributor: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=ghidra-git
pkgver=11.4.3.r1035.ccfea7e4c0
pkgrel=2
pkgdesc='Software reverse engineering framework (git)'
arch=('x86_64' 'aarch64') # Not sure aarch64 is correct here. Please confirm it to me in the comments if you can test that!
url='https://www.nsa.gov/ghidra'
license=('Apache-2.0')
provides=('ghidra')
depends=(
  'bash'
  'java-environment=21'
  'python'
)
makedepends=(
  'git'
  'gradle'
  'python-pip'
)
optdepends=(
  'ghidra-desktop: Desktop Entry'
  'python-protobuf: Debugger integration'
  'gdb: GDB Debugger integration'
  'lldb: LLDB Debugger integration'
  'pam: GhidraServer support' # should already be there as it is a dependency of the base package through systemd
  # 'python-psutil: GDB integration'
)
conflicts=('ghidra')

options=('!strip')
source=(
  "git+https://github.com/NationalSecurityAgency/ghidra"
)
sha512sums=(
  'SKIP'
)
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
  if [[ ! $JDK_VERSION =~ 2[1-9]\.0 ]]; then
    echo "FAILURE: You seem to have jdk21 or above installed correctly but your system defaults to another java version. To enable it please type: sudo archlinux-java set java-21-openjdk"
    exit 1
  fi

  # NOTE: this already fetches the correct version for all the build dependencies, including ghidra-data and python ones, but ghidra wants to use system python so python-protobuf is still needed for debugger support
  echo -e "${_prefix}Setting up the build dependencies"
  gradle --parallel --init-script gradle/support/fetchDependencies.gradle

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
  gradle buildGhidra
}

package() {
  cd "$_pkgname"

  echo -e "${_prefix}Creating the package base"
  install -d "$pkgdir"/{opt,usr/bin}

  echo -e "${_prefix}Extracting the zip archive"
  _appver=$(grep -oP '(?<=^application.version=).*$' Ghidra/application.properties)
  _relname=$(grep -oP '(?<=^application.release.name=).*$' Ghidra/application.properties)
  bsdtar xf build/dist/ghidra_"${_appver}_${_relname}_$(date +"%Y%m%d")"_linux_*.zip -C "$pkgdir"/opt

  echo -e "${_prefix}Setting up a versionless directory name"
  mv "$pkgdir"/opt/ghidra{_"${_appver}_${_relname}",}

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/pyghidraRun "${pkgdir}"/usr/bin/pyghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless
}

# vim: ts=2 sw=2 et:
