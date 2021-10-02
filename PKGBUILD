# Maintainer: David Manouchehri <manouchehri@riseup.net>

pkgname=bindiff
pkgver=7
pkgrel=1
pkgdesc="A comparison tool for binary files that assists vulnerability researchers and engineers to quickly find differences and similarities in disassembled code."
arch=('x86_64')
url="https://www.zynamics.com/bindiff.html"
license=('custom')
depends=('desktop-file-utils' 'java-runtime>=11')
options=('!strip')
install=${pkgname}.install
backup=("etc/opt/${pkgname}/bindiff.json")
source=("https://storage.googleapis.com/bindiff-releases/bindiff_${pkgver}_amd64.deb"{,.asc})
sha256sums=('cb9216518acb9cc4be6b5e538bafe86470bdbed233477440804a29dd06f32f4f'
            'SKIP')
validpgpkeys=('EB4C1BFD4F042F6DDDCCEC917721F63BD38B4796')  # Google Inc. (Linux Packages Signing Authority)

package() {
  # Extract
  tar -xJf data.tar.xz --exclude="usr/share/lintian" -C "${pkgdir}"/

  # Remove the bundled Java runtime
  rm -r "${pkgdir}"/opt/bindiff/jre

  # Install license files
  install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"

  # Write install location to config file
  sed -i 's/^\( "directory": "\)\(",\)/\1\/opt\/bindiff\/\2/' "${pkgdir}"/etc/opt/bindiff/bindiff.json
}

# vim:set et sw=2 sts=2 tw=80:
