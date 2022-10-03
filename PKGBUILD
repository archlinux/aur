# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=sonic-pi
pkgver=3.3.1
pkgrel=4
pkgdesc="The Live Coding Music Synth for Everyone"
arch=(x86_64)
url="https://sonic-pi.net/"
license=(CCPL LGPL2.1 GPL2 GPL3 MIT)
groups=(pro-audio)
depends=(aubio gcc-libs glibc jack-example-tools osmid qt5-base qscintilla-qt5
ruby ruby-activesupport ruby-ffi ruby-gettext ruby-i18n ruby-kramdown
ruby-locale ruby-minitest ruby-mocha ruby-multi_json ruby-polyglot ruby-rouge
ruby-rugged ruby-sys-proctable ruby-text ruby-treetop sc3-plugins
supercollider)
makedepends=(boost cmake erlang-nox gendesk lua qt5-tools ruby-bundler
wkhtmltopdf)
checkdepends=(ruby-rake)
optdepends=('sox: for further effects')
options=(debug)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/samaaron/${pkgname}/archive/v${pkgver}.tar.gz
  $pkgname-3.2.0-gui_paths.patch
  $pkgname-3.3.1-devendor_qscintilla-qt5.patch
  $pkgname-3.3.1-devendor_boost.patch
  $pkgname-3.3.1-ruby_paths.patch
)
sha512sums=('ccddbc247b9952592dea6f5edf670382e95f87cf5020c5aa30e57ba47a36614171d4e9b6e75556b419eb3918ca6c0d3b257001bff6afdd088d52676bb3667622'
            'e530cc13cb6674dca2ace2a8da566ce28263a15197cf7fccd5d3e58b676c08ce860bc6264a95d26569ff1f923020a40ece1e05841c955c5db16e61c30938f1c0'
            '7046d9a18b4ced21a80b0fb79d8fa522f3d3a08b5f4de6deda3548e82e14187f06b2656b1d80b6897318729948252122e5c37e3c93831a16ec7de89fbd9ba186'
            '36f09861690be41bcb0b5bb627d93eddbcd6820f9a019e46313b13058772a34f0c1d8268b9f553678e1afdcc9a87403987f7f0f7dfb446d7402f099b611e2b06'
            '3e085d9548ca35b8ccf62985b95111072d9b13bd8b32340ae6412d376e0e6a13a87d6c8a192ab3d2439b4cab61b6cdecc29f7a5dba021e93ad0307641c59ab61')
b2sums=('2198b1918f22ef3ae554a6a1cab5d4cb0e2b4edaf6c8c8f67ba07f1750131e57fd2d973b17875cb6e99dce98df005fe949c337c85c5ea5b7a9905e2d808221d6'
        'b155e8d0bfc3a56ac176a8cbbb11fd27d926af2df54d71a77fab0909187457c73842027f88b452481bc339d55779506a58017ebc79de33c41bffa3e1a8bd204a'
        '7e297f7fda3d5aa10eddba011d18cae813e5c3bfd29f99d19b527669abe9c71a2d4cdc8104c135c2026a57365ff941b39a7a674f0f1a35a25b0176147b8d2764'
        '909cde9e799f47f8f9e15182a5a21df197d389df50811f14d433c006154ce0483f856760e1707c94c66ea526f126bd0ab3424e1bc638b14be16ec1f270c0eed6'
        '610f6e8d9b7df50edd17ba4e9f587055b61e9330eea1b959d1112b6c9864e53d82e66018d5f136e92afe4245fd4ad5c4a58774c3785615e6e952fb94280e5388')

prepare() {
  cd $pkgname-$pkgver
  gendesk -n \
          --pkgname $pkgname \
          --pkgdesc "$pkgdesc" \
          --name "Sonic Pi" \
          --categories "AudioVideo;Audio"
  rm -rvf app/server/native
  # patch app/gui/qt/{model/sonicpitheme,mainwindow}.cpp to set path to
  # external components in /usr/{lib,share}/sonic-pi
  printf "Apply patch to set FHS compliant GUI paths\n"
  patch -Np1 -i "../${pkgname}-3.2.0-gui_paths.patch"
  # devendor qscintilla-qt5: https://github.com/samaaron/sonic-pi/issues/2278
  printf "Apply patch to devendor qscintilla-qt5\n"
  patch -Np1 -i "../${pkgname}-3.3.1-devendor_qscintilla-qt5.patch"
  printf "Apply patch to devendor boost\n"
  patch -Np1 -i "../${pkgname}-3.3.1-devendor_boost.patch"

  # TODO: devendor ast-2.0.0
  # TODO: devendor atomic (bin)
  # TODO: devendor benchmark-ips-2.3.0
  # TODO: devendor blankslate
  # TODO: devendor interception (bin)
  # TODO: devendor memoist-0.16.2
  # TODO: devendor metaclass-0.0.4
  # TODO: devendor rubame
  # TODO: devendor ruby-beautify
  # TODO: devendor ruby-prof-0.15.8
  # TODO: devendor thread_safe
  # TODO: devendor tomlrb-2.0.0
  # TODO: devendor wavefile-0.8.1
  # TODO: devendor websocket-ruby-1.2.8

  # devendor gems requiring compilation:
  # ffi, ruby-prof, rugged
  sed -e '/rugged/d' \
      -e '/ffi/d' \
      -e '/ruby-prof/d' \
      -i app/server/ruby/bin/compile-extensions.rb
  # remove unrequired gems, so we don't create any doc for them
  rm -rvf app/server/ruby/vendor/{activesupport,ffi,gettext,i18n,kramdown,locale,minitest,mocha,multi_json,polyglot,rouge,rugged,sys-proctable,text,treetop}*
  rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof,rake-compiler}*
}

build() {
  cd "$pkgname-$pkgver"

  (
    # OSC and pi_server
    cd app/server/erlang/sonic_pi_server/src
    erlc {osc/osc,pi_server/pi_server,sp_midi/sp_midi}.erl
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
  )
  (
    cd app
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -B build \
          -Wno-dev \
          -S .
    make VERBOSE=1 -C build
  )

  (
    # patch app/server/ruby/lib/sonicpi/util.rb to set proper paths to external components
    # NOTE: this can only be done after running
    # app/server/ruby/bin/compile-extensions.rb, as ruby-wavefile uses a
    # hardcoded location of a file (move to prepare() after devendoring more ruby gems)
    patch -Np1 -i ../$pkgname-3.3.1-ruby_paths.patch
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
  install -vDm 755 "app/build/gui/qt/$pkgname" -t "$pkgdir/usr/bin/"
  # book
  install -vDm 644 app/gui/qt/book/*.html -t "$pkgdir/usr/share/$pkgname/book/"
  # i18n
  install -vDm 644 app/gui/qt/lang/*.qm -t "$pkgdir/usr/share/$pkgname/lang/"
  # help
  install -vDm 644 app/gui/qt/help/*.html -t "$pkgdir/usr/share/$pkgname/help/"
  # html
  install -vDm 644 app/gui/qt/html/*.html -t "$pkgdir/usr/share/$pkgname/html/"
  # images
  install -vDm 644 app/gui/qt/images/*.png -t "$pkgdir/usr/share/$pkgname/images/"
  install -vDm 644 app/gui/qt/images/coreteam/*.png -t "$pkgdir/usr/share/$pkgname/images/coreteam/"
  install -vDm 644 app/gui/qt/images/toolbar/default/*.png -t "$pkgdir/usr/share/$pkgname/images/toolbar/default/"
  install -vDm 644 app/gui/qt/images/toolbar/pro/*.png -t "$pkgdir/usr/share/$pkgname/images/toolbar/pro/"
  install -vDm 644 etc/doc/images/tutorial/*.png -t "$pkgdir/usr/share/$pkgname/images/tutorial/"
  # theme
  install -vDm 644 app/gui/qt/theme/app.qss -t "$pkgdir/usr/share/$pkgname/theme/"
  install -vDm 644 app/gui/qt/theme/dark/doc-styles.css -t "$pkgdir/usr/share/$pkgname/theme/dark/"
  install -vDm 644 app/gui/qt/theme/light/doc-styles.css -t "$pkgdir/usr/share/$pkgname/theme/light/"
  # samples
  install -vDm 644 etc/samples/*.{flac,md} -t "$pkgdir/usr/share/$pkgname/samples/"
  # snippets
  install -vDm 644 etc/snippets/fx/*.sps -t "$pkgdir/usr/share/$pkgname/snippets/fx/"
  install -vDm 644 etc/snippets/live_loop/*.sps -t "$pkgdir/usr/share/$pkgname/snippets/live_loop/"
  install -vDm 644 etc/snippets/syntax/*.sps -t "$pkgdir/usr/share/$pkgname/snippets/syntax/"
  # synthdefs
  install -vDm 644 etc/synthdefs/compiled/*.scsyndef -t "$pkgdir/usr/share/$pkgname/synthdefs/compiled/"
  install -vDm 644 etc/synthdefs/designs/overtone/$pkgname/*.clj -t "$pkgdir/usr/share/$pkgname/synthdefs/designs/overtone/"
  install -vDm 644 etc/synthdefs/designs/overtone/$pkgname/src/sonic_pi/*.clj -t "$pkgdir/usr/share/$pkgname/synthdefs/designs/overtone/sonic_pi/src/"
  install -vDm 644 etc/synthdefs/designs/overtone/$pkgname/test/sonic_pi/*.clj -t "$pkgdir/usr/share/$pkgname/synthdefs/designs/overtone/sonic_pi/test/"
  # buffers
  install -vDm 644 etc/buffers/*.wav -t "$pkgdir/usr/share/$pkgname/buffers/"
  # docs
  install -vDm 644 etc/doc/cheatsheets/*.md -t "$pkgdir/usr/share/doc/$pkgname/cheatsheets/"
  # pdfs
  install -vDm 644 etc/synthdefs/graphviz/pdf/*.pdf -t "$pkgdir/usr/share/doc/$pkgname/synthdefs/"
  # tutorial
  install -vDm 644 etc/doc/tutorial/*.md -t "$pkgdir/usr/share/doc/$pkgname/tutorial/"
  # examples
  install -vDm 644 etc/examples/algomancer/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/algomancer/"
  install -vDm 644 etc/examples/apprentice/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/apprentice/"
  install -vDm 644 etc/examples/illusionist/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/illusionist/"
  install -vDm 644 etc/examples/incubation/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/incubation/"
  install -vDm 644 etc/examples/magician/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/magician/"
  install -vDm 644 etc/examples/sorcerer/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/sorcerer/"
  install -vDm 644 etc/examples/wizard/*.rb -t "$pkgdir/usr/share/doc/$pkgname/examples/wizard/"
  # erlang
  install -vDm 755 app/server/erlang/sonic_pi_server/src/*.beam -t "$pkgdir/usr/lib/$pkgname/"
  # ruby
  install -vdm 755 "$pkgdir/usr/lib/$pkgname"
  cp -av app/server/ruby "$pkgdir/usr/lib/$pkgname/server"
  find "$pkgdir/usr/lib/$pkgname/server" -type f \( -iname "*.o" -or -iname "*.c" -or -iname "*Rakefile" \) -delete
  # xdg
  install -vDm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -vDm 644 app/gui/qt/images/icon-smaller.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # license
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
