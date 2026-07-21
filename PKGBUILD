# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=cloudflare-warp-nox-bin
pkgver=2026.6.880
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
b2sums_x86_64=('a1c1f2e9666eca419296f63640035a49646d100cd4b15fec3b48c8b08ccde205fff50e5e6311cb497fc8ec9ecf1e1866bbfed8253e4523b3ead1452fba242829')
b2sums_aarch64=('57ed36ee2efa5ce38426c2970a245ef1ae8744c35d0a86c5d7bed4eb2086a1adc646e3a2b34457919491c9bfee484163537fb86481b2b9d1cc3d072912b54a38')

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
