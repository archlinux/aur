# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Anatol Pomozov
# Contributor: Abdelhak Bougouffa <abougouffa@fedoraproject.org>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dsview-git
pkgver=1.3.2.r53.g2e9e2c8
pkgrel=20
pkgdesc='GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc.'
arch=($CARCH)
url='http://www.dreamsourcelab.com/'
license=('GPL-3.0-only')
provides=(
  ${pkgname%-git}
  ${pkgname%-git}-cli
)
conflicts=(
  ${pkgname%-git}
  ${pkgname%-git}-cli
)
replaces=()
# Upstream added VCS dependency to libsigrokdecode :/
_qt=qt6
depends=(
  hicolor-icon-theme
  glib2
  libgcc
  libstdc++
  libusb
  libz.so
  ${_qt}-base
  fftw
  python
  # AUR
  python-mcp
  python-toon
)
makedepends=(
  boost
  boost-libs
  cmake
  git
  ${_qt}-tools
  ninja
  pkgconf
)
source=("${pkgname}::git+https://github.com/DreamSourceLab/DSView.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}"/${pkgname}/

  # Add some new decoders from sigrok # 539
  # git cherry-pick -n 8bc228ebb58ea709e981287a57a0864f914fb4e0
  # git cherry-pick -n 93d7e092473deeaee12c1b840faea21a2248ab9c
  git cherry-pick -n 625e61480f400a92a0fa912e96de979f4bbd6f15
  # git cherry-pick -n 882369cf47f9c0d18ee32590047c4f1f38e3920c
  git cherry-pick -n f5489661320e19cc1640a3dfb293f55b7a9d594e
  git cherry-pick -n c654ed0f32c1fdaea84781bc2c3a70039596c789
  git cherry-pick -n 5a5476ec01648d4949c961f64d510496e76fbeac
  git cherry-pick -n 1e944be1ea04edacf743226f9a50c6c1a243d60c
  git cherry-pick -n c7652158083a4991d3ed085e76bbdfced3fc2515
  git cherry-pick -n e244c18df7de6a5479ab48facb53551874edc64f
  git cherry-pick -n c2ed14e7dbe2107bae0fe7962660c6c0efb619ca
  git cherry-pick -n 9fd93d57d3371bce4a946bced25db8dc3bda5f37
  # git cherry-pick -n 451790eb34c707ce3b2b24e8fb0b8431910013cb
  git cherry-pick -n 691401cdcb4bb3ee7089f18459a723e40a177a2e
  git cherry-pick -n 369f8c288c6bfee7182e4affe3faebb2e51c4cef
  git cherry-pick -n 79a1bb503503fdc596746fcc03159baed28e8675
  # git cherry-pick -n 50ac697b89e3742be503190c290dedbc24cfdb76
  git cherry-pick -n 2871e021ecff4b5e5e6e01ad6b3c887c50bf35b1
  git cherry-pick -n e16012a4118152fe28279433a63e3a0c31224937
  git cherry-pick -n 391dcb75fbd23a3c7e3bd278202e9880ddfcdc37
  git cherry-pick -n 17abc963bfa339488fed634541e11831474f276a
  git cherry-pick -n e27ab19bf5555dc7828ed072e54ae8d18bc4635f
  git cherry-pick -n d27025e5a5e706acac6bfa76963c86206bdb4fdf
  git cherry-pick -n 79dd96659a4c3bcd11e23661c2bb0fcc501cf397
  # git cherry-pick -n e5d9b5aa1c1b66c27d2c09f3eed9d7e32cfc4673
  git cherry-pick -n 12205aecd7851d71d72ef84ee999e19fa7025e61
  git cherry-pick -n 09cf6d7eb18594c817560ca13f1f0c360b1b26d3
  # git cherry-pick -n b47fa89e1803c2ae4362858b352bacfde269408e
  # git cherry-pick -n 0c38af0de75faf08ddb39207d37d0758f8b87fac
  git cherry-pick -n 7c9a11f316b33adcb879e59a8f22078192a95553
  git cherry-pick -n 6d9661f1eff62b54347e41ea22209aa8470dea1c
  # git cherry-pick -n acd5f6c7ab5bc9a131f131f2b0ff7b52afe0b253
  git cherry-pick -n 2dd49d275b1d1a71d201ffa3f9159ad7222016cf
  git cherry-pick -n 23c424cc7018203f79894f11024ec8ab5cd9b12e
  git cherry-pick -n 73d5188a54ae3f09b7522bba02252be4bdbda0a8
  git cherry-pick -n a01127c0269e80ed59dfcf8985907d6c5fa2f1f6
  git cherry-pick -n f5fa68ca96bac9256e3de156dcb2929b7b6a7a13
  # git cherry-pick -n 4c1d709b42ce43b722baf272df139e6a53bda7d5
  git cherry-pick -n f826edbc01ec9fdc258bb9f77c30404f7f112ef5
  git cherry-pick -n 3921a7bd02ffd7b373b5bd9a83ff16d48352d151
  git cherry-pick -n 8aaaa42fbf879d8f2e85a6d23a67d87af7492fd8
  git cherry-pick -n 9adb12689986fba98493719be1f3d86d01f820e7

  # Decoder jtag: append to list in constant time 511
  git cherry-pick -n d71a1acb4f34ce8d65e8ae6c644e4de746e4a2de

  # DSView is now the default app for .dsl files and added to 'Open With' #753
  git cherry-pick -n 6a10c7c6600267d5e8b3b9a9d2e691288ae8379a
  git cherry-pick -n c27f1ecf641e8daa49b84a38a648f7bb9a55929e

  # 修复 Arch Linux 下 dsview 编译报错 #826 
  git cherry-pick -n 80fd274fb1b73a842499a115f1672fcbb792c9d0
  git cherry-pick -n fa25478f206fd95108ce57983905b555e24d2b01

  # update zh #828
  git cherry-pick -n 502a418a4a301d1e9e41b23955d3a9179dac3b35
  
  # Small style tweaks to improve usability #844
  git cherry-pick -n ddfd45f2e4e93ab237e5cba7773fa6f5428fc5fd
  git cherry-pick -n 15d25dbb0c65978e6a3c5742449b19aa736e9a62
  git cherry-pick -n c9fb9a24721ab0ecee853d513c038e0516061572
  git cherry-pick -n 126b24c55fa325968abf81fdc3a35c3a66afe9ee

  # Add manual setting for external clock frequency #845
  git cherry-pick -n 91f687eb264640cf212a12dac1cd94fec5f6fc91

  # Glitch Filter for 1:I2C decoder #853
  git cherry-pick -n 9934143da49a1b669ae458c451e53f239b1c5c08
  git cherry-pick -n 5aa0b9de18342fc46e42edc691891eca7af503cb

  # fix: make project buildable with CMake 4+ #886
  git cherry-pick -n cdf3f540bc33ad46d8c47e8d0941db34a218df33

  # Packaging, CLI and MCP agent #899
  git cherry-pick -n bfa6c18cb4abbc738c2e7b7a44e5b29d11fbed6f
  git cherry-pick -n 99fdabea60ef693ae8e6cd4d6d25af0f36a7de2b
  git cherry-pick -n 89b7c7116620cc83ef020f5c4526831b5e5a5e2c
  git cherry-pick -n 20211d86a7d8e66c72e02d5f59f2cd217f6a7666

  # Fix window drag on Wayland #902
  # git cherry-pick -n c9aeded7d621264c82b7646ed34c04697812e2cd

  # Fix app icon missing from taskbar on Wayland (e.g. COSMIC) #903
  # git cherry-pick -n cc40353007053654200acccdfbecaadba08b8cdc

  # feat: zoom waveform with [/], fit view with F #908
  git cherry-pick -n b0abecd2e6ce8fad2e6c8a671d38793681d220cd
  
  sed -i 's#MODE="0666"#TAG+="uaccess"#' DSView/DreamSourceLab.rules
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  export LDFLAGS+=" ${LDFLAGS}"
  cd "${srcdir}"/${pkgname}/

  # see：https://wiki.archlinux.org/title/CMake_package_guidelines
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -Wno-author \
    -B build \
    -G Ninja

  ninja -C build
}

check() {
  cd "${srcdir}"/${pkgname}/
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
  install -Dm0644 "${srcdir}/${pkgname}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
