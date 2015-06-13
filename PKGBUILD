# Maintainer: Muflone <muflone@vbsimple.net>
# Contributor: Jordi De Groof <jordi(dot)degroof(at)gmail(dot)com>

pkgname=easymp3gain-gtk2
pkgver=0.5.0
pkgrel=8
pkgdesc="GTK2 Graphical User Interface (GUI) for MP3Gain, VorbisGain and AACGain"
arch=('i686' 'x86_64')
url="http://easymp3gain.sourceforge.net/"
license=('GPL')
depends=('gtk2')
makedepends=('lazarus')
optdepends=('mp3gain: for MP3 support'
            'vorbisgain: for OGG support'
            'aacgain: for AAC suport')
conflicts=('easymp3gain-gtk2-bin' 'easymp3gain-qt4' 'easymp3gain-qt4-bin')
install='easymp3gain.install'
source=("http://downloads.sourceforge.net/project/easymp3gain/easymp3gain%20source/easymp3gain-${pkgver}/easymp3gain-${pkgver}.src.tar.gz"
        "bug_3556716.patch"
        "fix_missing_overload_on_AddTask.diff"
        "fix_missing_LazarusDir.diff"
        "environmentoptions.xml"
       )
md5sums=('b89c3a49ac571eed19b0985990749419'
         '1611000e9b03b0539619c28dab30bde2'
         '518ae86ddd399d1c81e720fa94821a76'
         '36e61f07c3319c343d26519f2be4e5d4'
         'c44d393470cabf301543332fce365348'
        )

build() {
  cd "${srcdir}/easymp3gain-${pkgver}"
  # Fixes SF bug #3556716 https://sourceforge.net/tracker/index.php?func=detail&aid=3556716&group_id=207001&atid=999854
  # See also http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=623032
  patch -p1 -i "$srcdir/bug_3556716.patch"
  # Fixes unitmain.pas(471,26) Error: function header doesn't match the previous declaration "TfrmMp3GainMain.AddTask(TSongItem,TMediaGainAction,Double):LongInt;"
  patch -p1 -i "$srcdir/fix_missing_overload_on_AddTask.diff"
  # Fixes missing .lazarus directory when lazarus wasn't properly configured with environment variables
  # Here we create an alternate primary path for lazbuild
  mkdir "lazarus-build"
  cp "${srcdir}/environmentoptions.xml" lazarus-build/
  patch -p1 -i "$srcdir/fix_missing_LazarusDir.diff"
  # Let's build
  ./make.sh
}

package() {
  cd "${srcdir}/easymp3gain-${pkgver}"
  DESTDIR=${pkgdir} ./install.sh
}
