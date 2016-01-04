# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=p7zip-gui
_srcname=p7zip
pkgver=9.38.1
pkgrel=3
pkgdesc='Graphic user interface (alpha quality) for the 7zip file archiver'
url='http://p7zip.sourceforge.net/'
license=('GPL' 'custom')
arch=('i686' 'x86_64')
depends=('p7zip' 'gcc-libs' 'wxgtk')
optdepends=('desktop-file-utils: desktop entries')
makedepends=('webkitgtk2')
makedepends_i686=('nasm')
makedepends_x86_64=('yasm')
options=(!makeflags)
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/${_srcname}/${_srcname}/${pkgver}/${_srcname}_${pkgver}_src_all.tar.bz2"
        '7zFM.desktop')
sha256sums=('fd5019109c9a1bf34ad3257d37a6853eae8151ff50345f0a3ffba7d8c5fdb995'
            '8cb662ccbacd1badc2c41ff00618c53d1c7fb8bca5472cca4ac7bd7f619acb27')

prepare() {
  cd "${srcdir}/${_srcname}_${pkgver}"

  if [[ $CARCH = x86_64 ]]; then
	cp makefile.linux_amd64_asm makefile.machine
  else
	cp makefile.linux_x86_asm_gcc_4.X makefile.machine
  fi

  sed -i 's/x86_64-linux-gnu//g' CPP/7zip/*/*/*.depend

  rm GUI/kde4/p7zip_compress.desktop # FS#43766
}

build() {
  cd "${srcdir}/${_srcname}_${pkgver}"
  make 7zFM 7zG OPTFLAGS="${CFLAGS}"
}

package() {
  cd "${srcdir}/${_srcname}_${pkgver}"
  make install \
	DEST_DIR="${pkgdir}" \
	DEST_HOME="/usr" \
	DEST_MAN="/usr/share/man"

  # remove files provided by p7zip package
  rm -fR "${pkgdir}/usr/lib/p7zip/"{7z.so,Codecs}
  rm -R "${pkgdir}/usr/share/"{doc,man}

  install -Dm644 GUI/p7zip_32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/p7zip.png"
  install -d "${pkgdir}/usr/share/"{applications,kde4/services/ServiceMenus}
  cp GUI/kde4/* "${pkgdir}/usr/share/kde4/services/ServiceMenus"
  install -d "${pkgdir}/usr/share/kservices5/ServiceMenus"
  cp GUI/kde4/* "${pkgdir}/usr/share/kservices5/ServiceMenus"
  cp ../7zFM.desktop "${pkgdir}/usr/share/applications"
  ln -s 7zCon.sfx "${pkgdir}/usr/lib/p7zip/7z.sfx"
  install -d "${pkgdir}/usr/share/doc/p7zip/DOC/MANUAL"
  cp -r GUI/help/fm "${pkgdir}/usr/share/doc/p7zip/DOC/MANUAL"

  chmod -R a+r,u+w,a+X "${pkgdir}/usr"
}
