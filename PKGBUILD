# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=cloudflare-warp-nox-bin
pkgver=2026.6.822
pkgrel=1
pkgdesc="Cloudflare Warp Client (for servers without graphical environment)"
arch=('x86_64' 'aarch64')
url="https://1.1.1.1"
license=('unknown')
depends=('dbus' 'gcc-libs' 'glibc' 'nftables' 'nspr' 'nss')
provides=('warp-cli' 'warp-svc')
conflicts=('cloudflare-warp' 'cloudflare-warp-bin')
options=('!debug' '!strip' '!emptydirs')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://pkg.cloudflareclient.com/pool/noble/main/c/cloudflare-warp/cloudflare-warp_${pkgver}.0_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://pkg.cloudflareclient.com/pool/noble/main/c/cloudflare-warp/cloudflare-warp_${pkgver}.0_arm64.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb" "${pkgname}-${pkgver}-aarch64.deb")
b2sums_x86_64=('dc71ffcc668eae50a58c29610f1a6ed6dbfb3edbe98c07ad0239ab464d47cfb6c23dd467ab8079fe190207c30bba6abbf0f40e6459412cbd325a259ccdec7294')
b2sums_aarch64=('fb910f2311a21630d69d4daae0eba51a01dfc6e3a96f4a3e945d2dd83ae41ec345d665408104ecac1564775b29fa062cfca88cfbf867594d573f46329f189c0e')

prepare() {
  mkdir -p "${srcdir}/extract"
  bsdtar -O -xf "${pkgname}-${pkgver}-${CARCH}.deb" data.tar.gz | bsdtar -C "${srcdir}/extract" -xJf -
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
