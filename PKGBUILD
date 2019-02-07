# Maintainer: David Runge <dave@sleepmap.de>
pkgname=sonic-pi
pkgver=3.1.0
pkgrel=4
pkgdesc="The Live Coding Music Synth for Everyone"
arch=('x86_64')
url="https://sonic-pi.net/"
license=('CCPL' 'LGPL2.1' 'GPL2' 'GPL3' 'MIT')
groups=('pro-audio')
depends=('aubio' 'boost-libs' 'http-parser' 'osmid' 'qscintilla-qt5' 'qwt'
'ruby-ffi' 'ruby-minitest' 'ruby-multi_json' 'ruby-rouge' 'ruby-rugged'
'ruby-sys-proctable' 'sc3-plugins' 'supercollider')
makedepends=('boost' 'cmake' 'erlang-nox' 'lua' 'qt5-tools' 'wkhtmltopdf')
checkdepends=('ruby-rake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz"
        "fix-paths-in-gui.diff"
        "fix-ruby-paths.diff")
sha512sums=('45373d3e673bc2f45bf5ccea31f6cf5e2003c9bdfc4645dec4b9fec391cb28b9e0b0823a98e9690928e116b8c40f96596bd1c8f5aefbf4f3e43e6c30ab76d41f'
            'ea827c451a42ea12b7a1ced04978fa3a3eb5368b9802c982a0f815159d5591bedc4dc5b9eed89df3957087352bcb5f778e054abd2cb38cc1e57ab538e73b97f3'
            '245418d7d3d145a77423350afd2598865395ed5e479fa13922320e6d53c849b01e99c71c460e384f69a8a70d6087899d9e26dcd06d68a13980fc2d6a543b2644')

prepare() {
  cd "$pkgname-$pkgver"
  sed -e 's/lqt5scintilla2/lqscintilla2_qt5/g' -i app/gui/qt/SonicPi.pro
  rm -rvf app/server/native
  # TODO: patch app/gui/qt/mainwindow.cpp to set path to external components in /usr/{lib,share}/sonic-pi
  patch -Np1 -i ../fix-paths-in-gui.diff
  #TODO: devendor ruby-activesupport
  #TODO: devendor ruby-ast
  #TODO: devendor ruby-atomic (bin)
  #TODO: devendor ruby-benchmark-ips
  #TODO: devendor ruby-blankslate
  #TODO: devendor ruby-did_you_mean (bin)
  #TODO: devendor ruby-fast_osc (bin)
  #TODO: devendor ruby-gettext
  #TODO: devendor ruby-hamster
  #TODO: devendor ruby-i18n
  #TODO: devendor ruby-interception (bin)
  #TODO: devendor ruby-kramdown (i18n-tool.rb breaks on it)
  #TODO: devendor ruby-locale
  #TODO: devendor ruby-memoist
  #TODO: devendor ruby-metaclass
  #TODO: devendor ruby-mocha
  #TODO: devendor ruby-parser
  #TODO: devendor ruby-parslet
  #TODO: devendor ruby-rubame
  #TODO: devendor ruby-aubio-prerelease
  #TODO: devendor ruby-beautify
  #TODO: devendor ruby-text
  #TODO: devendor ruby-thread_safe
  #TODO: devendor ruby-wavefile
  #TODO: devendor ruby-websocket
  # devendor ffi, ruby-prof, rugged
  sed -e '/rugged/d' \
      -e '/ffi/d' \
      -e '/ruby-prof/d' \
      -i app/server/ruby/bin/compile-extensions.rb
  rm -rvf app/server/ruby/vendor/{ffi,minitest,multi_json,rouge,rugged,sys-proctable}*
  # remove unrequired gems, so we don't create any doc for them
  rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof}*
}

build() {
  cd "$pkgname-$pkgver"

  # OSC and pi_server
  cd app/server/erlang
  erlc {osc,pi_server}.erl

  cd "${srcdir}/$pkgname-$pkgver"

  # ruby extensions
  cd app/gui/qt/
  ../../server/ruby/bin/compile-extensions.rb
  ../../server/ruby/bin/i18n-tool.rb -t
  # help template
  cp -vf ruby_help.{tmpl,h}
  ../../server/ruby/bin/qt-doc.rb -o ruby_help.h

  # GUI
  lrelease SonicPi.pro
  qmake-qt5 SonicPi.pro
  make

  cd "${srcdir}/$pkgname-$pkgver"
  # TODO: patch app/server/ruby/lib/sonicpi/util.rb to set proper paths to external components
  patch -Np1 -i ../fix-ruby-paths.diff
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
  install -vDm 755 "app/gui/qt/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

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
  install -vDm 644 etc/synthdefs/designs/sonic_pi/synths/*.clj\
    -t "${pkgdir}/usr/share/${pkgname}/synthdefs/designs/sonic_pi/synths"

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

  # license
  install -vDm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
