# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=cloudflare-warp-nox-bin
pkgver=2026.6.836
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
b2sums_x86_64=('1295186aec98ad277d7f53f4fa4a6f9542e4acae60a1623e2483a8fc3ed9ca055fa6da5e1e85ac2c2b8f7896e93c48625b6c34d30f605f9d8780a3475efa60f5')
b2sums_aarch64=('e1403c6e02090cb83158d7df47300eab91192fe96622b5b388d79e1b5629ddd9dc73768f3f11dd1813217a4b805986755f1632bc33847fa0060c14b15f6d6738')

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
