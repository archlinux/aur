# Maintainer: anonimal <anonimal at i2pmail dot org>
# Contributor: redfish <redfish at galactica dot pw>
# Contributor: Onishin <onishin at onishin dot org>

pkgbase=('monero')
pkgname=('monero' 'libmonero-wallet')
pkgver=0.11.1.0
pkgrel=2
pkgdesc="Monero: the secure, private, untraceable currency - release version (includes daemon, wallet and miner)"
license=('custom:Cryptonote')
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://getmonero.org/"
depends=('boost-libs' 'unbound' 'miniupnpc' 'libunwind' 'openssl')
makedepends=('git' 'cmake' 'boost' 'gtest')
provides=('monero' 'libmonero-wallet')
conflicts=('bitmonero-git' 'libmonero-wallet-git')

source=("https://github.com/monero-project/monero/archive/v${pkgver}.tar.gz"
        "monerod.service")

sha256sums+=('b5b48d3e5317c599e1499278580e9a6ba3afc3536f4064fcf7b20840066a509b'
             '59fc670cf92960832d03038968270f81beacea7d6819c71ec5bcf15c6030e3c9')

_monero="${pkgbase}-${pkgver}"
_build=build

build() {
  cd "${srcdir}/${_monero}"
  if check_option "debug" "y"
  then
    _build_type="Debug"
  else
    _build_type+="Release"
  fi
  CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=$_build_type "
  CMAKE_FLAGS+=" -DCMAKE_INSTALL_PREFIX=/usr "
  CMAKE_FLAGS+=" -DBUILD_TESTS=ON "
  CMAKE_FLAGS+=" -DBUILD_GUI_DEPS=ON "
  CMAKE_FLAGS+=" -Wno-dev " # silence warnings for devs
  CMAKE_FLAGS+=" -DCMAKE_LINKER=/usr/bin/ld.gold " # #974 ld segfault on ARM
  mkdir -p $_build && cd $_build
  cmake $CMAKE_FLAGS ../
  make
}

check() {
  cd "$srcdir/$_monero"
  cd build

  # Temporarily disable some a tests:
  #  * coretests takes too long (~25000s)
  #  * libwallet_api_tests fail (Issue #895)
  #  * unit_tests were run separately above
  CTEST_ARGS+="-E 'coretests|libwallet_api_tests|unit_tests'"
  echo ">>> NOTE: some tests excluded: $CTEST_ARGS"

  make ARGS="$CTEST_ARGS" test
}

package_monero() {
  backup=('etc/monerod.conf')
  install=monero.install

  # Uncomment for a debug build
  # options=(!strip debug)

  install -Dm755 "${srcdir}/${_monero}/build/bin/monero-blockchain-export" "${pkgdir}/usr/bin/monero-blockchain-export"
  install -Dm755 "${srcdir}/${_monero}/build/bin/monero-blockchain-import" "${pkgdir}/usr/bin/monero-blockchain-import"
  install -Dm755 "${srcdir}/${_monero}/build/bin/monero-wallet-cli" "${pkgdir}/usr/bin/monero-wallet-cli"
  install -Dm755 "${srcdir}/${_monero}/build/bin/monerod" "${pkgdir}/usr/bin/monerod"

  install -Dm644 "${srcdir}/${_monero}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/${_monero}/utils/conf/monerod.conf" "${pkgdir}/etc/monerod.conf"
  # TODO(anonimal): new, working, systemd service file was not merged into monero branch v0.11.1.0 - so we've git-add'd it ourselves
  #install -Dm644 "${srcdir}/${_monero}/utils/systemd/monerod.service" "${pkgdir}/usr/lib/systemd/system/monerod.service"
  install -Dm644 "${srcdir}/monerod.service" "${pkgdir}/usr/lib/systemd/system/monerod.service"

}

package_libmonero-wallet() {
  # NOTE: this is crucial, otherwise stripping breaks the .a archive:
  # monero-core (GUI) fails to link against it (it can't find symbols
  # that are clearly in the library).
  options=(!strip)

  _stage_dir=stagedir

  cd "${srcdir}/${_monero}/${_build}"

  mkdir -p $_stage_dir
  make DESTDIR=$_stage_dir install

  cd $_stage_dir
  find usr/{include,lib} -type f -exec install -D -m 755 {} ${pkgdir}/{} \;
}
