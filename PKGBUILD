# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge
pkgver=3.6.0
pkgrel=3
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux"
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'boost'  'libxcb' 'lib32-boost-libs>=1.72.0' 'lib32-libxcb')
optdepends=('yabridgectl: utility for setting up and managing yabridge')
makedepends=('git' 'meson' 'ninja')
options=('!strip')
install=yabridge.install
source=("https://github.com/robbert-vdh/yabridge/archive/$pkgver.tar.gz"
        "wine-6.20-hotfix.patch::https://github.com/robbert-vdh/yabridge/commit/5be149cb525a638f7fc3adf84918c8239ee50ecf.patch")
sha256sums=('6da519d47477ac8e2ab297eb6bc1513cd33dc736660a3b9a9449e14efdf2b3a2'
            '4d32132d7305b70ac8e62530c8440b8c720875e4ff6e2a5e1171092d01d6225a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch --strip=1 --input="$srcdir/wine-6.20-hotfix.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Make sure all of our wraps are up to date because Meson won't update
  # wrap subprojects that already exist
  meson subprojects download
  meson subprojects update
  meson subprojects packagefiles --apply

  # If you don't want to build lib32-boost-libs and you don't need the 32-bit
  # bitbridge, then you can leave out the dependency for it and set the
  # `use-bitbridge` option to false.
  # You can also add `-Dwith-vst3=false` to disable building with VST3 support.
  # If building takes up too much RAM then you can decrease the unity size or
  # completely disable unity builds.
  meson setup \
    build \
    --cross-file cross-wine.conf \
    --buildtype=release \
    --unity=on \
    --unity-size=1000 \
    -Dwith-bitbridge=true

  # The unity build takes can take up to 2 GB of RAM per target, so if the
  # system does not have enough RAM to build everything at once we'll limit the
  # number of concurrent jobs
  #
  # NOTE: The `LANG=C` is needed because apparently the `pt_BR.UTF-8` locale
  #       changes `Mem:` to `Mem.:`, so who knows what other locales might do
  total_memory=$(env LANG=C free --gibi --si | awk '/^Mem:/ { print $2 }')
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
  cd "$srcdir/$pkgname-$pkgver/build"

  install -dm755 "${pkgdir}"/usr/bin
  install yabridge-{host,group}.exe{,.so} "${pkgdir}"/usr/bin
  install yabridge-{host,group}-32.exe{,.so} "${pkgdir}"/usr/bin

  install -dm755 "${pkgdir}"/usr/lib
  install libyabridge-{vst2,vst3}.so "${pkgdir}"/usr/lib
}
