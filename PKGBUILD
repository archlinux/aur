# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

pkgname=electra-desktop-bin
_pkgname=electra-desktop
pkgver=1.3.0
pkgrel=1
pkgdesc='Cross-platform Desktop Wallet for Electra blockchain.'
arch=('x86_64')
url='https://electraproject.org/'
license=('MIT')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'libxss')
optdepends=('alsa-lib: sound support')
makedepends=('binutils' 'xz')
_srcfile="${_pkgname}_${pkgver}_amd64.deb"
noextract=("${_srcfile}")
install="electra-desktop-bin.install"
source=("https://github.com/Electra-project/electra-desktop/releases/download/${pkgver}/${_srcfile}"
        "Electra.conf"
        "point-desktop-file-to-correct-bin-location.patch")
sha256sums=('6f64690a83570875a91f000b79980bed6ffeb690528eb2df75a9f1fc117048d5'
            'ed9684c0610e93e4958541994cca12a98a0507896a11e17fbcd29cbe730d370e'
            '267c8aca4f0d3960dd12eb83ef919d339bfb093e77fbc37aa80fe6938ba1bd11')

prepare() {
  cd "$srcdir"
  ar p "${_srcfile}" data.tar.xz | tar Jx

  patch -Np1 -i "${srcdir}/point-desktop-file-to-correct-bin-location.patch"
}

package() {
  cd "$srcdir"

  # Copy deb contents to package
  mkdir "$pkgdir/opt"
  cp -R "opt/Electra Desktop/" "$pkgdir/opt/${_pkgname}"

  # Copy example config file to package
  cp Electra.conf "$pkgdir/opt/${_pkgname}/Electra.conf.example"
  
  # Copy icons
  mkdir -p "$pkgdir/usr/share/icons"
  cp -R "usr/share/icons/" "$pkgdir/usr/share/"

  # Install desktop
  mkdir -p "$pkgdir/usr/share/applications"
  install "usr/share/applications/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Copy doc
  mkdir -p "$pkgdir/usr/share/doc/${_pkgname}"
  install "usr/share/doc/${_pkgname}/changelog.gz" "$pkgdir/usr/share/doc/${_pkgname}/changelog.gz"

  # Create symlink to binary
  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/${_pkgname}/electra-desktop" "$pkgdir/usr/bin/electra-desktop"
}
