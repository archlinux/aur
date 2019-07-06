# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>

_name=Rack
pkgname=vcvrack
pkgver=1.1.1
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
        git+https://github.com/AndrewBelt/osdialog.git
        git+https://github.com/AndrewBelt/oui-blendish.git
        git+https://github.com/glfw/glfw.git
        git+https://github.com/memononen/nanosvg.git
        git+https://github.com/memononen/nanovg.git
        git+https://github.com/thestk/rtaudio.git
        "${pkgname}-use_system_libs.patch::https://github.com/cvcrack/Rack/commit/6f4988b951fdc4585aea4e213102cbf94ce2306d.patch"
        "${pkgname}.sh")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2cc74a866312f477f6b357cde34f7ce02cbe953715bf5f691299883c7199f2a3798be5c64a5c37d64fdcae419bea8a1f5385dbdecbfc43b750aaa15172352d4d'
            '8ca3fbc790fa5d311ce41b5b9e84a79fe51db73cbf0f56f04d0429b28f0c4c0646e2d0c081b584161356ec24b06cc0181b115b865d564ff1452c64a57135acf6')

prepare() {
    cd "${pkgname}-${pkgver}"
    git submodule init
    git config submodule.ext/glfw.url "$srcdir/glfw"
    git config submodule.ext/nanosvg.url "$srcdir/nanosvg"
    git config submodule.ext/nanovg.url "$srcdir/nanovg"
    git config submodule.ext/osdialog.url "$srcdir/osdialog"
    git config submodule.ext/oui-blendish.url "$srcdir/oui-blendish"
    git config submodule.ext/rtaudio.url "$srcdir/rtaudio"
    git submodule update

  # devendor everything, that can be devendored
  patch -Np1 -i "../${pkgname}-use_system_libs.patch"

  # fix plugin.mk's use of jq, if SLUG/VERSION are unset
  sed -e 's/SLUG :=/SLUG ?=/' \
      -e 's/VERSION :=/VERSION ?=/' \
      -i plugin.mk

  gendesk -n \
          --pkgname "${pkgname}" \
          --name "${_name}" \
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
  install -vDm 644 -t "$pkgdir/opt/$pkgname" Core.json

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
  # licenses
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
