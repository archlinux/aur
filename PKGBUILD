# Maintainer: getchoo <getchoo at tuta dot io>
# Contributor: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=multimc5
_pkgname=multimc5
pkgver=0.6.13
_nbtplusplusver=dc72a20b7efd304d12af2025223fad07b4b78464
_quazipver=b1a72ac0bb5a732bf887a535ab75c6f9bedb6b6b
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('zlib' 'libgl' 'qt5-base' 'qt5-x11extras' 'java-runtime' 'qt5-svg' 'xorg-xrandr' 'zenity' 'wget')
makedepends=('cmake' 'java-environment' 'git')
provides=('multimc')
conflicts=('multimc')
optdepends=('mcedit: Allows editing of minecraft worlds'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries'
)

source=("${_pkgname}::git+https://github.com/MultiMC/Launcher#tag=${pkgver}"
        "libnbtplusplus::git+https://github.com/MultiMC/libnbtplusplus#commit=${_nbtplusplusver}"
        "quazip::git+https://github.com/MultiMC/quazip#commit=${_quazipver}"
        "modern-java.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'ede87db7e1ce67184409123720b48f65d35884bac5dfff34cc099c5d7520fd9173be00997df82ad29da4640928134a7199ffdd1cbaa83a72101dbed72736508b')
prepare() {
  cd "${srcdir}/${_pkgname}"

  # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
  git submodule init
  git config submodule.depends/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.url "${srcdir}/quazip"
  git submodule update

  # update build target to modern java version
  patch -p1 < "${srcdir}/modern-java.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DMultiMC_UPDATER=OFF \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DMultiMC_LAYOUT=lin-system \
    ..
  make
}

check() {
  cd "${srcdir}/${_pkgname}/build"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/${_pkgname}/launcher/resources/multimc/scalable/multimc.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -D "${srcdir}/${_pkgname}/launcher/package/linux/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
  install -D "${srcdir}/${_pkgname}/build/libMultiMC_quazip.so" "${pkgdir}/usr/lib/libMultiMC_quazip.so"
  install -D "${srcdir}/${_pkgname}/build/libMultiMC_nbt++.so" "${pkgdir}/usr/lib/libMultiMC_nbt++.so"
}
