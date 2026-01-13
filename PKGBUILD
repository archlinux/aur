# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=cloudflare-warp-nox-bin
pkgver=2025.10.186
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
b2sums=('e2f213855d8c6787a89f0912331752df30871ffb9ca99fd8280fecf196b90318bcf8a977fa7cc442e554ab924f85f7dba782183e7eb0561352495289820ef42c')

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
