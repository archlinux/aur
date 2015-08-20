# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=gutenmark
pkgver=20090510
pkgrel=1
pkgdesc="Attractively formatting Project Gutenberg texts into HTML or LaTeX"
arch=('i686' 'x86_64')
url="http://www.sandroid.org/GutenMark/"
license=('GPL')
depends=('gcc-libs')
optdepends=('wxgtk: GUItenMark')
makedepends=('wxgtk')
source=("http://www.sandroid.org/GutenMark/wasftp.GutenMark/SoftwareSnapshots/GutenMark_source_dev-$pkgver.tar.gz"
        "GutenMark.cfg"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/special.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/english.names.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/US.places.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/french.names.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/english.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/french.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/german2.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/german.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/latin.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/italian.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/spanish.words.gz"
        "http://www.sandroid.org/GutenMark/wasftp.GutenMark/Wordlists/NonUS.places.gz")
md5sums=('d90f4d85ed02ef07303144c37d4b9415'
         '3126824b8fae69bab98672f87c480165'
         'e1a7c4c58c5c3682634c141d567b35c1'
         '087d3a43a86094b9e7e193a4b20f299b'
         'cc4e2c5b495b199ef270f15443fba366'
         '0af566d81d4479ef04419d6b5ded0ad6'
         '29deac9f1f6bd542c3578baf042b6c00'
         '32ffb05dc7788523b039d6c5f98220c5'
         '15ab403c7dc00757931c1ae207e00003'
         'f8c295932a9d4211165b2e470b88b815'
         'a093e1e06da3b68af29b47f015c3a4dd'
         'd8a34f0393669ea801a6eee79384b0f9'
         '461ea537c5f56aa30e926fcafb10ab35'
         '4c31a93d7206c794e4b5b6a5f771fcfd')

build() {
  rm *.{words,places,names}
  cd "GutenMark-source"
  sed -i 's|./GutenMark.cfg|/etc/GutenMark.cfg|' libGutenSpell/MatchWordlists.c
  # bad hack
  sed -i 's|ExecutableFilename, AltCfg|"/usr/share/gutenmark/GutenMark", AltCfg|' AutoMark.c
  # disable tests
  sed -i 's|\(^.*bldhb10.html.*\)|#\1|' Makefile
  make
}

package() {
  for i in $(find -name '*.gz' -and ! -name '*.tar.gz'); do
    install -Dm644 $i "$pkgdir/usr/share/$pkgname/$(basename $i)"
  done
  cd "GutenMark-source"
  # missing 'make install'
  for _bin in $(find ./ -type f -executable); do
    if [[ "$_bin" == "./BuildBox.sh" ]]; then
      continue
    fi
    _base=${_bin##*/}
    install -Dm755 "$_bin" "$pkgdir/usr/bin/$_base"
  done

  install -Dm644 "$srcdir/GutenMark.cfg" "$pkgdir/etc/GutenMark.cfg"
}

