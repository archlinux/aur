# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pm D0T me>
# Contributor: Philipp Fent <fent@in.tum.de>
# Contributor: wzy <wuzy01@qq.com>
_base=textidote
pkgname=${_base}-bin
pkgver=0.8.3
pkgrel=5
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=(any)
url="https://github.com/sylvainhalle/${_base}"
license=(GPL)
provides=(${_base})
depends=('java-runtime-headless>=8')
optdepends=('libnotify: Error messages for textidote-desktop'
  'man-db: manual pages for textidote'
  'bash-completion: for completion when using bash'
  'zsh-completions: for completion when using zsh')
source=("${url}/releases/download/v${pkgver}/${_base}_${pkgver}_all.deb"
  "${_base}-desktop"
  "${_base}.desktop")
sha512sums=('ec3d3a320e95c1eaa9e56592489ca92df1bf9affa103e63f911951751649b598846416dc5318802d4234b3bd68b697a2050e6bbd788b558cdebfe3d7dc9d7928'
  'bb7ddeb219b4d77f9e57b71afe6323ffa2aac39742c8c0162574cbd9360d2c00890444bac5504771cfe806a0a401b76e98bca8178da3f34f2d6b1bde299c6f52'
  '3f8a415e1428009cb701325b27880b6e4828a12634465969e4a8c1e53f2c6bfd26695160f85115cf1522fd6f7799128085384847d988e0fa03a7be8b63304540')

prepare() {
  cd "${srcdir}"
  bsdtar xf data.tar.xz
  find -name "*~" -delete
  sed -i 's/\/opt\/textidote\/textidote.jar/\/usr\/share\/java\/textidote.jar/' usr/local/bin/${_base}
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
