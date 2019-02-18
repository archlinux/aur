# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: wenLiangcan <boxeed at gmail dot com>

pkgname="pcap-dnsproxy-git"
pkgver=0.4.9.13.r0.g70a40bb
pkgrel=1
epoch=1 # default value if left unspecified is 0
pkgdesc="A local DNS server base on WinPcap and LibPcap."
arch=('x86_64') # 'i686' untested
url="https://github.com/chengr28/Pcap_DNSProxy"
license=('GPL2')
depends=(
  'libevent>=2.1.8'
  'libpcap'
  'libsodium>=1.0.16'
  'openssl>=1.0.2'
)
makedepends=('git' 'cmake' 'm4' 'bison' 'flex' 'gcc')
provides=("${pkgname%-git}" "${pkgname%-git}-bin")
conflicts=("${pkgname%-git}" "${pkgname%-git}-bin")
backup=(
  "etc/systemd/system/Pcap_DNSProxy.service"
  "etc/${pkgname%-git}/Config.conf"
  "etc/${pkgname%-git}/Hosts.conf"
  "etc/${pkgname%-git}/IPFilter.conf"
  "etc/${pkgname%-git}/Routing.txt"
  "etc/${pkgname%-git}/WhiteList.txt"
)
install="${pkgname%-git}.install"
source=(
  "${pkgname%-git}::git+git://github.com/chengr28/Pcap_DNSProxy.git"
  "${pkgname%-git}.install"
  "make.patch"
  "service.patch"
)
md5sums=(
  'SKIP'
  'e990e642a0aac24c8f2d68d60b65b314'
  '7d59b750c7375bb77bcb2b6fae326e3b'
  'abe842d6182ec4be0cc5130433146129'
)

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

  cd "${srcdir}/${pkgname%-git}"

  patch --verbose Source/Auxiliary/Scripts/CMake_Build.sh "${srcdir}/make.patch"
  patch --verbose Source/Auxiliary/ExampleConfig/Pcap_DNSProxy.service "${srcdir}/service.patch"

  find . \
    \( \
      -name '*.zh-Hans.*' -o \
      -name '*.zh-Hant.*' -o \
      -name '*.SysV.*' -o \
      -name 'PcapDNSProxyService' -o \
      -name 'Linux_Install.Systemd.sh' -o \
      -name 'Linux_Uninstall.Systemd.sh' -o \
      \( \
        \( \
          -name '*.sln' -o \
          -name '*.vcxproj*' -o \
          -name '*.xcodeproj' -o \
          -name '*macOS*' -o \
          -name '*Windows*' \
        \) -a -not -iname '*linux*' \
      \) \
    \) \
    -prune -exec rm -rfv {} \;

  mv -v README.md Documents/
}

build() {
  cd "${srcdir}/${pkgname%-git}/Source/Auxiliary/Scripts"
  chmod +x CMake_Build.sh
  time ./CMake_Build.sh
}

package() {

  cd "${srcdir}/${pkgname%-git}/Source/Release"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}/Documents"/* "${pkgdir}/usr/share/doc/${pkgname%-git}/"

  install -dm755  "${pkgdir}/etc/systemd/system"
  install -Dm644 Pcap_DNSProxy.service "${pkgdir}/etc/systemd/system/"

  install -dm755 "${pkgdir}/usr/bin/"
  install -Dm755 \
    Pcap_DNSProxy \
    Tools/Update_Routing.sh \
    Tools/Update_WhiteList.sh \
    "${pkgdir}/usr/bin/"

  install -dm755 "$pkgdir/etc/${pkgname%-git}/"
  install -Dm644 \
    Config.conf \
    Hosts.conf \
    IPFilter.conf \
    Routing.txt \
    WhiteList.txt \
    "$pkgdir/etc/${pkgname%-git}/"

}