# Maintainer: Nigel Michki <nigeil@yahoo.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Serhii Balbieko <sergey@balbeko.com>
# Contributor: Simon Dreher <code@simon-dreher.de>

_name=sonic-pi
pkgname=sonic-pi-git
pkgver=v3.2.0.r44.gc3895b5f0
pkgrel=1
pkgdesc="The Live Coding Music Synth for Everyone"
arch=('i686' 'x86_64')
url="http://sonic-pi.net/"
license=('MIT')
groups=('pro-audio')
conflicts=('sonic-pi')
provides=('sonic-pi')
depends=('aubio' 'gcc-libs' 'glibc' 'osmid' 'qt5-base' 'qscintilla-qt5' 'ruby'
'ruby-activesupport' 'ruby-bundler' 'ruby-ffi' 'ruby-i18n' 'ruby-kramdown'
'ruby-minitest' 'ruby-mocha' 'ruby-multi_json' 'ruby-rake' 'ruby-rouge'
'ruby-rugged' 'ruby-sys-proctable' 'sc3-plugins' 'sox' 'supercollider')
makedepends=('boost' 'cmake' 'git' 'erlang-nox' 'gendesk' 'lua' 'qt5-tools'
'wkhtmltopdf')
source=('git+https://github.com/samaaron/sonic-pi.git'
        "${_name}-3.2.0-gui_paths.patch"
        "${_name}-3.2.0-devendor_qscintilla-qt5.patch"
        "${_name}-3.2.0-ruby_paths.patch")
sha512sums=('SKIP'
            'e530cc13cb6674dca2ace2a8da566ce28263a15197cf7fccd5d3e58b676c08ce860bc6264a95d26569ff1f923020a40ece1e05841c955c5db16e61c30938f1c0'
            'fbe196bc332a7a04e8d5097204a13626e7aba3a70715d2a1676c0b1f37f56da427d0d5b417f92c27e64f91a03dd9d4335f65f26f9e9d14e4076d496c94c949af'
            '987504a8b98eea4a3fac2557fcbf002b8d0e9c991922c74e7649546ff963c30d0fef891cecb546f840801c88ec9b82f1afb4cebef9838a53af20d0f3f63a9c39')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  gendesk -n \
          --pkgname "${pkgname}" \
          --pkgdesc "${pkgdesc}" \
          --name "${pkgname}" \
          --exec "${_name}" \
          --categories "AudioVideo;Audio"
  rm -rvf app/server/native
  # patch app/gui/qt/{model/sonicpitheme,mainwindow}.cpp to set path to
  # external components in /usr/{lib,share}/sonic-pi
  patch -Np1 -i "../${_name}-3.2.0-gui_paths.patch"
  # devendor qscintilla-qt5: https://github.com/samaaron/sonic-pi/issues/2278
  patch -Np1 -i "../${_name}-3.2.0-devendor_qscintilla-qt5.patch"
  # devendor gems requiring compilation:
  # ffi, ruby-prof, rugged
  sed -e '/rugged/d' \
      -e '/ffi/d' \
      -e '/ruby-prof/d' \
      -i app/server/ruby/bin/compile-extensions.rb
  # remove unrequired gems, so we don't create any doc for them
  rm -rvf app/server/ruby/vendor/{activesupport,ffi,i18n,kramdown,minitest,mocha,multi_json,rouge,rugged,sys-proctable}*
  rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof}*
}

build() {
  cd "${_name}"
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
    patch -Np1 -i "../${_name}-3.2.0-ruby_paths.patch"
  )
}

## tests fail: https://github.com/samaaron/sonic-pi/issues/1865
#check() {
#  cd "${_name}"
#  cd app/server/ruby/test
#  rake test
#}

package() {
  cd "${_name}"
  # GUI executable
  install -vDm 755 "app/gui/qt/build/${_name}" "${pkgdir}/usr/bin/${_name}"
  # book
  install -vDm 644 app/gui/qt/book/*.html \
    -t "${pkgdir}/usr/share/${_name}/book"
  # i18n
  install -vDm 644 app/gui/qt/lang/*.qm \
    -t "${pkgdir}/usr/share/${_name}/lang"
  # help
  install -vDm 644 app/gui/qt/help/*.html \
    -t "${pkgdir}/usr/share/${_name}/help"
  # html
  install -vDm 644 app/gui/qt/html/*.html \
    -t "${pkgdir}/usr/share/${_name}/html"
  # images
  install -vDm 644 app/gui/qt/images/*.png \
    -t "${pkgdir}/usr/share/${_name}/images"
  install -vDm 644 app/gui/qt/images/coreteam/*.png \
    -t "${pkgdir}/usr/share/${_name}/images/coreteam"
  install -vDm 644 app/gui/qt/images/toolbar/default/*.png \
    -t "${pkgdir}/usr/share/${_name}/images/toolbar/default"
  install -vDm 644 app/gui/qt/images/toolbar/pro/*.png \
    -t "${pkgdir}/usr/share/${_name}/images/toolbar/pro"
  install -vDm 644 etc/doc/images/tutorial/*.png \
    -t "${pkgdir}/usr/share/${_name}/images/tutorial"
  # theme
  install -vDm 644 app/gui/qt/theme/app.qss \
    -t "${pkgdir}/usr/share/${_name}/theme/"
  install -vDm 644 app/gui/qt/theme/dark/doc-styles.css \
    -t "${pkgdir}/usr/share/${_name}/theme/dark"
  install -vDm 644 app/gui/qt/theme/light/doc-styles.css \
    -t "${pkgdir}/usr/share/${_name}/theme/light"
  # samples
  install -vDm 644 etc/samples/*.{flac,md} \
    -t "${pkgdir}/usr/share/${_name}/samples"
  # snippets
  install -vDm 644 etc/snippets/fx/*.sps \
    -t "${pkgdir}/usr/share/${_name}/snippets/fx"
  install -vDm 644 etc/snippets/live_loop/*.sps \
    -t "${pkgdir}/usr/share/${_name}/snippets/live_loop"
  install -vDm 644 etc/snippets/syntax/*.sps \
    -t "${pkgdir}/usr/share/${_name}/snippets/syntax"
  # synthdefs
  install -vDm 644 etc/synthdefs/compiled/*.scsyndef \
    -t "${pkgdir}/usr/share/${_name}/synthdefs/compiled"
  install -vDm 644 etc/synthdefs/designs/overtone/${_name}/*.clj\
    -t "${pkgdir}/usr/share/${_name}/synthdefs/designs/overtone/"
  install -vDm 644 etc/synthdefs/designs/overtone/${_name}/src/sonic_pi/*.clj\
    -t "${pkgdir}/usr/share/${_name}/synthdefs/designs/overtone/sonic_pi/src"
  install -vDm 644 etc/synthdefs/designs/overtone/${_name}/test/sonic_pi/*.clj\
    -t "${pkgdir}/usr/share/${_name}/synthdefs/designs/overtone/sonic_pi/test"
  # buffers
  install -vDm 644 etc/buffers/rand-stream.wav \
    -t "${pkgdir}/usr/share/${_name}/buffers"
  # docs
  install -vDm 644 etc/doc/cheatsheets/*.md \
    -t "${pkgdir}/usr/share/doc/${_name}/cheatsheets"
  # pdfs
  install -vDm 644 etc/synthdefs/graphviz/pdf/*.pdf \
    -t "${pkgdir}/usr/share/doc/${_name}/synthdefs"
  # tutorial
  install -vDm 644 etc/doc/tutorial/*.md \
    -t "${pkgdir}/usr/share/doc/${_name}/tutorial"
  # examples
  install -vDm 644 etc/examples/algomancer/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/algomancer"
  install -vDm 644 etc/examples/apprentice/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/apprentice"
  install -vDm 644 etc/examples/illusionist/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/illusionist"
  install -vDm 644 etc/examples/incubation/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/incubation"
  install -vDm 644 etc/examples/magician/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/magician"
  install -vDm 644 etc/examples/sorcerer/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/sorcerer"
  install -vDm 644 etc/examples/wizard/*.rb \
    -t "${pkgdir}/usr/share/doc/${_name}/examples/wizard"
  # erlang
  install -vDm 755 app/server/erlang/*.beam \
    -t "${pkgdir}/usr/lib/${_name}"
  # ruby
  install -vdm 755 "${pkgdir}/usr/share/${_name}"
  cp -av app/server/ruby "${pkgdir}/usr/lib/${_name}/server"
  rm -vf "${pkgdir}/usr/lib/${_name}/server/vendor/"*/ext/*.{o,c}
  rm -vf "${pkgdir}/usr/lib/${_name}/server/vendor/"*/ext/*/*.{o,c}
  rm -vf "${pkgdir}/usr/lib/${_name}/server/Rakefile"
  rm -vf "${pkgdir}/usr/lib/${_name}/server/vendor/"*/Rakefile
  # xdg
  install -vDm 644 "${_name}.desktop" -t "${pkgdir}/usr/share/applications/"
  # license
  install -vDm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
