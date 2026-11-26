# Maintainer: Srinivasan Rangarajan <srinivasanr at gmail dot com>
pkgname=raea-bin
_pkgname=raea
pkgver=0.1.10
pkgrel=1
pkgdesc="Render Anything Engine: videos, motion graphics, 3D and games as React and TypeScript, rendered on your GPU"
arch=('x86_64')
url="https://raea.io"
license=('FSL-1.1-ALv2')
depends=(
  'gcc-libs'
  'glibc'
  'alsa-lib'
  'fontconfig'
  'systemd-libs'
  'vulkan-icd-loader'
  'libxkbcommon-x11'
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
)
optdepends=(
  'vulkan-driver: GPU rendering (mesa provides llvmpipe as a fallback)'
  'noto-fonts-cjk: Japanese, Chinese and Korean text'
  'xorg-server-xvfb: headless app checks on a server'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install=$pkgname.install
source=("$_pkgname-$pkgver-linux-x86_64.tar.gz::https://github.com/shinyobjectz/raea/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/shinyobjectz/raea/v$pkgver/LICENSE")
sha256sums=('c70dad98aa10f5a133aad39cfc6c0ec58a0d19a5f5d9e145282ff18cd57e34fc'
            'fe3ce8198545420f93b83a2fd02e6fff4a4414ffcb2309df50878adf39d1c392')

package() {
  # raea finds its share/ relative to its own executable, so keep the release layout intact under /opt
  install -d "$pkgdir/opt/$_pkgname"
  cp -a "$srcdir/$_pkgname/bin" "$srcdir/$_pkgname/share" "$pkgdir/opt/$_pkgname/"
  install -Dm644 "$srcdir/$_pkgname/README" "$pkgdir/usr/share/doc/$_pkgname/README"

  install -d "$pkgdir/usr/bin"
  local b
  for b in raea raea-page-host raea-rune-host raea-perceive; do
    ln -s "/opt/$_pkgname/bin/$b" "$pkgdir/usr/bin/$b"
  done

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
