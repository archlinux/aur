pkgname=wsdd2
pkgver=1.8.3.2
pkgrel=1
pkgdesc="WSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares discoverable on Windows hosts."
url="https://github.com/Andy2244/wsdd2"
arch=('x86_64' 'armv7h' 'aarch64')
license=(GPL)
depends=()
makedepends=()
source=(
  "wsdd2-${pkgver}-${pkgrel}.tar.gz::https://github.com/Andy2244/wsdd2/archive/${pkgver}.tar.gz"
)
sha256sums=('f459a85a876d5e1044f6414916cdf81f689dd80188574f93c352c1b9927275ec')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i s/smbd/smb/ wsdd2.service
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package()
{
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/usr/lib/systemd/system/smb.service.wants"

  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 "wsdd2" "${pkgdir}/usr/bin"
  install -D -m 644 "wsdd2.service" "${pkgdir}/usr/lib/systemd/system"
  cd "${pkgdir}/usr/lib/systemd/system/smb.service.wants"
  ln -s "../wsdd2.service" .
}
