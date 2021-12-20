# Maintainer: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=multimc
pkgname=${_pkgname}-git
pkgver=0.6.14.r21.g3dd6cea8
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances. Includes old name/icons and ability to sign in with a Microsoft account."
arch=('i686' 'x86_64')
url="https://github.com/MultiMC/Launcher"
license=('Apache')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('multimc')
conflicts=('multimc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/MultiMC/Launcher"
        "git+https://github.com/MultiMC/libnbtplusplus"
        "git+https://github.com/MultiMC/quazip"
        "https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz"
        0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch
        application.desktop
        modern-java.patch
        fix-jars.patch
        mmc-brand.patch
)

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'cb003424404d83e3ee6e8c0c4d6be1562325185efac3f249f63542c05eda71144fd865e065c5bd00b981288df0ced12bb4ac6311ddd0cf9cc6dd7d611f94b107'
            'a7c4654dd5ee260c25e0eab2dba0d929f09bc38b9af1505408a55058e73eaf35986b4a0e6de7e1893ebf860c472df984011340b3989f996a9d170cbc37dfd691'
            'fed9f3a12441c48b163ae76b2b0e5be2f609e72430f0ae071856d62ff0e0572f429dc116714cbfbf1964191ec3439060fdb07a51a9e86b75be4fea24a2f28ef2'
            '1dc559a4b463bb9b0648d221df48a8ab562db186ea44fe0a3dba1af9c51306983faa27839abe7aea0478fb4d165fcf4af0db411fe063a18dcb9ca03c06196397'
            '82f66f6aac1f7c09d2e242768b77af692216cfa99925585a7871fa71bec8197a246b66a3af7d9eab8856655ce80e4ced26a0fc331579a18badd8f86005b5bf53')

pkgver() {
  cd Launcher
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Launcher"
  patch -p1 < "${srcdir}/0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
  patch -p1 < "${srcdir}/modern-java.patch"
  patch -p1 < "${srcdir}/fix-jars.patch"
  patch -p1 < "${srcdir}/mmc-brand.patch"

  pushd ${srcdir}/MultiMC/bin
  local client_id_asm=$(objdump -j '.text' --no-show-raw-insn -C --disassemble='Secrets::getMSAClientID(unsigned char)' MultiMC)
  local client_id="$(grep -oP '[a-z0-9]{2}(?=,%r[89]d)' <<< ${client_id_asm} | tac | tr -d '\n')$(grep -oP '(push.+0x)\K[a-z0-9]{2}' <<< ${client_id_asm} | tac | tr -d '\n')"
  client_id="${client_id:0:8}-${client_id:8:4}-${client_id:12:4}-${client_id:16:4}-${client_id:20}"
  popd

  sed -i 's/""/"'"${client_id}"'"/g' notsecrets/Secrets.cpp

  git checkout 6a4130c9149deb029b496c81e3b874ad834c54b7 -- launcher/resources/{{OSX,flat,iOS,multimc,pe_{blue,colored,dark,light}}/scalable/multimc.svg,multimc/{32x32,128x128}/instances/infinity.png}

  for f in launcher/resources/{OSX,flat,iOS,multimc,pe_{blue,colored,dark,light}}/scalable
  do
    mv "$f/multimc.svg" "$f/launcher.svg"
  done

  cp launcher/resources/multimc/scalable/launcher.svg notsecrets/logo.svg

  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {
  cd "${srcdir}/Launcher"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_LAYOUT=lin-system \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_SHARE_DEST_DIR="share/${_pkgname}" \
    ..
  make
}

check() {
  cd "${srcdir}/Launcher/build"
  make test
}

package() {
  cd "${srcdir}/Launcher/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/Launcher/launcher/resources/multimc/scalable/launcher.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -D "${srcdir}/application.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D "${srcdir}/Launcher/build/libLauncher_quazip.so" "${pkgdir}/usr/lib/libLauncher_quazip.so"
  install -D "${srcdir}/Launcher/build/libLauncher_nbt++.so" "${pkgdir}/usr/lib/libLauncher_nbt++.so"
}

