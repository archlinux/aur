# Maintainer: getchoo <getchoo at tuta dot io>
# Contributor: vorpalblade77@gmail.com
# Contributor: b.klettbach@gmail.com
# Contributor: Patrik Plihal <patrik.plihal at gmail dot com>
# Contributor: xiretza <xiretza+aur@gmail.com>

pkgname=multimc5
pkgver=0.6.14
_nbtplusplusver=dc72a20b7efd304d12af2025223fad07b4b78464
_quazipver=b1a72ac0bb5a732bf887a535ab75c6f9bedb6b6b
pkgrel=1
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
        "modern-java.patch"
        "change-build-name.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'ede87db7e1ce67184409123720b48f65d35884bac5dfff34cc099c5d7520fd9173be00997df82ad29da4640928134a7199ffdd1cbaa83a72101dbed72736508b'
            'd8153fefa3bc8ec6166448be39c675579676b7762b149d0e1be57aee05fad1ec9f3d4781fd591721518cc0efd4cad6d196a9357199c5d9b4cd858c1a3e7f6dc4')
prepare() {
  cd "${srcdir}/${pkgname}"

  # https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
  git submodule init
  git config submodule.depends/libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.libraries/quazip.url "${srcdir}/quazip"
  git submodule update

  # update build target to modern java version
  patch -p1 < "${srcdir}/modern-java.patch"

  # update the desktop file to have correct paths
  patch -p1 < "${srcdir}/change-build-name.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
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
  cd "${srcdir}/${pkgname}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/${pkgname}/launcher/package/ubuntu/multimc/opt/multimc/icon.svg" "${pkgdir}/usr/share/pixmaps/multimc.svg"
  install -Dm644 "${srcdir}/${pkgname}/launcher/package/ubuntu/multimc/usr/share/applications/multimc.desktop" "${pkgdir}/usr/share/applications/multimc.desktop"
}

# vim:set ts=2 sw=2 et:
