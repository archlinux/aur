# Maintainer: Kimiblock Moe
# Contributor: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=prismlauncher-bwrap
pkgver=9.2
pkgrel=1
provides=(prismlauncher)
conflicts=(prismlauncher)
pkgdesc="Minecraft launcher with ability to manage multiple instances. Sandboxed by portable."
arch=(x86_64)
url='https://prismlauncher.org'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  gcc-libs
  java-runtime
  libgl
  qt6-base
  qt6-5compat
  qt6-svg
  qt6-imageformats
  qt6-networkauth
  quazip-qt6
  zlib
  hicolor-icon-theme
  tomlplusplus
  cmark
  glfw
  portable
  xorg-xrandr
  openal
  flite
)
makedepends=(cmake extra-cmake-modules git jdk17-openjdk scdoc ghc-filesystem gamemode desktop-file-utils)
optdepends=('visualvm: Profiling support')
source=("https://github.com/PrismLauncher/PrismLauncher/releases/download/$pkgver/PrismLauncher-$pkgver.tar.gz"
        {lionshead,batch,mdi}.license
        portable-config
        start.sh)
b2sums=('82e54ed299b7c93d086beae02e02ae148d8acea0034d7db1e4ff1752a8933994a0ab7ef1f8bc7d6ce9a598347863a8e8a6ecddca13211f6b7f96526d004ae919'
        'be4289832af95b1cd6e721dc16b84a034533de9718d9b43a49bd08dd6fe4e28eaa15228bfb311867b18fddbda1c9fc4c91f04c6d5c1a3bcc39aaa5161425e3ba'
        '356248a6b86f06d260e0920b49d34034f79f9bc504c7fdc1849d929d2ff9b169e693a8269a2c0b34656b3802970d9b8be41a92b35177eaa3c4ccc89a702f5c9d'
        'b35c447cd9223e096a2bb75e0741a7d0a3a1606af54c957e4f276f4e6861a9b3f06ae1d646137e8d2f24ba2238c9967c76eff8cc631a68d7e48e376056982cc6'
        '9dae521e9f19cf1aa84bd3cc7feb76ea28a1e2bf60575c8513526f3e717d02f969e1835ba9fb696e8f8fa62a3b6c408847a42676745dc6c48a35e36350eefad9'
        'bee0e4599afee672d346e45ee42fc9c0ee870308dcf153b41fe3b7e6c54f23fddd63c4e4811acb0db3f68cf4b5eb4274fc3aeb1da9c45a1d554a30054576503a')

build() {
  cd PrismLauncher-$pkgver

  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -DLauncher_ENABLE_JAVA_DOWNLOADER=OFF \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd PrismLauncher-$pkgver/build
  ctest .
}

package() {
  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/

  cd PrismLauncher-$pkgver/build
  DESTDIR="$pkgdir" cmake --install .
  install -Dm755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/prismlauncher-bwrap"
  install -Dm755 "${srcdir}/portable-config" "${pkgdir}/usr/lib/portable/info/org.prismlauncher.app/config"
  desktop-file-edit --set-key=Exec --set-value='/usr/bin/prismlauncher-bwrap %U' \
    "${pkgdir}/usr/share/applications/org.prismlauncher.PrismLauncher.desktop"
  mv \
  	"${pkgdir}/usr/share/applications/org.prismlauncher.PrismLauncher.desktop" \
  	"${pkgdir}/usr/share/applications/org.prismlauncher.app.desktop"
}
