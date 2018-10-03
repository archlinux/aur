# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.8.4
pkgrel=3
_jnaver=4.5.2
_fixedcommit=b9572f4501ba9d5af9d445a792fa902274f37679
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('i686' 'x86_64' 'aarch64' 'armv7l' 'armv7h')
url="https://github.com/filebot/filebot"
license=('GPL')
install=$pkgname.install
depends=('java-runtime>=8' 'fontconfig' 'chromaprint')
makedepends=('ant' 'ivy' 'jdk>=8')

[[ $CARCH == "i686" ]]   && _intarch=i686
[[ $CARCH == "x86_64" ]] && _intarch=amd64
[[ $CARCH == "armv7l" ]] && _intarch=armv7l
[[ $CARCH == "armv7h" ]] && _intarch=armv7l
[[ $CARCH == "aarch64" ]] && _intarch=armv8

source=("${pkgname}::git+https://github.com/filebot/filebot.git"
        #https://github.com/java-native-access/jna/archive/$_jnaver.tar.gz
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)

md5sums=('SKIP'
         'abed3a5dab3032fcde08addbee04fb1b'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')

optdepends=('libzen: Support for additional subtitle search engines (Sublight)'
	    'libmediainfo: Episode naming / Sublight usage'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: gvfs backends')

#noextract=($(for i in ${source[@]}; do basename $i; done))

prepare() {
  cd "$srcdir/$pkgname/"
  git checkout $_fixedcommit

  patch -p1 -i jdk8.patch

  sed -i -E 's/-portable.tar.xz/-portable.tar.gz/' build.xml
  sed -i -E 's/tar.compression: xz/tar.compression: gzip/' app.properties

cat <<EOT >> app.properties
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

build() {
  cd $pkgname
  ant resolve
  ant jar
}

package() {
  install -Dm644 $pkgname/lib/native/linux-$_intarch/libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  cp -dpr --no-preserve=ownership $pkgname/dist/lib/* "$pkgdir/usr/share/java/$pkgname/"

  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
