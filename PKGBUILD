# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname=timelineproject-hg
pkgver=1.18.0.r5776+
pkgrel=1
pkgdesc="Aims to create a free, cross-platform application for displaying and navigating events on a timeline."
arch=('any')
url="http://thetimelineproj.sourceforge.net/"
license=('GPL3')
depends=('python2-humblewx' 'wxpython')
makedepends=('mercurial' 'rsync')
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
source=("${pkgname%-hg}::hg+http://hg.code.sf.net/p/thetimelineproj/main"
        "timelineproject.desktop")
md5sums=('SKIP'
         'ffac86645fb812a7f0f6d4a110d907f2')

pkgver() {
  cd "$srcdir/${pkgname%-hg}/"
  printf "%s.r%s" "$(hg tags -q | sed -n '2p')" "$(hg identify -n)" 
}

prepare() {
   cd "$srcdir/${pkgname%-hg}/source"
   sed -i 's/#!\/usr\/bin\/env\ python/#!\/usr\/bin\/env\ python2/' timeline.py # fix arch python2 compatibility
}

package() {
   mkdir -p "${pkgdir}/opt/"
   rsync -a --exclude=".*" "$srcdir/${pkgname%-hg}/" "${pkgdir}/opt/${pkgname%-hg}/"
   #chmod -R 755 "${pkgdir}/opt/${pkgname%-hg}/"
   mkdir -p "${pkgdir}/usr/bin/"
   ln -s "/opt/${pkgname%-hg}/source/timeline.py" "${pkgdir}/usr/bin/${pkgname%-hg}"

   # icons
   mkdir -p "${pkgdir}/usr/share/icons/hicolor/16x16/apps/"
   mkdir -p "${pkgdir}/usr/share/icons/hicolor/32x32/apps/"
   mkdir -p "${pkgdir}/usr/share/icons/hicolor/48x48/apps/"
   cp "${pkgdir}/opt/${pkgname%-hg}/icons/48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/timelineproject.png"
   cp "${pkgdir}/opt/${pkgname%-hg}/icons/32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/timelineproject.png"
   cp "${pkgdir}/opt/${pkgname%-hg}/icons/16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/timelineproject.png"

   # .desktop entry
   mkdir -p "${pkgdir}/usr/share/applications/"
   cp "${srcdir}/timelineproject.desktop" "${pkgdir}/usr/share/applications/"
}
