# Maintainer: furudbat <hircreacc@gmail.com>

## options
: "${_with_audio:=false}" # audio visualizer (PipeWire + fftw), beta

pkgname="wpets"
pkgver=6.2.1
pkgrel=1
pkgdesc="A Wayland overlay that displays an animated virtual pet reacting to keyboard input"
url='https://github.com/furudbat/wayland-vpets'
license=('MIT' 'CC-BY-NC-4.0') # code: MIT, PMD sprites: CC-BY-NC-4.0
arch=('x86_64' 'aarch64')

depends=(
  'systemd-libs' # libudev
  'wayland'
  #'glibc'
  #'libstdc++'
  #'bash'
)
makedepends=(
  'cmake'
  'pandoc' # to generate manpages
)

if [[ "${_with_audio::1}" == "t" ]]; then
  depends+=('fftw' 'libpipewire')
fi

_pkgsrc="wayland-vpets-$pkgver"
source=("$_pkgsrc.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('25c19b5e8ab57125ae979cee8870034a90494cad0cf121502ca281d54050f0b4')

build() {
  # map $srcdir in __FILE__ strings like makepkg's debug option does (no $srcdir refs)
  export CFLAGS+=" -ffile-prefix-map=$srcdir=${DBGSRCDIR:-/usr/src/debug}/$pkgbase"
  export CXXFLAGS+=" -ffile-prefix-map=$srcdir=${DBGSRCDIR:-/usr/src/debug}/$pkgbase"

  local _cmake_args=(
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX=/usr
    -DFEATURE_LAZY_LOAD_ASSETS=ON
    -DFEATURE_MULTI_VERSIONS=ON
    -DSKIP_CPM=ON
    -DGENERATE_PROTOCOLS=OFF
    -DBONGOCAT_REQUIRE_MANPAGES=ON
    -Wno-author
  )
  local _targets=(
    bongocat bongocat-dm bongocat-ms-agent bongocat-pkmn bongocat-all manpages
  )

  if [[ "${_with_audio::1}" == "t" ]]; then
    _cmake_args+=(-DENABLE_AUDIO_MODULE=ON)
  fi

  if ((CHECKFUNC)); then
    _cmake_args+=(-DBUILD_TESTING=ON)
    _targets+=(bongocat_tests)
  else
    _cmake_args+=(-DBUILD_TESTING=OFF)
  fi

  cmake -S "$_pkgsrc" -B build "${_cmake_args[@]}"
  cmake --build build --target "${_targets[@]}"
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  # binaries
  install -Dm755 build/bongocat "$pkgdir/usr/bin/wpets"
  install -Dm755 build/bongocat-dm "$pkgdir/usr/bin/wpets-dm"
  install -Dm755 build/bongocat-ms-agent "$pkgdir/usr/bin/wpets-ms-agent"
  install -Dm755 build/bongocat-pkmn "$pkgdir/usr/bin/wpets-pkmn"
  install -Dm755 build/bongocat-all "$pkgdir/usr/bin/wpets-all"
  install -Dm755 "$_pkgsrc/scripts/find_input_devices.sh" "$pkgdir/usr/bin/wpets-find-devices"

  # man pages
  install -Dm644 build/bongocat.1 "$pkgdir/usr/share/man/man1/wpets.1"
  install -Dm644 build/bongocat-dm.1 "$pkgdir/usr/share/man/man1/wpets-dm.1"
  install -Dm644 build/bongocat-ms-agent.1 "$pkgdir/usr/share/man/man1/wpets-ms-agent.1"
  install -Dm644 build/bongocat-pkmn.1 "$pkgdir/usr/share/man/man1/wpets-pkmn.1"
  install -Dm644 build/bongocat-all.1 "$pkgdir/usr/share/man/man1/wpets-all.1"
  install -Dm644 build/bongocat-find-devices.1 "$pkgdir/usr/share/man/man1/wpets-find-devices.1"
  install -Dm644 build/bongocat.conf.5 "$pkgdir/usr/share/man/man5/wpets.5"
  install -Dm644 build/bongocat-dm.conf.5 "$pkgdir/usr/share/man/man5/wpets-dm.5"
  install -Dm644 build/bongocat-ms-agent.conf.5 "$pkgdir/usr/share/man/man5/wpets-ms-agent.5"
  install -Dm644 build/bongocat-pkmn.conf.5 "$pkgdir/usr/share/man/man5/wpets-pkmn.5"
  install -Dm644 build/bongocat-all.conf.5 "$pkgdir/usr/share/man/man5/wpets-all.5"

  # example configs
  install -Dm644 "$_pkgsrc/bongocat.conf.example" "$pkgdir/usr/share/wpets/bongocat.conf.example"
  local _conf
  for _conf in clippy digimon pokemon cpu-digimon evol-digimon moving-digimon neko; do
    install -Dm644 "$_pkgsrc/examples/$_conf.bongocat.conf" \
      "$pkgdir/usr/share/wpets/$_conf.bongocat.conf.example"
  done

  # docs & license
  install -Dm644 "$_pkgsrc/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_pkgsrc/assets/COPYRIGHT.md" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_pkgsrc/assets/pmd/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pmd"
  install -Dm644 "$_pkgsrc/assets/PMD_CREDITS.txt" "$pkgdir/usr/share/licenses/$pkgname/PMD_CREDITS.txt"
}
