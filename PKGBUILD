# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Maintainer: Larry Hajali <larryhaja[at]gmail[dot]com>

pkgname=xvst
_pkgname=xVideoServiceThief
pkgver=2.5.1
pkgrel=1
pkgdesc='GUI tool for downloading videos from sites like YouTube, GoogleVideo etc.'
url='http://xviservicethief.sourceforge.net'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('ffmpeg' 'qt5-webkit' 'qt5-script')
makedepends=('sed' 'qt5-tools')
optdepends=('flvstreamer: for downloading flv files.')
install=xvst.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/xVST/xVideoServiceThief/archive/${pkgver}.tar.gz"
	'xvst.desktop'
        'beeg.patch'
        'chilloutzone.patch'
        'disable_update.patch'
        'keezmovies.patch'
        'myvideo.patch'
        'sunporno.patch'
        'wat.tv.patch')
md5sums=('917d32b75585eec0e0ff5245253f33ed'
         '9d4d4d4841b497fe64705d36e7955174'
         '417c1a8cec359835e25ba8ed89cb86c6'
         'd9bf2659bba5c99f885e9febdb3d4d2e'
         '5be6ae62f4f3976e112df3b5d03e11c9'
         '8f32559bd10b8eddddb11a827e847b37'
         '4bbe5133ca5b71ae19039c28cfbaad2d'
         'e353efa41a386887cf3f76c0bf9350af'
         '29adc4b5a9326202478dd41fc3d3c199')

build()
{
  cd ${_pkgname}-${pkgver}

  # Patches provided by getdeb.net. Add/fix download sites and turns off
  # automatic updates.
  for i in "${srcdir}"/*.patch; do
    patch -p1 < "$i"
  done

  # Fix path names and end-of-line encoding.
  sed -i "s|getApplicationPath()\ +\ \"|\"/usr/share/${pkgname}|g" src/options.cpp
  sed -i 's/\r//' "how to compile.txt"

  # Creat translation files.
  lrelease-qt5 resources/translations/*.ts
  rm -f resources/translations/template_for_new_translations.qm

  qmake-qt5 -set build_mode dynamic_build
  qmake-qt5 PREFIX=/usr QMAKE_CFLAGS+="${CFLAGS}" QMAKE_CXXFLAGS+="${CXXFLAGS}" \
    CONFIG+=release -o Makefile xVideoServiceThief.pro
  make
}

package()
{
  cd ${_pkgname}-${pkgver}

  install -d -m 0755 "$pkgdir"/usr/share/$pkgname/{plugins,languages}
  find resources/services -name "*.js" \
    -exec cp -dpR {} "$pkgdir"/usr/share/$pkgname/plugins \;
  install -m 0644 resources/translations/*.qm \
    "$pkgdir"/usr/share/$pkgname/languages
  install -m 0644 resources/translations/definitions/*.language \
    "$pkgdir"/usr/share/$pkgname/languages
  find "$pkgdir"/usr/share/$pkgname/ -type f -exec chmod 0644 '{}' \;
  install -Dm755 bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm644 "$srcdir"/xvst.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 resources/images/InformationLogo.png \
    "$pkgdir"/usr/share/pixmaps/$pkgname.png

  install -d -m 0755 "$pkgdir"/usr/share/doc/$pkgname
  cp -a "how to compile.txt" README.md resources/{changelog.txt,service_list.html} \
    "$pkgdir"/usr/share/doc/$pkgname
}

