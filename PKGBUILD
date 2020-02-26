# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>

_name=Rack
pkgname=vcvrack
pkgver=1.1.6
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url="https://vcvrack.com/"
license=('custom' 'CCPL' 'GPL3')
arch=('x86_64')
# TODO: devendor fonts
depends=('curl' 'glew' 'glfw' 'gtk2' 'jack' 'jansson' 'libpulse' 'libx11'
'libzip' 'openssl' 'rtaudio' 'rtmidi' 'speexdsp')
makedepends=('cmake' 'gendesk' 'git' 'unzip' 'wget')
source=("${pkgname}-${pkgver}::git+https://github.com/${pkgname}/${_name}.git#tag=v$pkgver"
        'git+https://github.com/glfw/glfw.git#commit=0fb001c'
        'git+https://github.com/memononen/nanosvg.git#commit=25241c5'
        'git+https://github.com/memononen/nanovg.git#commit=1f9c886'
        'git+https://github.com/AndrewBelt/osdialog.git#commit=e5db5de'
        'git+https://github.com/AndrewBelt/oui-blendish.git#commit=79ec59e'
        'git+https://github.com/thestk/rtaudio.git#commit=d27f257'
        "${pkgname}-use_system_libs.patch::https://github.com/flying-sheep/Rack/commit/c74ada5fa42de4947eb0d65886f21528b8e65be7.patch"
        "${pkgname}.sh")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f44f4f2850ec481b648a06256eeb6632b4a98cd59822d1d8d8da38f8368ee065c6c2251a5a401bc7beef719a66ac43ca6bf063f1c10c267ec892024aa86f4fa2'
            '8ca3fbc790fa5d311ce41b5b9e84a79fe51db73cbf0f56f04d0429b28f0c4c0646e2d0c081b584161356ec24b06cc0181b115b865d564ff1452c64a57135acf6')

prepare() {
    cd "${pkgname}-${pkgver}"
    git submodule init
    git config submodule.dep/glfw.url "$srcdir/glfw"
    git config submodule.dep/nanosvg.url "$srcdir/nanosvg"
    git config submodule.dep/nanovg.url "$srcdir/nanovg"
    git config submodule.dep/osdialog.url "$srcdir/osdialog"
    git config submodule.dep/oui-blendish.url "$srcdir/oui-blendish"
    git config submodule.dep/rtaudio.url "$srcdir/rtaudio"
    git submodule update

  # devendor everything, that can be devendored
  patch -Np1 -i "../${pkgname}-use_system_libs.patch"

  # fix plugin.mk's use of jq, if SLUG/VERSION are unset
  sed -e 's/SLUG :=/SLUG ?=/' \
      -e 's/VERSION :=/VERSION ?=/' \
      -i plugin.mk

  gendesk -f -n \
          --pkgname "${pkgname}" \
          --name "VCV ${_name}" \
          --exec "${_name}" \
          --pkgdesc "${pkgdesc}" \
          --genericname "Virtual modular synthesizer" \
          --categories "AudioVideo;Audio"
}

build() {
    cd "${pkgname}-${pkgver}"
    USE_SYSTEM_LIBS=true VERSION=${pkgver} make dep
    USE_SYSTEM_LIBS=true VERSION=${pkgver} make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -vDm 755 "${_name}" -t "$pkgdir/opt/$pkgname"
  install -vDm 755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/${_name}"
  install -vDm 644 -t "$pkgdir/opt/$pkgname" template.vcv
  install -vDm 644 -t "$pkgdir/opt/$pkgname" Core.json
  install -vDm 644 -t "$pkgdir/opt/$pkgname" cacert.pem

  # resources
  cp -dr --preserve=mode res -t "$pkgdir/opt/$pkgname"

  # headers (required for plugins)
  for _path in {app,dsp,engine,plugin,simd,ui,widget}; do
    install -vDm 644 "include/${_path}/"* \
      -t "${pkgdir}/usr/include/${pkgname}/${_path}/"
  done
  install -vDm 644 include/*.{h,hpp} -t "${pkgdir}/usr/include/${pkgname}/"
  install -vDm 644 dep/include/*.h -t "${pkgdir}/usr/include/${pkgname}/dep"
  # Makefile snippets required for plugins
  install -vDm 644 {arch,compile,dep,plugin}.mk -t "${pkgdir}/usr/share/${pkgname}"

  # xdg desktop integration
  install -vDm 644 "${pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 'res/icon.png' "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  # licenses
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
