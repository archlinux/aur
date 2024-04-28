# Maintainer: sawntoe <sawntoe@gmail.com>

pkgname='openarena-complete-git'
pkgver=0.8.8.r2441.74046d7a
pkgrel=1
makedepends=('git' 'make' 'grep' 'zip')
conflicts=('openarena' 'openarena-git')
provides=('openarena')
pkgdesc="A violent, sexy, multiplayer first person shooter based on the ioquake3 engine (binary package)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://openarena.ws/"
license=('GPL')
depends=('sdl' 'libvorbis' 'curl' 'libxmp')
optdepends=('openal: to silence SDL fallback warning')
source=('git+https://github.com/OpenArena/engine.git'
        'git+https://github.com/OpenArena/gamecode.git'
        'git+https://github.com/sawntoe/openarena-svn.git'
        'build_deterministic_assets.sh'
        'openarena-runner.sh'
        'openarena.png'
        'openarena-server.png'
        'openarena.desktop'
        'openarena-server.desktop')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '39028fa5225328aef4e72f0e5b970374fa9983120e5fa1668c68da8282abf5af93be6283085f980e3f3ac8f868a3ca758fd9b69b36227047de28bbce868500e9'
            '3ea0d57070ba9e6652d704639823d4bcf9f1aa031836634d9418774392b69178ecc460284ed3e42668d968e3608d28545490f0f8763e6dc72015849d619a753b'
            'ef68f8eb6251c3424464702ff894a6b88b473a3f4c1512af613125f5e5a7124f268490a9f6042095ff5bb807817e1f302c80d21987a2ed178e680f993d70b6f1'
            '9e8c860fe8e9a6fefa9839907df6e74f11564daaa2bf12b4c261dec34d65917e7110a41aa7777f16d3842c8371b9e960468d75c439d8b815454feeb8c01ed6e6'
            '5acd934f451559ad68b76a4de4b132b9ead9542dd078df7c7489ce2b2774557d81c6405622e8090ced2ace5f05165af1ed5dee8674d3fef725cd633727c92538'
            '426734a1517802b00b062006fcac4e321b4bf2fa8f3a3f7670a11ae62cf6cdd417bd158d0d613c0017e44e5a9528d72ef77e383a4fda2b230f0cc0f8ef9185d1')


pkgver() {
  cd "${srcdir}/engine"
  echo -n "0.8.8.r" && git rev-list --count HEAD | sed -z 's/\n//g' && echo -n "." && git describe --always
}

prepare() {
  # add aarch64 if missing
  cd "${srcdir}/engine"
}

build() {
  cd "${srcdir}/engine"
  # add aarch64 if not in source
  if [ $(uname -m) == 'aarch64' ]; then
    if grep -qF "aarch64" code/qcommon/q_platform.h; then
      echo "Code has aarch64!"
    else
      echo "Give code aarch64!"
      sed -i 's/arm/aarch64/g' code/qcommon/q_platform.h
    fi
  fi
  unset CARCH CHOST CFLAGS CXXFLAGS LDFLAGS LTOFLAGS RUSTFLAGS DEBUG_CFLAGS DEBUG_CXXFLAGS DEBUG_RUSTFLAGS
  make
  cd "${srcdir}/gamecode"
  if [ $(uname -m) == 'aarch64' ]; then
    if grep -qF "aarch64" code/qcommon/q_platform.h; then
      echo "Code has aarch64!"
    else
      echo "Give code aarch64!"
      sed -i 's/arm/aarch64/g' code/qcommon/q_platform.h
    fi
  fi
  sed -i '/#define OS_STRING "linux"/a #define ARCH_STRING '"$(uname -m)" code/qcommon/q_platform.h
  make 
  cd "${srcdir}/openarena-svn"
  chmod +x "${srcdir}/build_deterministic_assets.sh"
  "${srcdir}/build_deterministic_assets.sh"
  
  }

package() {
  # create dirs
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" "$pkgdir"/usr/share/pixmaps/ "$pkgdir"/usr/share/applications/ "$pkgdir"/usr/lib/openarena "$pkgdir"/usr/lib/openarena/uncut
  
  # copy zipfile to openarena
  mv "${srcdir}/engine/build/release-linux-$(uname -m)"/* "${pkgdir}/usr/lib/openarena"
  mv "${srcdir}/gamecode/build/release-linux-$(uname -m)"/oax "${pkgdir}/usr/lib/openarena"
  mv "${srcdir}/openarena-svn/build/pak"* "${pkgdir}/usr/lib/openarena/baseoa"
  mv "${srcdir}/openarena-svn/build/mp-pak0.pk3" "${pkgdir}/usr/lib/openarena/missionpack"
  mv "${srcdir}/openarena-svn/build/oax-pak0.pk3" "${pkgdir}/usr/lib/openarena/oax"
  mv "${srcdir}/openarena-svn/build/uncut.pk3" "${pkgdir}/usr/lib/openarena/uncut"

  find "${pkgdir}/usr/lib/openarena" -type f -exec chmod 644 {} \;
  chmod 755 "${pkgdir}/usr/lib/openarena/"o*.$(uname -m)
  find "${pkgdir}/usr/lib/openarena" -type d -exec chmod 755 {} \;

  # copy compiled files
  # install -Dm 755 "${pkgdir}"/o*.$(uname -m) "${pkgdir}/usr/lib/openarena"

  # create application-shortcuts
  install -Dm 644 "$srcdir"/openarena{,-server}.png "$pkgdir"/usr/share/pixmaps/
  install -Dm 644 "$srcdir"/openarena{,-server}.desktop "$pkgdir"/usr/share/applications/
  
  # create bash-script for link.
  install -Dm 755 "$srcdir"/openarena-runner.sh "$pkgdir"/usr/lib/openarena/openarena-runner.sh

  # create link to arch.
  ln -s /usr/lib/openarena/openarena-runner.sh "${pkgdir}/usr/bin/openarena"
  ln -s /usr/lib/openarena/openarena-runner.sh "${pkgdir}/usr/bin/openarena-server"
  ln -s /usr/lib/openarena/openarena-runner.sh "${pkgdir}/usr/bin/oa_ded"
}
