# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl> 
# Contributor: sausageandeggs <s_stoakley at hotmail.co.uk>

pkgname=singularity-git
_pkgname=singularity
pkgver=r1050.cc9f6ac
pkgrel=3
pkgdesc="Strategy game - simulation of true AI, git version"
arch=('any')
url="http://emhsoft.com/singularity/index.html"
license=('GPL2' 'custom')
depends=('python2' 'python2-pygame' 'sdl_image' 'sdl_mixer' 'python2-numpy')
makedepends=('git')
source=("git+https://github.com/singularity/singularity"
        "http://www.emhsoft.com/singularity/endgame-singularity-music-007.zip"
        "singularity-git"
        "singularity-git.desktop")
md5sums=('SKIP'
         '36ab600d1f6df24e3550b37289cc7710'
         '1ebf352cb93b5368599ab6c631bf1e79'
         '1a126f469ea03816a3279ad8b68d558d')
         
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


         
prepare() {
  cd "${_pkgname}"
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|g' "code/singularity.py"
}

package() {
  cd "${_pkgname}"

  # install game
  install -Dm644 singularity.py ${pkgdir}/usr/share/${pkgname}/singularity.py
  cp -R code data "${pkgdir}/usr/share/${pkgname}/"
  cp -R "${srcdir}/endgame-${_pkgname}-music-007" "${pkgdir}/usr/share/${pkgname}/music"

  # install shell script
  install -Dm755 "${srcdir}/singularity-git" "${pkgdir}/usr/bin/singularity-git"

  # desktop file
  install -Dm644 "${srcdir}/singularity-git.desktop" "${pkgdir}/usr/share/applications/singularity-git.desktop"

  # license: code is GPL2, but data & music fall under other licenses
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "${pkgdir}/usr/share/doc/${pkgname}/README.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README.txt"

  python2 -m compileall "${pkgdir}/usr/share/${pkgname}"
  python2 -O -m compileall "${pkgdir}/usr/share/${pkgname}"
}
# vim: sw=2:ts=2 et:
