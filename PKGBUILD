# Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=gkrellm-themes
pkgver=20030109
pkgrel=1
arch=('any')
url="http://www.muhri.net/gkrellm/"
license=('GPL')
pkgdesc="Themes from muhri.net for GKrellM"
depends=('gkrellm')
source=('http://www.muhri.net/gkrellm/GKrellM-Skins.tar.gz')
sha256sums=('a0d2d00410cc2290df6c89cba9a204a0592e8c18ba9e13e967dbf021937d30d1')

# No binaries - speed up the package build (except emptydirs - needed)
options=('!emptydirs' '!strip' 'libtool' 'staticlibs' '!zipman')

prepare() {
  cd "${srcdir}/GKrellM-skins"
  # Deduped tarballs
  rm -f aliens.tgz cyrus.gkrellm.tar.gz glass.gkrellm.tar.gz IReX.tar.gz
  # Corrupted tarballs
  rm -f Crux_chaos.tar.gz egan-gkrellm.tar.gz
}

package(){
  # Unpack the tarballs, omitting trash
  cd "${srcdir}/GKrellM-skins"
  install -dm 755 "${pkgdir}/usr/share/gkrellm2/themes"
  for file in *gz ; do
    tar zxC "${pkgdir}/usr/share/gkrellm2/themes" -f $file \
      --exclude CVS \
      --exclude "*~" \
      --exclude "*.swp" \
      --exclude .xvpics \
      --no-same-owner \
      --no-same-permissions
  done

  # Several directories in the tarballs are 777 and files 755, some SGID.
  # The tar extract options should have fixed this, let's be 100% sure.
  cd "${pkgdir}/usr/share/gkrellm2/themes"
  find . -type d -print0 | xargs -0 chmod 0755
  find . -type f -print0 | xargs -0 chmod 0644

  # Random fixes
  cd "${pkgdir}/usr/share/gkrellm2/themes/twilite"
  rm -f './.png' && ln -s 'green/frame_right.png' './.png'
}

