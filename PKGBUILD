# Maintainer: Didrole <Didrole@gmail.com>

pkgname='hostd'
pkgver=1.1.2
pkgrel=2
pkgdesc='An advanced host solution, designed to enhance the experience for storage providers within the Sia network.'
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('git' 'go')
url='https://sia.tech/software/hostd'
license=('MIT')
install='hostd.install'
backup=('etc/conf.d/hostd' 'etc/hostd.yml')
_tag='4ec13d681554e50c54c3437f4565921fbfac75f4'
source=("git+https://github.com/SiaFoundation/hostd.git#tag=${_tag}"
        "hostd.sysusers"
        "hostd.tmpfiles"
        "hostd.service"
        "hostd.install"
        "hostd.yml")
sha256sums=('64062b88b5ca163357d32cb26d6595b029bc8ca4bd685b0b8263e41ca6cbf981'
            'd65ccb7decc6b266a64f51ab30d43912a6d8dcdc3aa67ccd703ee3d187f16c74'
            '23917e6034280d9891069a24d9069c46ba70cc52fb7515896edb4ade8614862f'
            '1dd23f6dd6ae61bbad1034dc4afd752cb6c957f08a6c0dc8175b75243ce5625c'
            '242e96b289d798d56f05a0769a4059884885ecee9b30621eda6324e58850806f'
            '653ffb17f23ce1cbf2a12c4e67e0b33d48118197b6ccb89cc3ced0f25d77bc62')

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
  install -Dm640 "${srcdir}/hostd.yml" "${pkgdir}/etc/hostd.yml"

  install -Dm755 "bin/hostd" -t "${pkgdir}/usr/bin"
}
