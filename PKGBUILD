# Maintainer: David Newhall II <captain at golift dot io>
# Maintainer: Donald Webster <fryfrog at gmail dot com>

pkgname='notifiarr-bin'
appname='notifiarr'
pkgver=0.9.7
pkgrel=7
pkgdesc='Official Client for Notifiarr.com'
url='https://notifiarr.com'
arch=('x86_64' 'armhf' 'armv7h' 'aarch64' 'i686' 'pentium4')
license=('MIT')
provides=('notifiarr')
makedepends=('go' 'gzip')
options=('!strip')
backup=('etc/notifiarr/notifiarr.conf')
install=notifiarr.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Notifiarr/notifiarr/archive/refs/tags/v0.9.7.tar.gz")
sha256sums=('3399b73555961d825a78cbfcbc64810b49fc39bf46b5e74272451c132d97510e')
source_x86_64=("${pkgname}-${pkgver}.x86_64.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.9.7/notifiarr.amd64.linux.gz")
source_armhf=("${pkgname}-${pkgver}.armhf.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.9.7/notifiarr.arm.linux.gz")
source_armv7h=("${pkgname}-${pkgver}.armv7h.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.9.7/notifiarr.arm.linux.gz")
source_aarch64=("${pkgname}-${pkgver}.aarch64.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.9.7/notifiarr.arm64.linux.gz")
source_i686=("${pkgname}-${pkgver}.i686.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.9.7/notifiarr.386.linux.gz")
source_pentium4=("${pkgname}-${pkgver}.pentium4.gz::https://github.com/Notifiarr/notifiarr/releases/download/v0.9.7/notifiarr.386.linux.gz")
sha256sums_x86_64=('65eb045f4df660a51e0dbab3b471b47181838d4c537e3eff33563ffd09d05d71')
sha256sums_armhf=('10f91238a395d7cad1bdda0dd8fa8204bf18327fcbfb1cf7c82083a8a384da50')
sha256sums_armv7h=('10f91238a395d7cad1bdda0dd8fa8204bf18327fcbfb1cf7c82083a8a384da50')
sha256sums_aarch64=('767ade8e5f607c67cb825c4facaf70c4df6bb4fa871b3e9177faf0c6c379f16a')
sha256sums_i686=('446161d06c668ad36e2daf56463868b8636153681ccc5a010948219ea4e8087e')
sha256sums_pentium4=('446161d06c668ad36e2daf56463868b8636153681ccc5a010948219ea4e8087e')

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
  printf '%s\n'     "# Log dir only. Do not chown /etc/notifiarr; tmpfiles runs on every boot."     "d /var/log/notifiarr 0755 notifiarr notifiarr -"     > "${appname}.tmpfiles"
  install -D -m 644 "${appname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${appname}.conf"
}
