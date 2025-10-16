# Maintainer: Nathan Pilkington <npil>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=sonic-pi
pkgver=4.6.0
pkgrel=2
pkgdesc="The Live Coding Music Synth for Everyone"
arch=(x86_64)
url="https://sonic-pi.net/"
license=(CC-BY-SA-4.0 LGPL-2.1-only GPL-2.0-only GPL-3.0-only MIT CC0-1.0 BSL-1.0 Ruby Apache-2.0 BSD-3-Clause custom:ISC)
groups=(pro-audio)
depends=(
  aubio ruby ruby-racc supercollider
  qscintilla-qt6 qt6-base qt6-svg qt6-wayland which
)
makedepends=(
  'boost>=1.74.0'  # match vendored version
  erlang-asn1 erlang-public_key erlang-ssl erlang-parsetools erlang-sasl
  elixir git cmake gendesk chrpath qt6-tools
  ruby-prime ruby-erb ruby-rexml
)
checkdepends=(ruby-rake)
optdepends=('sox: for further effects')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/sonic-pi-net/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz
  $pkgname-$pkgver-gui_paths.patch
  $pkgname-$pkgver-ruby_paths.patch
  $pkgname-$pkgver-devendor_boost.patch
)
sha512sums=(
  'd99d25bbb2e8b556156252140484502ce5bf2869f846b7aff69dae549812d18769b8cd6d9c474be36819d7a831b170553690906d89ece74cd9df2f80289d5892'
  '625b08cd7b1bbe93f898e36183badafed5e056b18df8d923b2ddb964fe358060501fcf63b9c8a05b95a5d9ab8d6dfb0419a7ed519b511c8e1612a7698df3f44a'
  'fa091666d493f302b507a8c8ccaf1992ee64214ec0f45b92198f724fce2b1cee718204afeba4de5ab6d2849a1e9a1933b623054fc459227a15529146d9937d7e'
  '841265559a7551d87750dffb4e224da4fdfd0657627ea8c7e61a996c2c854ee5773525b66cb1d750a5193e65f7e5f13cc5729f95d1d3d86b01d7a1a8be97226c'
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

  printf "Apply patch to devendor boost\n"
  patch -Np1 -i "../$pkgname-$pkgver-devendor_boost.patch"

#   # TODO: devendor ast-2.0.0
#   # TODO: devendor atomic (bin)
#   # TODO: devendor benchmark-ips-2.3.0
#   # TODO: devendor blankslate
#   # TODO: devendor interception (bin)
#   # TODO: devendor memoist-0.16.2
#   # TODO: devendor metaclass-0.0.4
#   # TODO: devendor rubame
#   # TODO: devendor ruby-beautify
#   # TODO: devendor ruby-prof-0.15.8
#   # TODO: devendor thread_safe
#   # TODO: devendor tomlrb-2.0.0
#   # TODO: devendor wavefile-0.8.1
#   # TODO: devendor websocket-ruby-1.2.8

# Commented out all this devendoring stuff for now, will address later
#   # devendor gems requiring compilation:
#   # ffi, ruby-prof, rugged
#   sed -e '/rugged/d' \
#       -e '/ffi/d' \
#       -e '/ruby-prof/d' \
#       -i app/server/ruby/bin/compile-extensions.rb
#   # remove unrequired gems, so we don't create any doc for them
#   rm -rvf app/server/ruby/vendor/{activesupport,ffi,gettext,i18n,kramdown,locale,minitest,mocha,multi_json,polyglot,rouge,rugged,sys-proctable,text,treetop}*
#   rm -rvf app/server/ruby/vendor/{narray,ruby-coreaudio,ruby-prof,rake-compiler}*
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

## tests fail: https://github.com/samaaron/sonic-pi/issues/1865
#check() {
#  cd "$pkgname-$pkgver"
#  cd app/server/ruby/test
#  rake test
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
