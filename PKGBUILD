# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Frederick Gnodtke <frederick@gnodtke.net>

pkgname=onivim2
pkgver=0.5.3
pkgrel=1
pkgdesc='Native, lightweight modal code editor'
arch=('any')
url='https://github.com/onivim/oni2'
license=('custom:OutrunLabsEULA')
makedepends=('esy' 'ragel' 'nodejs' 'wget' 'bzip2' 'fontconfig' 'fuse2' 'glu' 'gtk3' 'harfbuzz'
              'libglvnd' 'libice' 'libpng' 'libsm' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama'
              'libxrandr' 'libxt' 'libxxf86vm' 'm4' 'nasm' 'python2' 'clang' 'node-gyp')
options=('!strip')
install='onivim2.install'
source=("https://github.com/onivim/oni2/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        onivim2.install)
b2sums=('dceadfc79cc5968957ee3bd94471f0e568d33d7f3bc6318c3925bb659d91743f5be3f90df78e289364fcaa3d990443de2275d9f9475bb98f256aec1235015745'
        'd6e0ad8b9755f1e809d5ffc0a23a5f53455468cfed80a2946f9a1901cc3b31b79250b1b418f6cfffe6f14a521f0eaef3370f06e1babeafb84358e7906becbc44')

# set ESY__PREFIX to avoid 5G of dependency cache ending up in ~/.esy
build() {
  cd oni2-${pkgver}
  export ESY__PREFIX="${srcdir}"/esy_cache
  node install-node-deps.js
  esy install
  esy bootstrap
  esy build
  esy '@release' install
  esy '@release' run -f --checkhealth
  esy '@release' create
}

check() {
  cd oni2-${pkgver}
  export ESY__PREFIX="${srcdir}"/esy_cache
  esy '@bench' install
  esy '@bench' build
  esy '@bench' run
}

package() {
  install -dm755 "${pkgdir}"/opt/onivim2
  install -dm755 "${pkgdir}"/usr/bin/
  install -Dm644 oni2-${pkgver}/Outrun-Labs-EULA-v1.1.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt

  cd oni2-${pkgver}/_release/
  install -Dm644 Onivim2.AppDir/Onivim2.desktop "${pkgdir}"/usr/share/applications/Onivim2.desktop
  install -Dm644 Onivim2.AppDir/Onivim2.png "${pkgdir}"/usr/share/pixmaps/Onivim2.png
  cp -Lr Onivim2.AppDir/{AppRun,usr} "${pkgdir}"/opt/onivim2
  cp -r $(find "${srcdir}"/esy_cache -type d -path '*i/*camomile-opam*/share/camomile') "${pkgdir}"/opt/onivim2/usr/share
  ln -s /opt/onivim2/AppRun "${pkgdir}"/usr/bin/Oni2
  # fix permissions
  find "${pkgdir}" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}"/opt/onivim2/AppRun \
    "${pkgdir}"/opt/onivim2/usr/bin/{Oni2*,node,rg,rls} \
    "${pkgdir}"/opt/onivim2/usr/lib/*
}
