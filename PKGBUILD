# Maintainer: Robin <rbn dot 86 et bigbrothergoogle>
# Contributor: Marcus Behrendt <marcus dot behrendt dot 86 et bigbrothergoogle>
# Contributor: Philipp A. <flying-sheep@github.com>

_basename=panon
pkgname=plasma5-applets-${_basename}-git
pkgver=0.1.0
pkgrel=2
pkgdesc="A Different Audio Spectrum Analyzer for KDE Plasma"
arch=('any')
url="http://github.com/rbn42/panon"
license=('GPL3')
depends=('plasma-workspace' 'python-docopt' 'python-numpy' 'python-pillow' 'python-pyaudio' 'python-cffi' 'python-websockets' 'qt5-websockets') 
makedepends=('git')
provides=('plasma5-applets-panon-git')
conflicts=('plasma5-applets-panon-git' 'plasma5-applets-panon')
source=("git+https://github.com/rbn42/panon.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${_basename}"

  # Download SoundCard and hsluv-glsl
  git submodule update --init

  # Remove shader examples
  rm ./kde/plasmoid/contents/shaders/example-*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/LICENSE"
  install -Dm644 third_party/hsluv-glsl/LICENCE.md "$pkgdir/usr/share/licenses/${_basename%-*}/hsluv-glsl/LICENCE.md"
  install -Dm644 third_party/SoundCard/LICENSE "$pkgdir/usr/share/licenses/${_basename%-*}/SoundCard/LICENSE"

  cd kde
  kpackagetool5 -p "$pkgdir/usr/share/plasma/plasmoids/" -t Plasma/Applet -i plasmoid

  # If an index is generated, remove it.
  path_index="$pkgdir/usr/share/plasma/plasmoids/kpluginindex.json"
  if [ -e "$path_index" ];then
    rm "$path_index"
  fi
}
