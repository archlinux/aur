# Submitter: der_ronny <ronnymichaelradke[at]web[dot]de>
# Maintainer: Marcel Robitaille <mail@marcelrobitaille.me>
# Co-Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
pkgname=repetier-host
pkgver=2.3.1
pkgrel=1
pkgdesc="almost complete 3d-printing workflow"
url='http://www.repetier.com/'
arch=('x86_64' 'i686')
license=('custom')
depends=('desktop-file-utils' 'mono')
optdepends=('slic3r' 'skeinforge')
source=("http://download.repetier.com/files/host/linux/repetierHostLinux_${pkgver//./_}.tgz"
        "${pkgname}_fix-desktop-file.diff")
sha256sums=('722873f101ecf35281ded79f6cd005f8b6afebbb50621dff46f52ab9da456494'
            '2a76d65261e43ad75a6032be326cc4e5eaa21de0ca3ce9b3f97ad33fb8f2c7be')

prepare() {
  cd ${srcdir}/RepetierHost
  patch -p1 -i "${srcdir}/${pkgname}_fix-desktop-file.diff"
}

build() {
  cd ${srcdir}/RepetierHost
  g++ SetBaudrate.cpp -o SetBaudrate
}

package() {
  cd ${srcdir}/RepetierHost

  find \
    ! -name '*.txt' \
    ! -name '*.cpp' \
    ! -name '*.sh' \
    ! -name 'CuraEngine32' \
    ! -name 'CuraEngine64' \
    ! -name 'Thumbs.db' \
    ! -name '.DS_Store' \
    ! -name '*.application' \
    ! -name 'repetierHost' \
    ! -name '*.desktop' \
    ! -name 'installDependencies*' \
    ! -name 'repetier-logo.png' \
    -exec install -Dm644 {} ${pkgdir}/usr/share/RepetierHost/{} \;

  install -Dm755 repetierHost "${pkgdir}/usr/bin/repetierHost"

  install -Dm644 Repetier-Host.desktop \
    "${pkgdir}/usr/share/applications/RepetierHost.desktop"

  install -Dm644 repetier-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/repetierHost.png"

  install -Dm644 Repetier-Host-licence.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  case $arch in
    "i686")
      install -Dm755 plugins/CuraEngine/CuraEngine32 \
        "$pkgdir/usr/share/RepetierHost/plugins/CuraEngine/CuraEngine"
      ;;
    "x86_64")
      install -Dm755 plugins/CuraEngine/CuraEngine64 \
        "$pkgdir/usr/share/RepetierHost/plugins/CuraEngine/CuraEngine"
      ;;
    *)
      exit 1
      ;;
  esac
}
