# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=trackarr
pkgver=1.8.2
pkgrel=1
pkgdesc="Send irc based tracker announcements to Sonarr, Radarr and/or Lidarr."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://gitlab.com/cloudb0x/trackarr"
license=('GPL')
makedepends=(
  'go'
  'go.rice'
  'yarn'
)

source=(
  "https://gitlab.com/cloudb0x/trackarr/-/archive/v${pkgver}/trackarr-v${pkgver}.tar.bz2"
  'trackarr.tmpfiles'
  'trackarr.sysusers'
  'trackarr.service'
)
sha256sums=('df0b06678f3922561a86a73db8ef67914d8998781aa19bb81bbc5255dff89ac0'
            'ce3cf95823f61845cef3c266f9fcf686cf332c859ab7afffe7e5b7f765cba3fa'
            '3512f2f072b1945cf5809bf803cfc00871281bef83536aadac847f5542604c67'
            '7348fdd9e1bd48b8d5eb76abecd00fe621d64c27f211ca97d61dbbc4c71ffdea')

# Adapted from Makefile via `make -n`
prepare() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  go mod vendor

  cd "${srcdir}/${pkgname}-v${pkgver}/web/trackarr-ui" && yarn install && yarn build
  cd "${srcdir}/${pkgname}-v${pkgver}/web" && rice embed-go
}

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  go build -mod vendor -trimpath -ldflags "-extldflags $LDFLAGS -X main.buildVersion=${pkgver}" -o ${pkgname} .
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -D -m 0755 trackarr "${pkgdir}/usr/bin/trackarr"

  install -D -m 644 "${srcdir}/trackarr.sysusers" "${pkgdir}/usr/lib/sysusers.d/trackarr.conf"
  install -D -m 644 "${srcdir}/trackarr.service" "${pkgdir}/usr/lib/systemd/system/trackarr.service"
  install -D -m 644 "${srcdir}/trackarr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/trackarr.conf"
}
