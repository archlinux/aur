# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge
pkgver=3.0.0
pkgrel=2
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux"
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'boost'  'libxcb' 'lib32-boost-libs>=1.72.0' 'lib32-libxcb')
optdepends=('yabridgectl: utility for setting up and managing yabridge')
makedepends=('meson' 'ninja')
options=('!strip')
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/archive/$pkgver.tar.gz")
sha256sums=('693bc7b2650bc6fc59fa95a724b2cc41e2b26e94614a2d3b0ce53454e411f58d')

build() {
  cd "$pkgname-$pkgver"

  # TODO: Once this has been fixed upstream, we can remove the warning again
  wine_version=$(wine --version | grep --only-matching -E '[0-9]+\.[0-9.]+' | head -n1)
  if [[ $wine_version == 6.2* ]]; then
    echo "#"
    echo "# WARNING: Wine 6.2 has a regression that will cause build errors when"
    echo "#          compiling yabridge because the headers are no longer valid in"
    echo "#          C++. The build will likely fail. Either temporarily downgrade"
    echo "#          to a Wine 6.1 version or use the 'yabridge-bin' AUR package"
    echo "#          instead until this is fixed."
    echo "#"
    echo "#          Continuing in five seconds..."
    echo "#"

    # Or else the message will be very easy to miss
    sleep 5
  fi

  # Meson won't apply any new options or update wraps if they already exist, so
  # if we're building from a dirty src/ directory we'll just nuke any cached
  # files
  if [[ -d build ]]; then
    rm -rf build

    # Can't use `git clean` here since the entire src/ directory will be
    # gitignored
    find ./subprojects -mindepth 1 -maxdepth 1 -type d -exec rm -rf '{}' ';'
  fi

  # If you don't want to build lib32-boost-libs and you don't need the 32-bit
  # bitbridge, then you can leave out the dependency for it and set the
  # `use-bitbridge` option to false.
  # You can also add `-Dwith-vst3=false` to disable building with VST3 support.
  # If building takes up too much RAM then you can decrease the unity size or
  # completely disable unity builds.
  meson setup \
    --cross-file cross-wine.conf \
    --buildtype=release \
    --unity=on \
    --unity-size=1000 \
    -Dwith-bitbridge=true \
    build

  # The unity build takes can take up to 2 GB of RAM per target, so if the
  # system does not have enough RAM to build everything at once we'll limit the
  # number of concurrent jobs
  total_memory=$(free --gibi --si | awk '/^Mem:/ { print $2 }')
  if [ "$total_memory" -le 4 ]; then
    echo -e "\n$total_memory gigabytes of RAM detected, limiting the number of build jobs to 1\n"
    ninja -C build -j1
  elif [ "$total_memory" -le 8 ]; then
    echo -e "\n$total_memory gigabytes of RAM detected, limiting the number of build jobs to 3\n"
    ninja -C build -j3
  else
    ninja -C build
  fi
}

package() {
  cd "$pkgname-$pkgver/build"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}.exe{,.so} "${pkgdir}"/usr/bin
  install yabridge-{host,group}-32.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge-{vst2,vst3}.so "${pkgdir}"/usr/lib
}

# vim:set ts=2 sw=2 et:
