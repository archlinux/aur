# Maintainer: Robbert van der Helm <mail@robbertvanderhelm.nl>

pkgname=yabridge-git
_pkgname=yabridge
pkgver=5.0.1.r16.g1f6b5a4a
pkgrel=1
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux"
arch=('x86_64')
url="https://github.com/robbert-vdh/yabridge"
license=('GPL3')
depends=('wine' 'libxcb' 'tomlplusplus')
makedepends=('git' 'meson' 'ninja' 'cmake' 'asio' 'bitsery' 'function2' 'lib32-libxcb')
optdepends=('yabridgectl: utility for setting up and managing yabridge')
provides=('yabridge')
conflicts=('yabridge')
install=yabridge.install
source=('git+https://github.com/robbert-vdh/yabridge')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  # Make sure all of our wraps are up to date because Meson won't update
  # wrap subprojects that already exist
  # XXX: These two commands will just error out for wrap-file wraps. Any file
  #      based wraps are manually versioned anyways so that should be fine.
  meson subprojects update --types git || true
  meson subprojects packagefiles --apply --types git || true

  # If you don't want to build lib32-boost-libs and you don't need the 32-bit
  # bitbridge, then you can leave out the dependency for it and set the
  # `use-bitbridge` option to false.
  # You can also add `-Dvst3=false` to disable building with VST3 support.  If
  # building takes up too much RAM then you can decrease the unity size or
  # completely disable unity builds.
  meson setup \
    build \
    --cross-file cross-wine.conf \
    --buildtype=release \
    --unity=on \
    --unity-size=1000 \
    -Dbitbridge=true

  # The unity build takes can take up to 2 GB of RAM per target, so if the
  # system does not have enough RAM to build everything at once we'll limit the
  # number of concurrent jobs
  # NOTE: The `LANG=C` is needed because apparently the `pt_BR.UTF-8` locale
  #       changes `Mem:` to `Mem.:`, so who knows what other locales might do
  total_memory=$(env LANG=C free --gibi --si | awk '/^Mem:/ { print $2 }')
  num_jobs=$((total_memory / 4))
  echo -e "\n$total_memory gigabytes of RAM detected, limiting the number of build jobs to $num_jobs\n"
  ninja -C build -j"$num_jobs"
}

package() {
  cd "$srcdir/$_pkgname/build"

  install -dm755 "$pkgdir/usr/bin"
  install yabridge-host{,-32}.exe{,.so} "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/lib"
  install libyabridge{,-chainloader}-{vst2,vst3,clap}.so "$pkgdir/usr/lib"
}
