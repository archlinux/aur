# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=cloudflare-warp-nox-bin
pkgver=2026.1.150
pkgrel=1
pkgdesc="Cloudflare Warp Client (for servers without graphical environment)"
arch=('x86_64')
url="https://1.1.1.1"
license=('unknown')
depends=('dbus' 'gcc-libs' 'glibc' 'nftables' 'nspr' 'nss')
provides=('warp-cli' 'warp-svc')
conflicts=('cloudflare-warp' 'cloudflare-warp-bin')
options=('!debug' '!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.deb::https://pkg.cloudflareclient.com/pool/noble/main/c/cloudflare-warp/cloudflare-warp_${pkgver}.0_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
b2sums=('5d04e86b09166381809a17234f7f468ba287b469ae9118a9be781f04fe0ef735620a75ede690e7d3d8438ed903520c2b0acf075f21dd0b5575d6f9d8e80125bc')

prepare() {
  mkdir -p "${srcdir}/extract"
  bsdtar -O -xf "${pkgname}-${pkgver}.deb" data.tar.gz | bsdtar -C "${srcdir}/extract" -xJf -
}

package() {
  mkdir -p "${pkgdir}/usr"
  mv "${srcdir}/extract/"{bin,lib} "${pkgdir}/usr"

  # fix service
  sed -i -e "s%ExecStart=/bin/warp-svc%ExecStart=/usr/bin/warp-svc%" \
    "${pkgdir}/usr/lib/systemd/system/warp-svc.service"

  # removes graphical tool
  rm "${pkgdir}/usr/bin/warp-taskbar"
}
