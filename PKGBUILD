# Maintainer: max.bra <max dot bra at alice dot it>
# Contributor: nadolph
# Contributor: dcelasun
# Contributor: said
# Contributor: Kaurin <milos dot kaurin at gmail>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=filebot
pkgver=4.8.0
pkgrel=3
_jnaver=4.5.1
pkgdesc="The ultimate tool to rename TV/anime shows, download subtitles, and validate checksums."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/filebot/filebot"
license=('GPL')
install=$pkgname.install
depends=('java-runtime>=9' 'fontconfig' 'chromaprint')
makedepends=('unzip' 'apache-ivy' 'jdk>=9')

[[ $CARCH == "i686" ]]   && _intarch=x86
[[ $CARCH == "x86_64" ]] && _intarch=x86-64
[[ $CARCH == "arm" ]]    && _intarch=arm
[[ $CARCH == "armv6h" ]] && _intarch=arm
[[ $CARCH == "armv7h" ]] && _intarch=arm

source=("${pkgname}::git+https://github.com/filebot/filebot.git"
        https://github.com/java-native-access/jna/archive/$_jnaver.tar.gz
        $pkgname-arch.sh $pkgname.svg $pkgname.desktop)

md5sums=('SKIP'
         '3cf5c206ba2246386af2e9248fa6f035'
         '38c3f0029e094043cfca147981d41081'
         '04f46be047049448dba3f0de29fe192d'
         'f37edd0bba7570904d28ab1681c7a7f3')

optdepends=('libzen: Support for additional subtitle search engines (Sublight)'
	    'libmediainfo: Episode naming / Sublight usage'
	    'java-p7zip-binding: Extract archives'
	    'gvfs: gvfs backends')

#noextract=($(for i in ${source[@]}; do basename $i; done))

prepare() {
  cd "$srcdir/$pkgname/"
  sed -i -E 's/release="([^"]*)"/target="\1" source="\1"/' build.xml
  sed -i -E 's/jre.version: 10/jre.version: 9/' app.properties
  sed -i -E 's/jvm.version: 10/jvm.version: 9/' app.properties
cat <<EOT >> app.properties
url.data: https://app.filebot.net/data
apikey.fanart.tv: BA864DEE427E384A
apikey.thetvdb: BA864DEE427E384A
apikey.themoviedb: 66308fb6e3fd850dde4c7d21df2e8306
apikey.omdb: 49d311ec
apikey.acoustid: 0B3qZnQc
apikey.anidb: filebot
EOT
  cd "$srcdir/jna-$_jnaver/lib/native/"
  unzip linux-$_intarch.jar 2>&1 >/dev/null
}

build() {
  cd $pkgname
  ant resolve
  ant fatjar
}

package() {
  install -Dm644 $pkgname/dist/FileBot_$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 jna-$_jnaver/lib/native/libjnidispatch.so "$pkgdir/usr/share/java/$pkgname/libjnidispatch.so"
  install -Dm755 $pkgname-arch.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
