# Contributor: Michał Lisowski <lisu@riseup.net>

_assets_ver=2104

pkgname=maszyna-git
pkgver=r2801.01bcadff
pkgrel=1
pkgdesc="Polish train simulator"
arch=('x86_64')
url="https://eu07.pl/"
license=('MPL2' 'custom')
makedepends=('asio' 'cmake' 'git' 'glfw' 'glm' 'libserialport' 'openvr' 'p7zip' 'vulkan-icd-loader' 'vulkan-headers' 'directx-shader-compiler' 'libxinerama')
depends=('libserialport' 'openvr' 'python2' 'wine' 'luajit' 'openal' 'libsndfile')
source=("$pkgname"::'git+https://github.com/MaSzyna-EU07/maszyna.git'
        "git+https://github.com/glfw/glfw.git"
        "git+https://github.com/nlohmann/json.git"
        "http://stuff.eu07.pl/MaSzyna${_assets_ver}.zip"
        "http://stuff.eu07.pl/${_assets_ver}HF.zip"
        "https://eu07.pl/docs/inne/readme_pliki/licencja.html"
        "maszyna.sh"
        "discord-rpc.patch")
noextract=("MaSzyna${_assets_ver}.zip"
           "${_assets_ver}HF.zip")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '125b037d69729ab67091cf757040b277'
         '1362073d9fc81b83e9970f02c38b0257'
         '3ceb82abdda799961f2bdc1c9bdc842a'
         'a24521953418278dc07571bf3ee75b89'
         'ce48ac0b428121a3ca20d217827c5329')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  #https://github.com/MaSzyna-EU07/maszyna/issues/54
  git config submodule.ref/json.url "${srcdir}/json"
  git config submodule.ref/glfw.url "${srcdir}/glfw"
  git submodule deinit ref/glm
  git submodule deinit betterRenderer/thirdparty/nvrhi
  git submodule deinit betterRenderer/thirdparty/yaml-cpp
  git submodule deinit betterRenderer/thirdparty/fmt
  git submodule deinit betterRenderer/thirdparty/entt
  git submodule deinit ref/asio
  git submodule deinit ref/discord-rpc
  git submodule deinit ref/vcpkg
  git submodule deinit betterRenderer/thirdparty/bvh
  git submodule--helper update
  #https://github.com/MaSzyna-EU07/maszyna/issues/55
  patch -p1 -i "${srcdir}/discord-rpc.patch"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  export CXXFLAGS="$CXXFLAGS -Wno-error=format-security"
  cmake .. -DCMAKE_BUILD_TYPE=Release -DWITH_BETTER_RENDERER=OFF -DWITH_DISCORD_RPC=OFF -DWITH_OPENVR=ON
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 build/bin/eu07_$(git show -s --format=%cs)_$(git describe --match=DUMMY --always --dirty) "${pkgdir}/opt/maszyna/eu07"
  install -D -m755 ${srcdir}/maszyna.sh "${pkgdir}/usr/bin/maszyna"
  cp -r shaders "${pkgdir}/opt/maszyna/"
  7z x "${srcdir}/MaSzyna${_assets_ver}.zip" -o"${pkgdir}/opt/maszyna" -y
  7z x "${srcdir}/${_assets_ver}HF.zip" -o"${pkgdir}/opt/maszyna" -y
  install -D -m644 "${srcdir}/licencja.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
}
