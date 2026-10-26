# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: Stefan Sielaff <aur AT stefan-sielaff DOT de>

pkgname=lyrionmusicserver-bin
pkgver=9.1.1
pkgrel=1
pkgdesc="Slimserver for Logitech Squeezebox players. This server is also called Logitech Media Server)"
arch=(i686 x86_64 armv7h aarch64)
url="https://github.com/LMS-Community/slimserver"
license=(GPL-2.0-only)
depends=(perl zlib glibc)
install=lyrionmusicserver.install
options=(!strip)
source=("https://downloads.lms-community.org/LyrionMusicServer_v${pkgver}/lyrionmusicserver-${pkgver}.tgz"
        'lyrionmusicserver-bin.service')
sha256sums=('ca59ea5c8aad106ae88a1dbfd13c7903e71942eafbed5aee4c8a61d4dad4bd4d'
            '3d65ec7cc57a1bc0d351a377efb2895a6f5cfe7b7b8b1a165e1de0f6af11d1a0')

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
