# Maintainer:  Lamelos <lamelos plus aur at gmail dot com>

pkgname=electra-desktop-bin
_pkgname=electra-desktop
pkgver=1.0.8
pkgrel=3
pkgdesc='Cross-platform Desktop Wallet for Electra blockchain.'
arch=('x86_64')
url='https://electraproject.org/'
license=('MIT')
depends=('gconf' 'gtk2' 'libxtst' 'nss' 'libxss')
optdepends=('alsa-lib: sound support')
makedepends=('binutils' 'xz')
_srcfile="${_pkgname}_${pkgver}_amd64.deb"
noextract=("${_srcfile}")
source=("https://github.com/Electra-project/electra-desktop/releases/download/v${pkgver}/${_srcfile}"
        "point-desktop-file-to-correct-bin-location.patch")
sha256sums=('a93b484da725d5d828d1b3a1824b26637396313038b134b376c4b04d61acd06b'
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
