# Maintainer: Roman Vasilev <2rvasilev@live.ru>
# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot-git
_pkgname=filebot
pkgver=4.8.5.20181206
_pkgver=4.8.5
pkgrel=1
pkgdesc="The ultimate TV and Movie Renamer"
_jnaver=4.5.2
_fixedcommit=2fc9bd0644dd5ae5c6a09f701ab7ae7dfab9a64d
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
license=('Commercial')
url="https://github.com/filebot/filebot"
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
        $_pkgname-arch.sh
        #$_pkgname.svg
        filebot.desktop
        filebot-license.desktop
        )

md5sums=('SKIP'
         'a1f708b2a17a1a548f910ea0c53a9f54'
         '8cea85b074146c6057913488a1247fd8'
         'b49cf931217ed3cfbc8be1cf3133d7e0')

optdepends=('libzen: Required by libmediainfo'
	    'libmediainfo: Read media info such as video codec, resolution or duration'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: Drag-n-Drop from GVFS remote filesystems')

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
  mkdir -p $pkgdir/usr/share/{java/$_pkgname,applications,icons}

  install -Dm644 $_pkgname/lib/native/linux-$_intarch/libjnidispatch.so "$pkgdir/usr/share/java/$_pkgname/libjnidispatch.so"
  cp -dpr --no-preserve=ownership $_pkgname/dist/lib/* "$pkgdir/usr/share/java/$_pkgname/"

  install -Dm755 $_pkgname-arch.sh "$pkgdir/usr/bin/$_pkgname"

  # copy .desktop files
  cp -dpr --no-preserve=ownership *.desktop "$pkgdir/usr/share/applications/"

  # install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  
  cd "$srcdir/$_pkgname/"

  # copy MIME types
  cp -dpr --no-preserve=ownership installer/deb/share/mime "$pkgdir/usr/share/mime"
  sed -i "s/@{license.mimetype}/application\/x-filebot-license/g; s/@{license.description}/FileBot License File/g; s/@{package.name}/$_pkgname/g; s/@{license.extension}/psm/g" $pkgdir/usr/share/mime/packages/$_pkgname.xml

  # copy Icons
  # install -Dm644 $_pkgname.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"
  install -Dm644 installer/icons/$_pkgname.svg "$pkgdir/usr/share/icons/$_pkgname.svg"

  # sudo archlinux-java set $_jre
}
