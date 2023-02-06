# Maintainer: getchoo <getchoo at tuta dot io>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=multimc5
_pkgname=multimc
pkgver=0.6.16
pkgrel=3
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('qt5-base' 'java-runtime>=17')
makedepends=('cmake' 'java-environment>=17' 'git')
optdepends=('visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries'
)
provides=('multimc')
conflicts=('multimc')
source=("${pkgname}::git+https://github.com/MultiMC/Launcher#tag=${pkgver}"
        "libnbtplusplus::git+https://github.com/MultiMC/libnbtplusplus"
        "quazip::git+https://github.com/MultiMC/quazip"
        "https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz"
        "0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
        "fix-jars.patch"
        "mmc-brand.patch"
        "multimc.desktop"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'd94f2f689a57a9d88db9d9bed57e1e822868688350dc449b77cf569fb62a98ea625978ee9eeae0200f0274c8b8c2b3f6764ef3091c70c2f979aa87c4f7327214'
            'd0e3152b885ec73b019dc0269d46e1ce0c43211bbcf05776a1e97f10fdc29f442930cc2d5144c0f979133e6aec68bf68474b924c746d1fa6b8c7f604af6eb83f'
            'df077c24a235117cc391ac515dd1e28c10b2082093c80aac5dcf3d6d8feaf07acacc79bfd5f111e389e7972e6f0a3b6eb217202d13e362219ed22a5437cd49c7'
            '1aeb819e1fc21f887e8f212f44eb22ccad320b9a1783ed9b55b8a2a9875103f079aaeb0a051b811f7ceb0708caf20f3c7b0c4ba21b5bb5dc25b0fec977dfc878'
            'a7c4654dd5ee260c25e0eab2dba0d929f09bc38b9af1505408a55058e73eaf35986b4a0e6de7e1893ebf860c472df984011340b3989f996a9d170cbc37dfd691')
install=multimc5.install

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -p1 < "${srcdir}/0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
  patch -p1 < "${srcdir}/fix-jars.patch"
  patch -p1 < "${srcdir}/mmc-brand.patch"

  # generate microsoft client id (https://aur.archlinux.org/packages/multimc-git)
  pushd ${srcdir}/MultiMC/bin
  local client_id_asm=$(objdump -j '.text' --no-show-raw-insn -C --disassemble='Secrets::getMSAClientID(unsigned char)' MultiMC)
  local client_id="$(grep -oP '[a-z0-9]{2}(?=,%r[89]d)' <<< ${client_id_asm} | tac | tr -d '\n')$(grep -oP '(push.+0x)\K[a-z0-9]{2}' <<< ${client_id_asm} | tac | tr -d '\n')"
  client_id="${client_id:0:8}-${client_id:8:4}-${client_id:12:4}-${client_id:16:4}-${client_id:20}"

  cd "${srcdir}/${pkgname}"

  sed -i 's/""/"'"${client_id}"'"/g' notsecrets/Secrets.cpp

  # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
  git submodule init
  git config submodule.depends/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.url "${srcdir}/quazip"
  git submodule--helper update

}

build() {
  cd "${srcdir}/${pkgname}"

  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_LAYOUT=lin-system \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_SHARE_DEST_DIR="share/${_pkgname}" \
    -DLauncher_LIBRARAY_DEST_DIR="lib/${_pkgname}" \
    ..
  make
}

check() {
  cd "${srcdir}/${pkgname}/build"

  make test
}

package() {
  cd "${srcdir}/${pkgname}/build"

  make install DESTDIR="${pkgdir}"

  mkdir -p "${pkgdir}/etc/ld.so.conf.d"
  echo -e "/usr/lib/${_pkgname}" > "${pkgdir}/etc/ld.so.conf.d/multimc5.conf"

  install -Dm644 "${srcdir}/${pkgname}/launcher/package/ubuntu/multimc/opt/multimc/icon.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -Dm644 "${srcdir}/multimc.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
