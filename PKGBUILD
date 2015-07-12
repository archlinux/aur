# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=jackass
pkgname="${_pkgname}-git"
pkgver=1.0.r13.adcd7eb
_pkgver=1.0
pkgrel=2
pkgdesc="A VST plugin that provides JACK-MIDI support for VST hosts."
arch=('i686' 'x86_64')
url="https://github.com/falkTX/JackAss/"
license=('MIT')
depends=('gcc-libs-multilib' 'wine')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/falkTX/JackAss.git"
        'http://www.steinberg.net/sdk_downloads/vstsdk360_22_11_2013_build_100.zip')
sha256sums=('SKIP'
            '74e41da563a1c91e86677530936cb46a15f1af76b29d4c1877134cf29eafb718')
changelog=ChangeLog


pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo ${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"

  make CXXFLAGS="-I ${srcdir}/VST3\\ SDK" linux wine32 wine64
}

package() {
  cd "${srcdir}/${_pkgname}"

  for plugin in JackAss.so JackAssFx.so; do
    install -Dm644 $plugin "${pkgdir}/usr/lib/vst/$plugin"
  done

  for plugin in JackAssWine32.dll JackAssWine64.dll JackAssFxWine32.dll \
                JackAssFxWine64.dll; do
    install -Dm755 $plugin "${pkgdir}/usr/lib/jackass/$plugin"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
