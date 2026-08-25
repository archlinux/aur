# Maintainer: kStor2poche <kStor2poche [at] orange [dot] fr>
# Contributor: Luke Street <luke@street.dev>
# Contributor: Arnaud Dovi <mr.dovi@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Danny Bautista <pyrolagus@gmail.com>
# Contributor: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=ghidra-git
pkgver=12.1.3.r1007.382b26c9a5
pkgrel=1
pkgdesc='Software reverse engineering framework (git)'
arch=('x86_64' 'aarch64') # Not sure aarch64 is correct here. Please confirm it to me in the comments if you can test that!
url='https://www.nsa.gov/ghidra'
license=('Apache-2.0')
provides=('ghidra')
depends=(
  'bash'
  'java-environment>=25'
  'python'
)
makedepends=(
  'git'
  'gradle'
  'python-pip'
)
optdepends=(
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
  "ghidra.desktop"
)
sha512sums=(
  'SKIP'
  'e611f0a84023aee72016a8bb73a627e4d3b3fc28201fe2b60ccc8d6628fc2e7005b9edc24e35e489311fd6fa9ed1a35d5e230e2657a77b331dbf7cd6773ae957'
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
  JDK_VERSION=$(java --version)
  if [[ ! $JDK_VERSION =~ (2[5-9]|[3-9][0-9])\.[0-9] ]]; then
    echo "FAILURE: You seem to have jdk25 or above installed correctly but your system defaults to another java version. To enable it please type: sudo archlinux-java set java-25-openjdk"
    exit 1
  fi

  # NOTE: this already fetches the correct version for all the build dependencies, including ghidra-data and python ones, but ghidra wants to use system python so python-protobuf is still needed for debugger support
  echo -e "${_prefix}Setting up the build dependencies"
  gradle --parallel --init-script gradle/support/fetchDependencies.gradle
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
  bsdtar xf build/dist/ghidra_"${_appver}_${_relname}_$(date +"%Y%m%d")".zip -C "$pkgdir"/opt

  echo -e "${_prefix}Setting up a versionless directory name"
  mv "$pkgdir"/opt/ghidra{_"${_appver}_${_relname}",}

  echo -e "${_prefix}Setting up /usr/bin launchers"
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
  ln -s /opt/ghidra/support/pyghidraRun "${pkgdir}"/usr/bin/pyghidra
  ln -s /opt/ghidra/support/analyzeHeadless "$pkgdir"/usr/bin/ghidra-headless

  echo -e "${_prefix}Setting up the desktop file"
  install -Dm644 ../ghidra.desktop "${pkgdir}"/usr/share/applications/ghidra.desktop

  echo -e "${_prefix}Setting up the desktop file"
  for _size in 16 24 32 48 128 256; do
    install -vDm 644 Ghidra/Framework/Gui/src/main/resources/images/GhidraIcon$_size.png \
      "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/ghidra.png"
  done
}

# vim: ts=2 sw=2 et:
