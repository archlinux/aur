# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sonic-pi
pkgver=3.2.2
pkgrel=2
pkgdesc="The Live Coding Music Synth for Everyone"
arch=('x86_64')
url="https://sonic-pi.net/"
license=('CCPL' 'LGPL2.1' 'GPL2' 'GPL3' 'MIT')
groups=('pro-audio')
depends=('aubio' 'gcc-libs' 'glibc' 'osmid' 'qt5-base' 'qscintilla-qt5' 'ruby'
'ruby-activesupport' 'ruby-ffi' 'ruby-i18n' 'ruby-kramdown' 'ruby-minitest'
'ruby-mocha' 'ruby-multi_json' 'ruby-rouge' 'ruby-rugged' 'ruby-sys-proctable'
'sc3-plugins' 'supercollider')
makedepends=('boost' 'cmake' 'erlang-nox' 'gendesk' 'lua' 'qt5-tools'
'ruby-bundler' 'wkhtmltopdf')
checkdepends=('ruby-rake')
optdepends=('sox: for further effects')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-3.2.0-gui_paths.patch"
        "${pkgname}-3.2.0-devendor_qscintilla-qt5.patch"
        "${pkgname}-3.2.0-ruby_paths.patch")
sha512sums=('07e2d07c51a8312db0145a7be5c6c99b2baa6f913bcb27449e3ab0382945f49c5f6451c899cb58407a11d3e05abf6a0d02f0efd07b2e90ad84fdc7c602332a76'
            'e530cc13cb6674dca2ace2a8da566ce28263a15197cf7fccd5d3e58b676c08ce860bc6264a95d26569ff1f923020a40ece1e05841c955c5db16e61c30938f1c0'
            'fbe196bc332a7a04e8d5097204a13626e7aba3a70715d2a1676c0b1f37f56da427d0d5b417f92c27e64f91a03dd9d4335f65f26f9e9d14e4076d496c94c949af'
            '987504a8b98eea4a3fac2557fcbf002b8d0e9c991922c74e7649546ff963c30d0fef891cecb546f840801c88ec9b82f1afb4cebef9838a53af20d0f3f63a9c39')

prepare() {
  cd "$pkgname-$pkgver"
  gendesk -n \
          --pkgname ${pkgname} \
          --pkgdesc "${pkgdesc}" \
          --name "Sonic Pi" \
          --categories "AudioVideo;Audio"
  rm -rvf app/server/native
  # patch app/gui/qt/{model/sonicpitheme,mainwindow}.cpp to set path to
  # external components in /usr/{lib,share}/sonic-pi
  patch -Np1 -i "../${pkgname}-3.2.0-gui_paths.patch"
  # devendor qscintilla-qt5: https://github.com/samaaron/sonic-pi/issues/2278
  patch -Np1 -i "../${pkgname}-3.2.0-devendor_qscintilla-qt5.patch"
  # TODO: devendor boost from GUI components (only headers required during
  # build time)

  #TODO: devendor ruby-ast
  #TODO: devendor ruby-atomic (bin)
  #TODO: devendor ruby-benchmark-ips
  #TODO: devendor ruby-blankslate
  #TODO: devendor ruby-did_you_mean (bin)
  #TODO: devendor ruby-fast_osc (bin)
  #TODO: devendor ruby-gettext
  #TODO: devendor ruby-hamster
  #TODO: devendor ruby-interception (bin)
  #TODO: devendor ruby-locale
  #TODO: devendor ruby-memoist
  #TODO: devendor ruby-metaclass
  #TODO: devendor ruby-parser
  #TODO: devendor ruby-parslet
  #TODO: devendor ruby-rubame
  #TODO: devendor ruby-aubio-prerelease
  #TODO: devendor ruby-beautify
  #TODO: devendor ruby-text
  #TODO: devendor ruby-thread_safe
  #TODO: devendor ruby-wavefile
  #TODO: devendor ruby-websocket

  # devendor gems requiring compilation:
  # ffi, ruby-prof, rugged
  sed -e '/rugged/d' \
      -e '/ffi/d' \
      -e '/ruby-prof/d' \
      -i app/server/ruby/bin/compile-extensions.rb
  # remove unrequired gems, so we don't create any doc for them
  rm -rvf app/server/ruby/vendor/{activesupport,ffi,i18n,kramdown,minitest,mocha,multi_json,rouge,rugged,sys-proctable}*
  rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof,rake-compiler}*
}

build() {
  cd "$pkgname-$pkgver"

  (
    # OSC and pi_server
    cd app/server/erlang
    erlc {osc,pi_server}.erl
  )

  (
    # ruby extensions
    cd app/server/ruby/bin
    ./compile-extensions.rb
    ./i18n-tool.rb -t
  )

  (
    # GUI
    cd app/gui/qt/
    # help template
    cp -vf utils/ruby_help.{tmpl,h}
    ../../server/ruby/bin/qt-doc.rb -o utils/ruby_help.h
    # generating translations
    lrelease lang/*.ts
    # compiling GUI
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -S .
    make VERBOSE=1 -C build
  )

  (
    # patch app/server/ruby/lib/sonicpi/util.rb to set proper paths to external components
    # NOTE: this can only be done after running
    # app/server/ruby/bin/compile-extensions.rb, as ruby-wavefile uses a
    # hardcoded location of a file (move to prepare() after devendoring more ruby gems)
    patch -Np1 -i "../${pkgname}-3.2.0-ruby_paths.patch"
  )
}

## tests fail: https://github.com/samaaron/sonic-pi/issues/1865
#check() {
#  cd "$pkgname-$pkgver"
#  cd app/server/ruby/test
#  rake test
#}

package() {
  cd "$pkgname-$pkgver"
  # GUI executable
  install -vDm 755 "app/gui/qt/build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # book
  install -vDm 644 app/gui/qt/book/*.html \
    -t "${pkgdir}/usr/share/${pkgname}/book"
  # i18n
  install -vDm 644 app/gui/qt/lang/*.qm \
    -t "${pkgdir}/usr/share/${pkgname}/lang"
  # help
  install -vDm 644 app/gui/qt/help/*.html \
    -t "${pkgdir}/usr/share/${pkgname}/help"
  # html
  install -vDm 644 app/gui/qt/html/*.html \
    -t "${pkgdir}/usr/share/${pkgname}/html"
  # images
  install -vDm 644 app/gui/qt/images/*.png \
    -t "${pkgdir}/usr/share/${pkgname}/images"
  install -vDm 644 app/gui/qt/images/coreteam/*.png \
    -t "${pkgdir}/usr/share/${pkgname}/images/coreteam"
  install -vDm 644 app/gui/qt/images/toolbar/default/*.png \
    -t "${pkgdir}/usr/share/${pkgname}/images/toolbar/default"
  install -vDm 644 app/gui/qt/images/toolbar/pro/*.png \
    -t "${pkgdir}/usr/share/${pkgname}/images/toolbar/pro"
  install -vDm 644 etc/doc/images/tutorial/*.png \
    -t "${pkgdir}/usr/share/${pkgname}/images/tutorial"
  # theme
  install -vDm 644 app/gui/qt/theme/app.qss \
    -t "${pkgdir}/usr/share/${pkgname}/theme/"
  install -vDm 644 app/gui/qt/theme/dark/doc-styles.css \
    -t "${pkgdir}/usr/share/${pkgname}/theme/dark"
  install -vDm 644 app/gui/qt/theme/light/doc-styles.css \
    -t "${pkgdir}/usr/share/${pkgname}/theme/light"
  # samples
  install -vDm 644 etc/samples/*.{flac,md} \
    -t "${pkgdir}/usr/share/${pkgname}/samples"
  # snippets
  install -vDm 644 etc/snippets/fx/*.sps \
    -t "${pkgdir}/usr/share/${pkgname}/snippets/fx"
  install -vDm 644 etc/snippets/live_loop/*.sps \
    -t "${pkgdir}/usr/share/${pkgname}/snippets/live_loop"
  install -vDm 644 etc/snippets/syntax/*.sps \
    -t "${pkgdir}/usr/share/${pkgname}/snippets/syntax"
  # synthdefs
  install -vDm 644 etc/synthdefs/compiled/*.scsyndef \
    -t "${pkgdir}/usr/share/${pkgname}/synthdefs/compiled"
  install -vDm 644 etc/synthdefs/designs/overtone/${pkgname}/*.clj\
    -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/overtone/"
  install -vDm 644 etc/synthdefs/designs/overtone/${pkgname}/src/sonic_pi/*.clj\
    -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/overtone/sonic_pi/src"
  install -vDm 644 etc/synthdefs/designs/overtone/${pkgname}/test/sonic_pi/*.clj\
    -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/overtone/sonic_pi/test"
  # buffers
  install -vDm 644 etc/buffers/rand-stream.wav \
    -t "${pkgdir}/usr/share/${pkgname}/buffers"
  # docs
  install -vDm 644 etc/doc/cheatsheets/*.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/cheatsheets"
  # pdfs
  install -vDm 644 etc/synthdefs/graphviz/pdf/*.pdf \
    -t "${pkgdir}/usr/share/doc/${pkgname}/synthdefs"
  # tutorial
  install -vDm 644 etc/doc/tutorial/*.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/tutorial"
  # examples
  install -vDm 644 etc/examples/algomancer/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/algomancer"
  install -vDm 644 etc/examples/apprentice/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/apprentice"
  install -vDm 644 etc/examples/illusionist/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/illusionist"
  install -vDm 644 etc/examples/incubation/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/incubation"
  install -vDm 644 etc/examples/magician/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/magician"
  install -vDm 644 etc/examples/sorcerer/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/sorcerer"
  install -vDm 644 etc/examples/wizard/*.rb \
    -t "${pkgdir}/usr/share/doc/${pkgname}/examples/wizard"
  # erlang
  install -vDm 755 app/server/erlang/*.beam \
    -t "${pkgdir}/usr/lib/${pkgname}"
  # ruby
  install -vdm 755 "${pkgdir}/usr/share/${pkgname}"
  cp -av app/server/ruby "${pkgdir}/usr/lib/${pkgname}/server"
  rm -fv "${pkgdir}/usr/lib/${pkgname}/server/vendor/"*/ext/*.{o,c}
  rm -fv "${pkgdir}/usr/lib/${pkgname}/server/vendor/"*/ext/*/*.{o,c}
  rm -fv "${pkgdir}/usr/lib/${pkgname}/server/Rakefile"
  rm -fv "${pkgdir}/usr/lib/${pkgname}/server/vendor/"*/Rakefile
  # xdg
  install -vDm 644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 app/gui/qt/images/icon-smaller.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # license
  install -vDm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
