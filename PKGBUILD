# Maintainer: Didrole <Didrole@gmail.com>

pkgname='hostd'
pkgver=2.4.1
pkgrel=1
pkgdesc='An advanced host solution, designed to enhance the experience for storage providers within the Sia network.'
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('git' 'go')
url='https://sia.tech/software/hostd'
license=('MIT')
install='hostd.install'
backup=('etc/hostd/hostd.yml')
_tag='ed19edc38d35ba3cb0d8588361799b1eda23cf0a'
source=("git+https://github.com/SiaFoundation/hostd.git#tag=${_tag}"
        "hostd.sysusers"
        "hostd.tmpfiles"
        "hostd.service"
        "hostd.install"
        "hostd.yml")
sha256sums=('c27b782171e00c65d924c18cc1e59be55327a27a1ea6147afa2f0081feb4d014'
            'd65ccb7decc6b266a64f51ab30d43912a6d8dcdc3aa67ccd703ee3d187f16c74'
            '14cdb76c39de37037b712a051e81b231164be6a1a1a021b1a2d0da490fb048eb'
            'a3237f0859becc05bf30809dc8dcac198fea22d893c38ba9514bd50e558b4bc9'
            'd219d4ca9d22c268b9823d9138d265a54ae4067df6b57a8e951e050659731191'
            '2dd1ed217b72bc8f5ca08c3bb14eb4725f8a0c0dcb33ed9cfaf21bb79ba3a83d')

build() {
  cd "${srcdir}/${pkgname}"
  
  go generate ./...
  CGO_ENABLED=1 go build -o bin/ -tags='netgo timetzdata' -trimpath -a -ldflags '-s -w'  ./cmd/hostd
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/hostd.service" "${pkgdir}/usr/lib/systemd/system/hostd.service"
  install -Dm644 "${srcdir}/hostd.sysusers" "${pkgdir}/usr/lib/sysusers.d/hostd.conf"
  install -Dm644 "${srcdir}/hostd.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/hostd.conf"
  install -Dm640 "${srcdir}/hostd.yml" "${pkgdir}/etc/hostd/hostd.yml"

  install -Dm755 "bin/hostd" -t "${pkgdir}/usr/bin"
}
