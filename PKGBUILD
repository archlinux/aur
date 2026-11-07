# Maintainer: David Newhall II <captain at golift dot io>
# Maintainer: Donald Webster <fryfrog at gmail dot com>

pkgname='notifiarr-bin'
appname='notifiarr'
pkgver=0.10.0
pkgrel=1
pkgdesc='Official Client for Notifiarr.com'
url='https://notifiarr.com'
arch=('x86_64' 'armhf' 'armv7h' 'aarch64' 'i686' 'pentium4')
license=('MIT')
provides=('notifiarr')
makedepends=('go' 'gzip')
options=('!strip')
backup=('etc/notifiarr/notifiarr.conf')
install=notifiarr.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Notifiarr/notifiarr/archive/refs/tags/v0.10.0.tar.gz")
sha256sums=('c5fea580dbfaf95bd0e6cb9b806d3781e13a0f4014d31246f168217783309d8b')
source_x86_64=("${pkgname}-${pkgver}.x86_64.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.10.0/notifiarr.amd64.linux.gz")
source_armhf=("${pkgname}-${pkgver}.armhf.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.10.0/notifiarr.arm.linux.gz")
source_armv7h=("${pkgname}-${pkgver}.armv7h.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.10.0/notifiarr.arm.linux.gz")
source_aarch64=("${pkgname}-${pkgver}.aarch64.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.10.0/notifiarr.arm64.linux.gz")
source_i686=("${pkgname}-${pkgver}.i686.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.10.0/notifiarr.386.linux.gz")
source_pentium4=("${pkgname}-${pkgver}.pentium4.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.10.0/notifiarr.386.linux.gz")
sha256sums_x86_64=('705f88ed9c002bc9cc7e429b2377bc563658899a675970902c1511fc035be260')
sha256sums_armhf=('3736186b542f6c9764c8177b907e38d7332172015ce5d26f325428ba86af4343')
sha256sums_armv7h=('3736186b542f6c9764c8177b907e38d7332172015ce5d26f325428ba86af4343')
sha256sums_aarch64=('65da3820f42fd57363c4c8d16a4dc65317ebbefbc1deae0322205f096a39430d')
sha256sums_i686=('83fe78b5c5259cf971023d87659dd7e51226753b24780db4c23e8435e1e2bdc1')
sha256sums_pentium4=('83fe78b5c5259cf971023d87659dd7e51226753b24780db4c23e8435e1e2bdc1')

build() {
  cd "${appname}-${pkgver}"
  go run github.com/davidnewhall/md2roff@v0.0.1 --manual "${appname}" --version "${pkgver}" --date "$(date -u +%Y-%m-%d)" README.md
  go run github.com/davidnewhall/md2roff@v0.0.1 --manual "${appname}" --version "${pkgver}" --date "$(date -u +%Y-%m-%d)" examples/MANUAL.md
  gzip -9nf examples/MANUAL
  mv examples/MANUAL.gz "${appname}.1.gz"
}

package() {
  install -D -m 755 "${pkgname}-${pkgver}.${CARCH}" "${pkgdir}/usr/bin/${appname}"
  cd "${appname}-${pkgver}"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${appname}" "${pkgdir}/usr/share/doc/${appname}" "${pkgdir}/usr/share/applications" "${pkgdir}/etc/${appname}" "${pkgdir}/var/log/${appname}"
  install -D -m 644 "examples/${appname}.conf.example" "${pkgdir}/etc/${appname}/${appname}.conf"
  install -D -m 644 "examples/${appname}.conf.example" "${pkgdir}/etc/${appname}/${appname}.conf.example"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${appname}/LICENSE"
  install -D -m 644 examples/MANUAL.html "${pkgdir}/usr/share/doc/${appname}/notifiarr_manual.html"
  install -D -m 644 README.html "${pkgdir}/usr/share/doc/${appname}/README.html"
  install -D -m 644 examples/compose.yml "${pkgdir}/usr/share/doc/${appname}/compose.yml"
  install -D -m 644 examples/prometheus.yml "${pkgdir}/usr/share/doc/${appname}/prometheus.yml"
  install -D -m 644 examples/dashboard.json "${pkgdir}/usr/share/doc/${appname}/dashboard.json"
  install -D -m 644 "examples/${appname}.conf.example" "${pkgdir}/usr/share/doc/${appname}/${appname}.conf.example"
  install -D -m 644 "frontend/public/${appname}.png" "${pkgdir}/usr/share/doc/${appname}/${appname}.png"
  install -D -m 644 "${appname}.1.gz" "${pkgdir}/usr/share/man/man1/${appname}.1.gz"
  install -D -m 644 "init/linux/deb/usr/share/applications/${appname}.desktop" "${pkgdir}/usr/share/applications/${appname}.desktop"
  install -D -m 644 "init/systemd/${appname}.service" "${pkgdir}/usr/lib/systemd/system/${appname}.service"
  echo "u ${appname} - \"${appname} daemon\"" > "${appname}.sysusers"
  install -D -m 644 "${appname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${appname}.conf"
  install -D -m 644 "init/systemd/${appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${appname}.conf"
}
