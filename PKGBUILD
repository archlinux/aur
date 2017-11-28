# Maintainer: goodguy <lists.cinelerra-cv.org>
pkgname=cin
pkgver=5.1
pkgrel=20171030
pkgdesc="Cinelerra git://git.cinelerra-cv.org/goodguy/cinelerra.git ($pkgrel)"
arch=('x86_64')
url="http://www.cinelerra-cv.org"
license=('GPL')
depends=('xorg-server' 'libpng' 'libxv' 'libva'
         'libxft' 'freetype2' 'alsa-lib' 'inkscape' 'dvdauthor' 'opencv')
makedepends=('yasm' 'nasm' 'cmake'
	 'libxml2' 'perl-xml-libxml' 'perl-xml-parser'  'wget' 'curl')
conflicts=()
source=('https://cinelerra-cv.org/five/src/cin_5.1.20171030-src.tgz' 'unblock.patch' 'pics.tar.xz')
md5sums=('a77d69d6e1ddbf057079a6672b007fb9'
         '25541f98ed8565176ce466558c90b7eb'
         '7b4bd8da4dff4dc42f1a075cb21f870d')

prepare() {
  tar Jxvf pics.tar.xz
  cd "$srcdir/cinelerra-5.1/"
  patch -Np1 -i ${srcdir}/unblock.patch
  sed -i 's/\<python\>/python2.7/' ./guicast/Makefile
}

build() {
  cd "$srcdir/cinelerra-5.1/"

  ./autogen.sh
  export FFMPEG_EXTRA_CFG=" --disable-vdpau" 
  ./configure --prefix=/usr --with-exec-name=$pkgname --with-jobs=8 --with-opencv=no
CFG_VARS="\
CFLAGS+=' -Wno-narrowing -O2 -g -fno-omit-frame-pointer' \
CXXFLAGS+=' -Wno-narrowing -O2 -g -fno-omit-frame-pointer' \
WERROR_CFLAGS+=' -fpermissive'" \
  make -j8


}

package() {
  cd "$srcdir/cinelerra-5.1/"
  

  msg2 "packaging binary"

  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  mkdir "$pkgdir/usr/lib"
  mkdir "$pkgdir/usr/share"
  cp bin/cin "$pkgdir/usr/bin/cin"
  cp db/utils/new_db "$pkgdir/usr/bin/cin_db"
  cp libzmpeg3/x86_64/zmpeg3cat "$pkgdir/usr/bin/zmpeg3cat"
  cp libzmpeg3/x86_64/zmpeg3cc2txt "$pkgdir/usr/bin/zmpeg3cc2txt"
  cp libzmpeg3/x86_64/zmpeg3ifochk "$pkgdir/usr/bin/zmpeg3ifochk"
  cp libzmpeg3/x86_64/zmpeg3show "$pkgdir/usr/bin/zmpeg3show"
  cp libzmpeg3/x86_64/zmpeg3toc "$pkgdir/usr/bin/zmpeg3toc"
  
  msg2 "packaging libs"
  
  mkdir "$pkgdir/usr/lib/cin"
  cp cinelerra/x86_64/cutads "$pkgdir/usr/lib/cin/cutads"
  cp cinelerra/x86_64/bdwrite "$pkgdir/usr/lib/cin/bdwrite"
  cp mpeg2enc/x86_64/hveg2enc "$pkgdir/usr/lib/cin/hveg2enc"
  cp thirdparty/mjpegtools-2.1.0/mpeg2enc/mpeg2enc "$pkgdir/usr/lib/cin/mpeg2enc"
  cp thirdparty/mjpegtools-2.1.0/mplex/mplex "$pkgdir/usr/lib/cin/mplex"
  cp mplexlo/x86_64/mplexlo "$pkgdir/usr/lib/cin/mplexlo"

  msg2 "packaging plugins"
  cp -r bin/ladspa/ "$pkgdir/usr/lib/cin/ladspa/"
  cp -r bin/plugins/ "$pkgdir/usr/lib/cin/plugins/"
  
  msg2 "packaging modules"
  
  mkdir "$pkgdir/usr/share/cin"
  cp -r doc/ "$pkgdir/usr/share/cin/doc/"
  cp -r ffmpeg/ "$pkgdir/usr/share/cin/ffmpeg/"
  cp -r info/ "$pkgdir/usr/share/cin/models/"
  cp -r msg/ "$pkgdir/usr/share/cin/msg/"
  cp -r tips/ "$pkgdir/usr/share/cin/tips/"
    mkdir "$pkgdir/usr/share/applications"
  mkdir "$pkgdir/usr/share/pixmaps"
  cp ../../cin.desktop "$pkgdir/usr/share/applications/cin.desktop"
  cp ../../cin.svg "$pkgdir/usr/share/pixmaps/cin.svg"
  cp ../../cin.xpm "$pkgdir/usr/share/pixmaps/cin.xpm" 


  msg2 "preparing locales"

  mkdir "$pkgdir/usr/share/locale"

  mkdir "$pkgdir/usr/share/locale/de"
  mkdir "$pkgdir/usr/share/locale/de/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/el"
  mkdir "$pkgdir/usr/share/locale/el/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/es"
  mkdir "$pkgdir/usr/share/locale/es/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/eu"
  mkdir "$pkgdir/usr/share/locale/eu/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/fr"
  mkdir "$pkgdir/usr/share/locale/fr/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/hi"
  mkdir "$pkgdir/usr/share/locale/hi/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/it"
  mkdir "$pkgdir/usr/share/locale/it/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/ja"
  mkdir "$pkgdir/usr/share/locale/ja/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/ko"
  mkdir "$pkgdir/usr/share/locale/ko/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/nb"
  mkdir "$pkgdir/usr/share/locale/nb/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/pt"
  mkdir "$pkgdir/usr/share/locale/pt/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/ru"
  mkdir "$pkgdir/usr/share/locale/ru/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/sl"
  mkdir "$pkgdir/usr/share/locale/sl/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/uk/"
  mkdir "$pkgdir/usr/share/locale/uk/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/vi"
  mkdir "$pkgdir/usr/share/locale/vi/LC_MESSAGES"

  mkdir "$pkgdir/usr/share/locale/zh"
  mkdir "$pkgdir/usr/share/locale/zh/LC_MESSAGES"
  
  msg2 "copying translations"

  cp po/de.mo "$pkgdir/usr/share/locale/de/LC_MESSAGES/de.mo"
  cp po/el.mo "$pkgdir/usr/share/locale/el/LC_MESSAGES/el.mo"
  cp po/es.mo "$pkgdir/usr/share/locale/es/LC_MESSAGES/es.mo"
  cp po/eu.mo "$pkgdir/usr/share/locale/eu/LC_MESSAGES/eu.mo"
  cp po/fr.mo "$pkgdir/usr/share/locale/fr/LC_MESSAGES/fr.mo"
  cp po/hi.mo "$pkgdir/usr/share/locale/hi/LC_MESSAGES/hi.mo"
  cp po/it.mo "$pkgdir/usr/share/locale/it/LC_MESSAGES/it.mo"
  cp po/ja.mo "$pkgdir/usr/share/locale/ja/LC_MESSAGES/ja.mo"
  cp po/ko.mo "$pkgdir/usr/share/locale/ko/LC_MESSAGES/ko.mo"
  cp po/nb.mo "$pkgdir/usr/share/locale/nb/LC_MESSAGES/nb.mo"
  cp po/pt.mo "$pkgdir/usr/share/locale/pt/LC_MESSAGES/pt.mo"
  cp po/ru.mo "$pkgdir/usr/share/locale/ru/LC_MESSAGES/ru.mo"
  cp po/sl.mo "$pkgdir/usr/share/locale/sl/LC_MESSAGES/sl.mo"
  cp po/uk.mo "$pkgdir/usr/share/locale/uk/LC_MESSAGES/uk.mo"
  cp po/vi.mo "$pkgdir/usr/share/locale/vi/LC_MESSAGES/vi.mo"
  cp po/zh.mo "$pkgdir/usr/share/locale/zh/LC_MESSAGES/zh.mo"

}
