# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot-git
_pkgname=filebot
pkgver=4.8.5.20181128
_pkgver=4.8.5
pkgrel=1
_jnaver=4.5.2

_fixedcommit=ca1b8c04400fc0e83cd04ad4c5d13361dbd855ea

pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://github.com/filebot/filebot"
license=('GPL')
install=$_pkgname.install
depends=('java-openjfx' 'jre8-openjdk' 'fontconfig' 'chromaprint')
makedepends=('ant' 'ivy' 'jdk8-openjdk')
provides=('filebot')
conflicts=('filebot47' 'filebot')

[[ $CARCH == "i686" ]]   && _intarch=i686
[[ $CARCH == "x86_64" ]] && _intarch=amd64
[[ $CARCH == "armv7l" ]] && _intarch=armv7l
[[ $CARCH == "armv7h" ]] && _intarch=armv7l
[[ $CARCH == "aarch64" ]] && _intarch=armv8

_jre=$(archlinux-java get)

source=("${_pkgname}::git+https://github.com/filebot/filebot.git"
        #https://github.com/java-native-access/jna/archive/$_jnaver.tar.gz
        $_pkgname-arch.sh $_pkgname.svg $_pkgname.desktop)

md5sums=('SKIP'
         'a4cc7024a9c593abeb22a2511c96aef1'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')

optdepends=('libzen: Support for additional subtitle search engines (Sublight)'
	    'libmediainfo: Episode naming / Sublight usage'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: gvfs backends')

#noextract=($(for i in ${source[@]}; do basename $i; done))



prepare() {
  cd "$srcdir/$_pkgname/"
  git checkout $_fixedcommit

  patch -p1 -i jdk8.patch

  sed -i -E 's/-portable.tar.xz/-portable.tar.gz/' build.xml
  sed -i -E 's/tar.compression: xz/tar.compression: gzip/' app.properties

cat <<EOT >> app.properties

# Api Keys
url.data: https://app.filebot.net/data

apikey.fanart.tv: 780b986b22c35e6f7a134a2f392c2deb
apikey.thetvdb: 694FAD89942D3827
apikey.themoviedb: 66308fb6e3fd850dde4c7d21df2e8306
apikey.omdb: 49d311ec
apikey.acoustid: 0B3qZnQc
apikey.anidb: filebot
apikey.opensubtitles: FileBot
EOT
}

pkgver(){
  cd "$srcdir/$_pkgname/"

#  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git log --date=format:%Y%m%d --pretty=%ad -1 HEAD)"
printf "$_pkgver.%s" "$(git log --date=format:%Y%m%d --pretty=%ad -1 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/"
  echo "Set system jdk from $_jre to java-8-openjdk. This will be reverted after build"
  sudo archlinux-java set java-8-openjdk
  ant resolve
  ant jar
  echo "Reverting system jdk back to $_jre"
  sudo archlinux-java set $_jre
}

package() {
  install -Dm644 $_pkgname/lib/native/linux-$_intarch/libjnidispatch.so "$pkgdir/usr/share/java/$_pkgname/libjnidispatch.so"
  cp -dpr --no-preserve=ownership $_pkgname/dist/lib/* "$pkgdir/usr/share/java/$_pkgname/"

  install -Dm755 $_pkgname-arch.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  
  sudo archlinux-java set $_jre
}
