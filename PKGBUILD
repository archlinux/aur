# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver-bin
pkgver=9.0.0
pkgrel=2
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=(perl zlib glibc)
install=lyrionmusicserver.install
options=(!strip)
source=("https://downloads.lms-community.org/LyrionMusicServer_v${pkgver}/lyrionmusicserver-${pkgver}.tgz"
        'lyrionmusicserver-bin.service')
sha256sums=('aea9bb5f00bce5b95753c08d4540d87aa396e500375144e81a0c909cb8a8bafa'
            'f2ea75494d3a24c04189914d0387af7a18359639d8b2ac851c1daf6f731a978c')

prepare() {
  cd "lyrionmusicserver-${pkgver}/Bin"
  rm -rf MSWin32-x86-multi-thread darwin darwin-x86_64 i386-freebsd-64int i86pc-solaris-thread-multi-64int powerpc-linux sparc-linux

  case $CARCH in
    x86_64) rm -rf {arm,armhf,aarch64,i386}-linux ;;
    i686) rm -rf {arm,armhf,aarch64,x86_64}-linux ;;
    aarch64) rm -rf {i386,x86_64,arm,armhf}-linux ;;
    arm*) rm -rf {i386,x86_64,aarch64}-linux ;;
  esac
}

package() {
  install -Dm644 lyrionmusicserver-bin.service -t "${pkgdir}/usr/lib/systemd/system/"

  cd "lyrionmusicserver-${pkgver}"
  install -d "${pkgdir}"/{opt,usr/share/licenses}/"${pkgname}"
  ln -s "/opt/${pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # remove old perl modules
  cd "${srcdir}/lyrionmusicserver-${pkgver}/CPAN/arch"
  rm -rf {5.10,5.12,5.14,5.16,5.16,5.18,5.20,5.22,5.24,5.26,5.28,5.30,5.32,5.34,5.36,5.38}

  cd "${srcdir}/lyrionmusicserver-${pkgver}"
  cp -a * "${pkgdir}/opt/${pkgname}"

  mkdir -p "${pkgdir}"/opt/lyrionmusicserver-bin/{cache,Logs,prefs{,/plugin},Plugins}
}
