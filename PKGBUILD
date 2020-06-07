# Maintainer: Bas Magré <Opvolger@gmail.com>

pkgname='openarena-git'
pkgver=0.8.8.r2428.f507a7a8
_relver='088'
_openarenaver='0.8.8'
pkgrel=2
makedepends=('git' 'make' 'grep')
conflicts=('openarena')
provides=('openarena')
pkgdesc="A violent, sexy, multiplayer first person shooter based on the ioquake3 engine (binary package)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="http://openarena.ws/"
license=('GPL')
depends=('sdl' 'libvorbis' 'curl' 'libxmp')
optdepends=('openal: to silence SDL fallback warning')
source=('git+https://github.com/OpenArena/engine.git'
        "http://download.tuxfamily.org/openarena/rel/${_relver}/openarena-${_openarenaver}.zip"
        'openarena-runner.sh'
        'openarena.png'
        'openarena-server.png'
        'openarena.desktop'
        'openarena-server.desktop')
sha512sums=('SKIP'
            '9fa4dabe8a3428dc3cbec97f3b4d20c04569c14cdd00b60e6391c6dd61e310f246ff5ec97e7549821b3d6f5f94b140eb5411a2ddd83dafcad66937b7f78ea8dd'
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
  cd "${srcdir}/openarena-${_openarenaver}"
  # no Windows
  rm *.dll *.exe
  # no Mac
  rm -rf __MACOSX *.app
  # we will compile new files!
  rm *.{i386,x86_64}

  # now build openarena
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
  #build!
  make
}

package() {
  # create dirs
  install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/lib" "$pkgdir"/usr/share/pixmaps/ "$pkgdir"/usr/share/applications/
  
  # copy zipfile to openarena
  mv "${srcdir}/openarena-${_openarenaver}" "${pkgdir}/usr/lib/openarena"
  find "${pkgdir}/usr/lib/openarena" -type f -exec chmod 644 {} \;
  find "${pkgdir}/usr/lib/openarena" -type d -exec chmod 755 {} \;

  # copy compiled files
  install -Dm 755 "${srcdir}"/engine/build/release-linux-$(uname -m)/o*.$(uname -m) "${pkgdir}/usr/lib/openarena"

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
