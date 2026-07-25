# Maintainer: Andrew O'Neill <andrew at haunted dot sh>

pkgname=crate
pkgver=6.4.1
pkgrel=1
pkgdesc='Shared nothing, fully searchable, document oriented cluster datastore'
arch=('x86_64')
url='https://crate.io'
license=('Apache-2.0')
depends=('python')
makedepends=('maven' 'java-environment-openjdk>=11')
install='crate.install'
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.service"
        "${pkgname}.env")
backup=('etc/crate/crate.yml'
        'etc/crate/logging.yml')
sha256sums=('e6c7a9a8b5344a49310c3dfc0d02923d1fe75bec9a23bf321929e323bb09ed88'
            '04b36b561498332b1b569e49b42d0bedf04141de07b7b16ff1b06072673cfd21'
            '6182b8d527d52de4fc80023827518b2e8d873afdda873ef6bd2ed92b91982f75')

build() {
  cd "${pkgname}-${pkgver}"

  ./mvnw package -DskipTests=true -Dmaven.gitcommitid.skip=true
}

package() {
  cd "${pkgname}-${pkgver}/app/target"

  mkdir "${pkgname}-${pkgver}"
  tar xf ${pkgname}-${pkgver}-*.tar.gz -C ${pkgname}-${pkgver} --strip-components=1
  cd "${pkgname}-${pkgver}"

  # Remove duplicate jar to prevent jar hell
  rm lib/${pkgname}-${pkgver}-*-null.jar

  # Create dirs
  install -dm755 "${pkgdir}/etc/${pkgname}/"
  install -dm755 "${pkgdir}/var/log/${pkgname}/"
  install -dm755 "${pkgdir}/usr/share/${pkgname}/"
  cp -R bin config jdk lib logs plugins "${pkgdir}/usr/share/${pkgname}/"

  cp config/* "${pkgdir}/etc/${pkgname}"

  # Documentation
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}/"
  cp NOTICE "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  cp CHANGES.txt "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"

  install -Dm644 "${srcdir}/crate.env" "${pkgdir}/etc/${pkgname}/crate.env"
  install -Dm644 "${srcdir}/crate.service" "${pkgdir}/usr/lib/systemd/system/crate.service"
}
