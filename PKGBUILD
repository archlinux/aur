# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pm D0T me>
# Contributor: Philipp Fent <fent@in.tum.de>
# Contributor: wzy <wuzy01@qq.com>
_base=textidote
pkgname=${_base}-bin
pkgver=0.8.3
pkgrel=3
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=(any)
url="https://github.com/sylvainhalle/${_base}"
license=(GPL)
provides=(${_base})
depends=('java-runtime-headless>=8')
optdepends=('libnotify: Error messages for textidote-desktop')

source=("${url}/releases/download/v${pkgver}/${_base}_${pkgver}_all.deb"
  "${_base}-desktop"
  "${_base}.desktop")
sha512sums=('ec3d3a320e95c1eaa9e56592489ca92df1bf9affa103e63f911951751649b598846416dc5318802d4234b3bd68b697a2050e6bbd788b558cdebfe3d7dc9d7928'
  '452ba2bbb0df0b86dbda764ffc227c7157b282ca54466364b1ed09dce286f935ad95604c53176ef850df6e3ea6457bbd2a5317e518eda53868af56ea40663e6a'
  '788809fee59c3cbfb3303a5d038b64ff532c7fba8c21f5ad98f01a9fc130f1739952e82104ecc2c5361cdb768d27ba68e9c935d0b712596192420f1807ebab1c')

prepare() {
  cd "${srcdir}"
  bsdtar xf data.tar.xz
  find -name "*~" -delete
  # Remove insecure RPATH
  # chrpath --delete "opt/estmob/sendanywhere/sendanywhere"
}

package() {
  # Create directories
  install -d "${pkgdir}"/{etc/bash_completion.d,usr/bin,usr/share/{java,${_base},man/man1,applications,zsh/site-functions}}

  install -Dm644 etc/bash.completion.d/${_base} "${pkgdir}"/etc/bash_completion.d/
  install -Dm755 usr/local/bin/${_base} "${pkgdir}"/usr/bin/
  install -D opt/${_base}/${_base}.jar "${pkgdir}"/usr/share/java/
  install -D opt/${_base}/${_base}-icon.svg "${pkgdir}"/usr/share/${_base}/
  install -Dm644 opt/$_base/${_base}.zsh "${pkgdir}"/usr/share/zsh/site-functions/_${_base}
  install -D usr/share/man/man1/${_base}.1 "${pkgdir}"/usr/share/man/man1/

  # Extra command to launch in browser
  install -Dm755 ${_base}-desktop "${pkgdir}"/usr/bin/

  # Add it to desktop
  install -Dm755 ${_base}.desktop "${pkgdir}"/usr/share/applications/
}
