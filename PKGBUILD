# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
# Maintainer: Matt Bilker <me@mbilker.us>

_pkgname='N1'
pkgname='n1-git'
pkgver=0.4.32.r987.gf35008d
pkgrel=1
pkgdesc="A new mail client, built on the modern web and designed to be extended."
arch=('any')
url="https://github.com/nylas/N1"
license=('GPL3')
depends=('alsa-lib' 'desktop-file-utils' 'gtk2' 'gconf' 'nodejs' 'libgnome-keyring' 'libnotify' 'libxtst' 'nss' 'python2')
makedepends=('git' 'npm')
provides=('n1')
conflicts=('n1')
source=('git+https://github.com/nylas/N1.git')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  sed -e "s/<%= description %>/$pkgdesc/" \
    -e "s|<%= installDir %>|/usr|"\
    -e "s|<%= iconName %>|nylas|"\
    -e "s|<%= linuxShareDir %>|/usr/share/nylas|"\
    -e "s|<%= appFileName %>|nylas|"\
    build/resources/linux/nylas.desktop.in > build/resources/linux/Nylas.desktop

  export PYTHON=python2
  script/bootstrap
  script/grunt build --build-dir "${srcdir}/nylas-build"
}

package() {
  cd "${_pkgname}"

  script/grunt install --build-dir "${srcdir}/nylas-build" --install-dir "${pkgdir}/usr"

  for s in 16 32 64 128 256 512; do
    mkdir -p "${pkgdir}"/usr/local/share/icons/hicolor/"${s}"x"${s}"/apps
    cp -p "${srcdir}"/nylas-build/icons/"${s}".png \
               "${pkgdir}"/usr/local/share/icons/hicolor/"${s}"x"${s}"/apps/nylas.png
  done

  install -Dm644 build/resources/linux/Nylas.desktop "${pkgdir}/usr/share/applications/nylas.desktop"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
