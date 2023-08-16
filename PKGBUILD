# Maintainer: Didrole <Didrole@gmail.com>

pkgname='hostd'
pkgver=0.1.4
pkgrel=1
pkgdesc='An advanced host solution, designed to enhance the experience for storage providers within the Sia network.'
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('git' 'go')
url='https://sia.tech/software/hostd'
license=('MIT')
install='hostd.install'
backup=('etc/conf.d/hostd')
_tag='e52ad088d70be700483a793fca5e90568b45a81f'
source=("git+https://github.com/SiaFoundation/hostd.git#tag=${_tag}"
        "hostd.sysusers"
        "hostd.tmpfiles"
        "hostd.service"
        "hostd.install"
        "hostd.env")
sha256sums=('SKIP'
            'd65ccb7decc6b266a64f51ab30d43912a6d8dcdc3aa67ccd703ee3d187f16c74'
            '9341e0f2228a0054beb111b93eeb510614249dab262ac6b51481942f2fffd3a0'
            '6fdafd79414ba518862662b5d9f7da4851c721323ee42aaec5c5c95c871afedc'
            'b9ec9874e838163451777d6f0f469aff8a2c063860d60c31627f1fd76eb52d86'
            'd70b0b00b276f6074ac1450af6db81fcf81121aa67ff8ab90665ec4f6289d20c')

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
  install -Dm640 "${srcdir}/hostd.env" "${pkgdir}/etc/conf.d/hostd"

  install -Dm755 "bin/hostd" -t "${pkgdir}/usr/bin"
}
