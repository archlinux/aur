# Maintainer: getchoo <getchoo at tuta dot io>
# Contributor: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=multimc5
_pkgname=multimc
pkgver=0.6.14
_nbtplusplusver=dc72a20b7efd304d12af2025223fad07b4b78464
_quazipver=b1a72ac0bb5a732bf887a535ab75c6f9bedb6b6b
pkgrel=2
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
        "libnbtplusplus::git+https://github.com/MultiMC/libnbtplusplus#commit=${_nbtplusplusver}"
        "quazip::git+https://github.com/MultiMC/quazip#commit=${_quazipver}"
        "https://files.multimc.org/downloads/mmc-stable-lin64.tar.gz"
        "modern-java.patch"
        "0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
        "fix-jars.patch"
        "mmc-brand.patch"
        "multimc.desktop"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'df53f8b13ceeddc7922b6553730f29fdf92662277d20c9fc97d56965df1fe2349dd724ad8f911b105b02653fad112785e72ffadbf5571458fa23a45daf473e11'
            'ede87db7e1ce67184409123720b48f65d35884bac5dfff34cc099c5d7520fd9173be00997df82ad29da4640928134a7199ffdd1cbaa83a72101dbed72736508b'
            'd0e3152b885ec73b019dc0269d46e1ce0c43211bbcf05776a1e97f10fdc29f442930cc2d5144c0f979133e6aec68bf68474b924c746d1fa6b8c7f604af6eb83f'
            '1dc559a4b463bb9b0648d221df48a8ab562db186ea44fe0a3dba1af9c51306983faa27839abe7aea0478fb4d165fcf4af0db411fe063a18dcb9ca03c06196397'
            '82f66f6aac1f7c09d2e242768b77af692216cfa99925585a7871fa71bec8197a246b66a3af7d9eab8856655ce80e4ced26a0fc331579a18badd8f86005b5bf53'
            '07a7d3c13b418d18f96e3cf46b8608c69e7346554e8cc62c5d1b54b57c3b2be8ee4481f431b30b71795395c1b5ff5964f7403a6f77bf3ba316dcea3d472b0e8c')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -p1 < "${srcdir}/0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
  patch -p1 < "${srcdir}/modern-java.patch"
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
  git submodule update

}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DMultiMC_UPDATER=OFF \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DMultiMC_LAYOUT=lin-system \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_SHARE_DEST_DIR="share/${_pkgname}" \
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
  install -Dm644 "${srcdir}/${pkgname}/launcher/package/ubuntu/multimc/opt/multimc/icon.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -Dm644 "${srcdir}/multimc.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
