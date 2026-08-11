# Maintainer: Nathan Pilkington <npil>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andreas Schleifer <segaja@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Balló György <bgyorgy@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=sonic-pi
pkgver=5.0.0
pkgrel=1
pkgdesc="The Live Coding Music Synth for Everyone"
arch=(x86_64)
url="https://sonic-pi.net/"
license=(CC-BY-SA-4.0 LGPL-2.1-only GPL-2.0-only GPL-3.0-only MIT CC0-1.0 BSL-1.0 Ruby Apache-2.0 BSD-3-Clause ISC custom:ISC)
groups=(pro-audio)

# SuperSonic lives in the git submodule app/external/supersonic. GitHub's tag tarball doesn't carry
# submodule contents, so it is fetched separately and dropped into place in prepare().
_supersonic_commit=2652a28eb6cb51a4fb696fca2f04b3e073bd26c2
# SuperSonic pulls Ableton Link with FetchContent at configure time.
# It's pinned here and handed to the build via FETCHCONTENT_SOURCE_DIR_ABLETONLINK
# so that build() needs no network.
# Cannot be devendored right now as Arch ships 3.1.2 and supersonic depends on LinkAudio from 4.0.
_link_tag=Link-4.0

depends=(
  alsa-lib aubio libsndfile systemd-libs which
  ruby ruby-racc
  # devendored ruby gems
  'ruby-concurrent>=1.3.5' 'ruby-i18n>=1.14.7' 'ruby-kramdown>=2.1.0'
  'ruby-memoist>=0.16.2' 'ruby-multi_json>=1.9.2' 'ruby-rugged>=1.9.0'
  'ruby-tomlrb>=2.0.0' 'ruby-tzinfo>=2.0.6' 'ruby-wavefile>=0.8.1'
  # GUI
  qscintilla-qt6 qt6-base qt6-svg
)
makedepends=(
  'ruby-gettext>=3.4.4'  # devendored, build-time only
  asio cmake gendesk chrpath pkgconf qt6-tools rust
  ruby-erb ruby-prime ruby-rexml
)
checkdepends=(ruby-rake ruby-mocha ruby-minitest)
optdepends=(
  'sox: audio processing and sample manipulation'
  'libpipewire: native PipeWire audio backend (must be installed before building if you want pipewire features)'
  'qt6-wayland: window decorations under wlr-based Wayland compositors'
)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/sonic-pi-net/$pkgname/archive/refs/tags/v$pkgver.tar.gz
  supersonic-$_supersonic_commit.tar.gz::https://github.com/samaaron/supersonic/archive/$_supersonic_commit.tar.gz
  ableton-link-$_link_tag.tar.gz::https://github.com/Ableton/link/archive/refs/tags/$_link_tag.tar.gz
)
sha512sums=(
  'f40614cc5b6373362f13eefb5b7155ef21e30818fa81ef3f0f76348f4abe71a33524ae79e192976f583ac325a6cc52e33703e18cd4922c9ab0996c90b40a9a7b'
  'f65913049a86969af68afc70761a8f5a3fbd9c1a4034be1587f2765f4ca46039d48e308b1669a19d5234248c951ce3d5fc5477c6fc7d26379d37bb8281170264'
  '4fd4846f907afc94694922c1171ae7016541425dca6f74b43455c600ffc4d2513a06fb09f1d589af43a8b56d11129d93e42f37e9eeeca5b05734188256a24077'
)

# SonicPi::Paths resolves the root as app/server/ruby/../../.. and the GUI is told via
# -DSONIC_PI_INSTALL_ROOT
_installroot=/usr/lib/$pkgname

prepare() {
  export CARGO_HOME="$srcdir/cargo-home"

  cd $pkgname-$pkgver

  gendesk -f -n \
          --pkgname $pkgname \
          --pkgdesc "$pkgdesc" \
          --name "Sonic Pi" \
          --categories "AudioVideo;Audio"

  printf 'Placing the SuperSonic submodule\n'
  rmdir app/external/supersonic
  mv "$srcdir/supersonic-$_supersonic_commit" app/external/supersonic

  printf 'Placing Ableton Link\n'
  mv "$srcdir/link-$_link_tag" "$srcdir/link"

  printf 'Using the system asio rather than Link asio-standalone submodule\n'
  sed -i 's|${PATH_TO_LINK}/modules/asio-standalone/asio/include|/usr/include|' \
    "$srcdir/link/cmake_include/ConfigureAsioStandalone.cmake"

  # FETCHCONTENT_SOURCE_DIR_* makes FetchContent treat the directory as already
  # populated, which also skips its PATCH_COMMAND. Apply SuperSonic's four Link
  # patches here instead, reusing upstream's own idempotent apply script so the
  # patch list stays single-sourced.
  printf 'Applying SuperSonic Link patches\n'
  local _ssext="$srcdir/$pkgname-$pkgver/app/external/supersonic/external"
  cd "$srcdir/link"
  cmake -DLINK_PATCH_DIR="$_ssext" -P "$_ssext/apply-link-patches.cmake"
  cd "$srcdir/$pkgname-$pkgver"

  printf 'Removing vendored test packages\n'
  sed -i '/add_subdirectory(api-tests)/d' app/CMakeLists.txt

  # Devendor the gems that Arch packages. What's left:
  # ruby-beautify 0.92.2 - not packaged for arch
  # titleize - ancient, not worth devendoring as it's effectively static
  printf 'Removing devendored and test-only gems\n'
  rm -rvf app/server/ruby/vendor/{concurrent-ruby,i18n,kramdown,memoist}-*
  rm -rvf app/server/ruby/vendor/{rugged,tomlrb,tzinfo,wavefile}-*
  rm -rvf app/server/ruby/vendor/multi_json
  rm -rvf app/server/ruby/vendor/{gettext,locale,text}-*
  rm -rvf app/server/ruby/vendor/blankslate
  rm -rvf app/server/ruby/vendor/rouge
  rm -rvf app/server/ruby/vendor/{minitest,mocha,metaclass}-*

  printf 'Translating tutorial\n'
  ruby app/server/ruby/bin/i18n-tool.rb -t

  printf 'Generating docs for the Qt GUI\n'
  cp app/gui/utils/ruby_help.tmpl app/gui/utils/ruby_help.h
  ruby app/server/ruby/bin/qt-doc.rb

  printf 'Fetching rust crates\n'
  cd app/external/supersonic/rust
  cargo fetch --locked
}

build() {
  export CARGO_HOME="$srcdir/cargo-home"
  # rustc bakes absolute crate paths into panic messages, which would otherwise
  # leave references to $srcdir (the cargo cache) in the engine binary.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=/usr/src/$pkgname"

  cd $pkgname-$pkgver

  cmake -S app -B app/build -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSONIC_PI_INSTALL_ROOT="$_installroot" \
    -DQSCINTILLA_ROOT=/usr/include/qt6 \
    -DKISSFFT_STATIC=ON \
    -DSUPERSONIC_SYSTEM_SNDFILE=ON \
    -DSUPERSONIC_CARGO_OFFLINE=ON \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_ABLETONLINK="$srcdir/link"

  cmake --build app/build
}

check() {
  cd "$pkgname-$pkgver"
  cd app/server/ruby
  rake test
}

package() {
  cd $pkgname-$pkgver

  local _root="$pkgdir$_installroot"

  install -vDm755 app/build/gui/$pkgname "$pkgdir/usr/bin/$pkgname"

  install -vDm644 VERSION -t "$_root/"

  install -vd "$_root/app/gui"
  cp -av app/gui/theme "$_root/app/gui/"

  # Ruby server
  install -vd "$_root/app/server"
  cp -av app/server/ruby "$_root/app/server/"

  # Strip build-only files (Rakefile, extconf.rb, and any native-extension
  # artifacts) that have no business in an installed tree
  find "$_root/app/server/ruby" -type f \
    \( -name '*.o' -o -name '*.so' -o -name '*.c' -o -name '*.h' \
       -o -name 'Rakefile' -o -name 'Makefile' -o -name 'extconf.rb' \) -delete
  find "$_root/app/server/ruby" -type d -empty -delete

  # Native helpers built above
  install -vDm755 app/server/native/sonic-pi-supersonic -t "$_root/app/server/native/"
  install -vDm755 app/server/native/aubio_onset -t "$_root/app/server/native/"
  install -vDm644 app/server/native/piano_wavetable.dat -t "$_root/app/server/native/"

  # etc/ holds the samples, synthdefs, snippets, examples, quickstart cards and
  # generated documentation the server and GUI read at runtime. Keep it in
  # /usr/share and point the install root at it
  install -vd "$pkgdir/usr/share/$pkgname"
  cp -av etc/. "$pkgdir/usr/share/$pkgname/"
  ln -svf ../../share/$pkgname "$_root/etc"

  # xdg
  install -vDm644 $pkgname.desktop -t "$pkgdir/usr/share/applications/"
  install -vDm644 app/gui/images/icon-smaller.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # man page
  install -vDm644 packaging/debian/$pkgname.1 -t "$pkgdir/usr/share/man/man1/"

  # docs
  install -vd "$pkgdir/usr/share/doc/$pkgname"
  ln -svf ../../$pkgname/examples "$pkgdir/usr/share/doc/$pkgname/examples"
  ln -svf ../../$pkgname/doc/tutorial "$pkgdir/usr/share/doc/$pkgname/tutorial"
  ln -svf ../../$pkgname/doc/cheatsheets "$pkgdir/usr/share/doc/$pkgname/cheatsheets"

  # license
  install -vDm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm644 app/external/supersonic/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.supersonic"

  # fix /build path vulnerability
  chrpath -d "$pkgdir/usr/bin/$pkgname"
}
