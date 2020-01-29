# based on https://github.com/rbn42/panon/blob/master/PKGBUILD
# Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Contributor: Robin <rbn dot 86 et bigbrothergoogle>
# Contributor: Philipp A. <flying-sheep@github.com>

_basename=panon
pkgname=plasma5-applets-${_basename}
pkgver=0.4.0
pkgrel=1
pkgdesc="A Different Audio Spectrum Analyzer for KDE Plasma"
arch=('any')
url="http://github.com/rbn42/panon"
license=('GPL3' 'DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE Version 2')
depends=('plasma-workspace'
         'python-docopt'
         'python-numpy'
         'python-pillow'
         'python-pyaudio'
         'python-websockets'
         'qt5-websockets'
         'qt5-3d'
         'python-soundcard') 
makedepends=('kpackage')
provides=('plasma5-applets-panon')
conflicts=('plasma5-applets-panon')
source=("${_basename}-${pkgver}::https://github.com/rbn42/${_basename}/archive/v${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/williammalo/hsluv-glsl/master/hsluv-glsl.fsh"
        hsluv-glsl_LICENSE.md::"https://raw.githubusercontent.com/williammalo/hsluv-glsl/master/LICENCE.md")
md5sums=('95ec973fe10a012cd3b64c89df56016c'
         '9756b7835dbccd4607d7818df2a43858'
         '4163e80ffc8ff3c289dec4fed9e55692')

prepare() {
  cd "${srcdir}/${_basename}-${pkgver}"

  install -Dm644 "${srcdir}/hsluv-glsl.fsh" third_party/hsluv-glsl
  install -Dm644 "${srcdir}/hsluv-glsl_LICENSE.md" third_party/hsluv-glsl/LICENCE.md
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"
    
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"
  install -Dm644 third_party/hsluv-glsl/LICENCE.md "$pkgdir/usr/share/licenses/${_basename%-*}/hsluv-glsl/LICENCE.md"
  
  rm -rf build || true
  mkdir -p build
  cd build
  cmake ../kde \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib
  make install DESTDIR="$pkgdir" 
  
  cd ../kde
  rm -rf "$pkgdir/usr/share/plasma/plasmoids/" || true
  kpackagetool5 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid
  
  # If an index is generated, remove it.
  path_index="$pkgdir/usr/share/plasma/plasmoids/kpluginindex.json"
  if [ -e "$path_index" ];then
    rm "$path_index"
  fi
}

