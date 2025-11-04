# Maintainer: Nathan Pilkington <npil>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andreas Schleifer <segaja@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Balló György <bgyorgy@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=sonic-pi
pkgver=4.6.0
pkgrel=4
pkgdesc="The Live Coding Music Synth for Everyone"
arch=(x86_64)
url="https://sonic-pi.net/"
license=(CC-BY-SA-4.0 LGPL-2.1-only GPL-2.0-only GPL-3.0-only MIT CC0-1.0 BSL-1.0 Ruby Apache-2.0 BSD-3-Clause custom:ISC)
groups=(pro-audio)
depends=(
  'ruby-rugged>=1.9.0' 'ruby-i18n>=1.14.7' 'ruby-kramdown>=2.1.0' 'ruby-multi_json>=1.9.2' 'ruby-memoist>=0.16.2'
  'ruby-tomlrb>=2.0.0' # devendored
  aubio ruby ruby-racc supercollider
  qscintilla-qt6 qt6-base qt6-svg qt6-wayland which
)
makedepends=(
  'boost>=1.74.0' 'ruby-gettext>=3.4.4'  # devendored
  erlang-asn1 erlang-public_key erlang-ssl erlang-parsetools erlang-sasl
  elixir git cmake gendesk chrpath qt6-tools
  ruby-prime ruby-erb ruby-rexml
)
#checkdepends=(ruby-rake)  # cannot run tests right now, see below
optdepends=(
  'sc3-plugins: additional synthesis UGens for SuperCollider'
  'sox: audio processing and sample manipulation'
)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/sonic-pi-net/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz
  $pkgname-$pkgver-gui_paths.patch
  $pkgname-$pkgver-ruby_paths.patch
  $pkgname-$pkgver-devendor_boost.patch
  $pkgname-$pkgver-boost_deprecated_lib.patch
  $pkgname-$pkgver-devendor_qscintilla_qt6.patch
)
sha512sums=(
  'd99d25bbb2e8b556156252140484502ce5bf2869f846b7aff69dae549812d18769b8cd6d9c474be36819d7a831b170553690906d89ece74cd9df2f80289d5892'
  '625b08cd7b1bbe93f898e36183badafed5e056b18df8d923b2ddb964fe358060501fcf63b9c8a05b95a5d9ab8d6dfb0419a7ed519b511c8e1612a7698df3f44a'
  'fa091666d493f302b507a8c8ccaf1992ee64214ec0f45b92198f724fce2b1cee718204afeba4de5ab6d2849a1e9a1933b623054fc459227a15529146d9937d7e'
  '841265559a7551d87750dffb4e224da4fdfd0657627ea8c7e61a996c2c854ee5773525b66cb1d750a5193e65f7e5f13cc5729f95d1d3d86b01d7a1a8be97226c'
  '5eacc305934bfb294f830f2ca8ed3cf4b51baef7b5ff98fd282e6f3636aadd34805fe7ce1574bb6d8b6c0dcb5309f6e1128acd226622c5a4c6da0d6fa474a077'
  '9a0aa447019a4fd11255bc1d7c9056934aaf3238e2e6b93c3fff8143ec5d06ed7721a712eb09895ed7daf23781d30bfa3a938352bdc404ac32b17eb5007c669e'
)

prepare() {
  cd $pkgname-$pkgver
  gendesk -n \
          --pkgname $pkgname \
          --pkgdesc "$pkgdesc" \
          --name "Sonic Pi" \
          --categories "AudioVideo;Audio"

  # patch app/gui/qt/{model/sonicpitheme,mainwindow}.cpp to set path to
  # external components in /usr/{lib,share}/sonic-pi
  printf "Apply patch to set FHS compliant GUI paths\n"
  patch -Np1 -i "../$pkgname-$pkgver-gui_paths.patch"

  printf "Apply patch to devendor qscintilla\n"
  patch -Np1 -i "../$pkgname-$pkgver-devendor_qscintilla_qt6.patch"

  printf "Apply patch to devendor boost\n"
  patch -Np1 -i "../$pkgname-$pkgver-devendor_boost.patch"

  printf "Apply patch to remove reference to deprecated boost system lib\n"
  patch -Np1 -i "../$pkgname-$pkgver-boost_deprecated_lib.patch"

  printf "Removing vendored test packages\n"
  sed -i '/add_subdirectory(api-tests)/d' app/CMakeLists.txt

  printf "Removing vendored rugged gem\n"
  rm -rf app/server/ruby/vendor/rugged-*

  # Remove rugged from compile-extensions.rb since we're using system version
  sed -i '/rugged/d' app/server/ruby/bin/compile-extensions.rb

  # Devendor kramdown - use system ruby-kramdown package
  printf "Removing vendored kramdown gem\n"
  rm -rf app/server/ruby/vendor/kramdown-*

  # Devendor i18n - use system ruby-i18n package
  printf "Removing vendored i18n gem\n"
  rm -rf app/server/ruby/vendor/i18n-*

  # Remove concurrent-ruby (will be pulled in automatically by ruby-i18n)
  rm -rf app/server/ruby/vendor/concurrent-ruby-*

  # Devendor multi_json - use system ruby-multi_json package
  printf "Removing vendored multi_json gem\n"
  rm -rf app/server/ruby/vendor/multi_json

  # Devendor memoist - use system ruby-memoist package
  printf "Removing vendored memoist gem\n"
  rm -rf app/server/ruby/vendor/memoist-*

  # Devendor tomlrb - use system ruby-tomlrb package
  printf "Removing vendored tomlrb gem\n"
  rm -rf app/server/ruby/vendor/tomlrb-*

  # Devendor gettext - use system ruby-gettext package (build-time only)
  printf "Removing vendored gettext gem\n"
  rm -rf app/server/ruby/vendor/gettext-*

  # Remove locale (will be pulled in automatically by ruby-gettext)
  rm -rf app/server/ruby/vendor/locale-*

  # Remove test-only and unused gems
  printf "Removing vendored minitest gem\n"
  rm -rf app/server/ruby/vendor/minitest-*
  printf "Removing vendored mocha gem\n"
  rm -rf app/server/ruby/vendor/mocha-*
  printf "Removing vendored metaclass gem\n"
  rm -rf app/server/ruby/vendor/metaclass-*
  printf "Removing vendored blankslate gem\n"
  rm -rf app/server/ruby/vendor/blankslate
  printf "Removing vendored text gem\n"
  rm -rf app/server/ruby/vendor/text-*
  printf "Removing vendored rouge gem\n"
  rm -rf app/server/ruby/vendor/rouge

  # Could not devendor:
  #     'ruby-wavefile>=0.8.1' - too old
  #     'ruby-titleize>=1.4.1' - not on Arch/AUR?
  #     'ruby-ruby-beautify2-git>=0.92.2' is an AUR package >_<, security?

  # Devendor wavefile - use system ruby-wavefile package
  # printf "Removing vendored wavefile gem\n"
  # rm -rf app/server/ruby/vendor/wavefile-*

  # Devendor titleize - use system ruby-titleize package
  # printf "Removing vendored titleize gem\n"
  # rm -rf app/server/ruby/vendor/titleize-*

  # printf "Removing vendored ruby-beautify gem\n"
  # rm -rf app/server/ruby/vendor/ruby-beautify

  # printf "Removing all contents of vendor except .keep\n"
  # find app/server/ruby/vendor -mindepth 1 ! -name .keep -exec rm -rf {} +
  # touch app/server/ruby/vendor/.keep

  # TODO: devendor ast-2.0.0
  # TODO: devendor atomic (bin)
  # TODO: devendor benchmark-ips-2.3.0
  # TODO: devendor interception (bin)
  # TODO: devendor rubame
  # TODO: devendor ruby-beautify
  # TODO: devendor ruby-prof-0.15.8
  # TODO: devendor thread_safe
  # TODO: devendor wavefile-0.8.1
  # TODO: devendor websocket-ruby-1.2.8

  # devendor gems requiring compilation:
  sed -i '/native_ext_dirs/,$c\return' app/server/ruby/bin/compile-extensions.rb  # remove unrequired gems, so we don't create any doc for them
  rm -rvf app/server/ruby/vendor/{activesupport,ffi,gettext,i18n,kramdown,locale,minitest,mocha,multi_json,polyglot,rouge,rugged,sys-proctable,text,treetop}*
  rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof,rake-compiler}*
}

build() {
  cd "$pkgname-$pkgver"
  ./app/linux-build-all.sh

  # patch app/server/ruby/lib/sonicpi/util.rb to set proper paths to external components
  # NOTE: this can only be done after running
  # app/server/ruby/bin/compile-extensions.rb, as ruby-wavefile uses a
  # hardcoded location of a file (move to prepare() after devendoring more ruby gems)
  patch -Np1 -i "../$pkgname-$pkgver-ruby_paths.patch"
}

# Tests fail because they require the package to be fully installed first
# The test suite tries to load files from /usr/share/sonic-pi/ which don't exist during build
# See: https://github.com/samaaron/sonic-pi/issues/1865
#check() {
# cd "$pkgname-$pkgver"
# cd app/server/ruby/test
# rake test
#}

package() {
  cd "$pkgname-$pkgver"/app

  # Install with correct prefix
  DESTDIR="$pkgdir" cmake --install build --prefix /usr

  # Install GUI executable
  install -vDm 755 build/gui/$pkgname "$pkgdir/usr/bin/$pkgname"

  cd ..

  # Install generated desktop file
  install -vDm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  # book
  install -vDm 644 app/gui/book/*.html -t "$pkgdir/usr/share/$pkgname/book/"
  # i18n
  install -vDm 644 app/gui/lang/*.qm -t "$pkgdir/usr/share/$pkgname/lang/"
  # help
  install -vDm 644 app/gui/help/*.html -t "$pkgdir/usr/share/$pkgname/help/"
  # html
  install -vDm 644 app/gui/html/*.html -t "$pkgdir/usr/share/$pkgname/html/"
  # images
  install -vDm 644 app/gui/images/*.png -t "$pkgdir/usr/share/$pkgname/images/"
  install -vDm 644 app/gui/images/coreteam/*.png -t "$pkgdir/usr/share/$pkgname/images/coreteam/"
  install -vDm 644 app/gui/images/toolbar/default/*.png -t "$pkgdir/usr/share/$pkgname/images/toolbar/default/"
  install -vDm 644 app/gui/images/toolbar/pro/*.png -t "$pkgdir/usr/share/$pkgname/images/toolbar/pro/"
  install -vDm 644 etc/doc/images/tutorial/*.png -t "$pkgdir/usr/share/$pkgname/images/tutorial/"
  # theme
  install -vDm 644 app/gui/theme/app.qss -t "$pkgdir/usr/share/$pkgname/theme/"
  install -vDm 644 app/gui/theme/dark/doc-styles.css -t "$pkgdir/usr/share/$pkgname/theme/dark/"
  install -vDm 644 app/gui/theme/light/doc-styles.css -t "$pkgdir/usr/share/$pkgname/theme/light/"
  install -vDm 644 app/gui/theme/high_contrast/doc-styles.css -t "$pkgdir/usr/share/$pkgname/theme/high_contrast/"
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
  # ruby
  install -vdm 755 "$pkgdir/usr/lib/$pkgname"
  cp -av app/server "$pkgdir/usr/lib/$pkgname/"
  find "$pkgdir/usr/lib/$pkgname/server" -type f \( -iname "*.o" -or -iname "*.c" -or -iname "*Rakefile" \) -delete

  # # xdg
  install -vDm 644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -vDm 644 app/gui/images/icon-smaller.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # license
  install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  # fix /build path vulnerability
  chrpath -d "$pkgdir/usr/bin/$pkgname"
}
