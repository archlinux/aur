# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Dominik Heidler <dominik@heidler.eu>

pkgname=open-ecard-git
pkgver=2.3.7
pkgrel=1
pkgdesc='Open eCard-App (opencard) is an open source alternative of the AusweisApp'
arch=('any')
url='https://www.openecard.org'
license=("GPL3")
depends=('java-runtime>=17' 'pcsclite')
makedepends=('git' 'gradle')
provides=('open-ecard')
conflicts=('open-ecard')
source=('git+https://github.com/ecsec/open-ecard.git')
b2sums=('SKIP')

pkgver() {
  cd ${pkgname/-git/}
  echo $(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd open-ecard/clients/richclient
  gradle build
}

package() {
  install -dm755 "${pkgdir}"/usr/{bin,share/open-ecard}
  tar --strip-components=1 -xvf "${srcdir}"/open-ecard/clients/richclient/build/distributions/richclient-*.tar -C "${pkgdir}"/usr/share/open-ecard
  ln -s /usr/share/open-ecard/bin/richclient "${pkgdir}"/usr/bin/open-ecard
}
