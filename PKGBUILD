# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: meanlint <meanlint@outlook.com>
pkgname=xivlauncher-cn-dirty-git
pkgver=r284.2267.fa27fb0.803e8edd
pkgrel=1
pkgdesc="Custom Launcher for Final Fantasy XIV Online CN"
arch=('x86_64')
url='https://github.com/ottercorp/XIVLauncher.Core'
license=('GPL')
depends=(
  'aria2'
  'sdl2'
  'lib32-sdl2'
  'libsecret'
  'attr'
  'lib32-attr'
  'fontconfig'
  'lib32-fontconfig'
  'lcms2'
  'lib32-lcms2'
  'libxml2'
  'lib32-libxml2'
  'libxcursor'
  'lib32-libxcursor'
  'libxrandr'
  'lib32-libxrandr'
  'libxdamage'
  'lib32-libxdamage'
  'libxi'
  'lib32-libxi'
  'gettext'
  'lib32-gettext'
  'freetype2'
  'lib32-freetype2'
  'glu'
  'lib32-glu'
  'libsm'
  'lib32-libsm'
  'gcc-libs'
  'lib32-gcc-libs'
  'libpcap'
  'lib32-libpcap'
  'faudio'
  'lib32-faudio'
  'desktop-file-utils'
  'jxrlib'
)
makedepends=('dotnet-sdk>=6' 'python-yaml')
options=('!strip')
provides=("xivlauncher")
conflicts=("xivlauncher")
source=(
  "XIVLauncher.Core::git+${url}.git"
  "FFXIVQuickLauncher::git+https://github.com/ottercorp/FFXIVQuickLauncher.git"
  "XIVLauncher.desktop"
)
sha512sums=(
  'SKIP'
  'SKIP'
  '6c9a1f783969f293c07f06d167ab830f77ddaffdd8ce1df5f4e736056bd7c10c169c8c2411499493fb39659ca10643590998fccdaf4978dacb671ecfa2872949'
)

prepare() {
  rm -rf "${srcdir}/XIVLauncher.Core/lib/FFXIVQuickLauncher"
  mkdir -p "${srcdir}/XIVLauncher.Core/lib"
  mv "${srcdir}/FFXIVQuickLauncher" "${srcdir}/XIVLauncher.Core/lib/"
}

pkgver() {
  cd "${srcdir}/XIVLauncher.Core/lib/FFXIVQuickLauncher"
  local _ver="$(git rev-list --count HEAD)"
  local _hash="$(git rev-parse --short HEAD)"
  cd "${srcdir}/XIVLauncher.Core"
  echo "r$(git rev-list --count HEAD).${_ver}.$(git rev-parse --short HEAD).${_hash}"
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/XIVLauncher.Core/src/XIVLauncher.Core/"
  dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release -p:DefineConstants=WINE_XIV_ARCH_LINUX
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/opt/XIVLauncher/"
  install -Dm644 "${srcdir}/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher.desktop"
  install -Dm644 "${srcdir}/XIVLauncher.Core/misc/linux_distrib/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
  cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
  ln -sr "${pkgdir}/opt/XIVLauncher/XIVLauncher.Core" "${pkgdir}/usr/bin/XIVLauncher.Core"
}
