# Maintainer: Neptune <neptune650@proton.me>
# Contributor: Yupian Shuang <shuangyupian at qq dot com>

pkgname=multimc-bin
pkgver=1.6
pkgrel=3
pkgdesc="Free, open source launcher and instance manager for Minecraft."
arch=('i686' 'x86_64')
url="https://multimc.org/"
license=('Apache')
depends=('zlib' 'opengl-driver' 'qt5-base' 'java-runtime' 'qt5-x11extras' 'qt5-svg' 'zenity' 'wget')
provides=('multimc' 'multimc5')
replaces=('multimc-native')
conflicts=('multimc' 'multimc5')
optdepends=('visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'openal: to use system OpenAL libraries'
            'glfw: to use system GLFW libraries')
source=("$pkgname-$pkgver.deb::https://files.multimc.org/downloads/multimc_$pkgver-1.deb"
        "multimc.1")
sha256sums=('d30b2577463178fd3cbe0dd30e68a30be3f85d8f50f8052e844a43acf4b46e0f'
            'c5413141151a5cb114d32c496cf49ba6bc4c755d51b1cad22aac70e38d3d3e46')
noextract=("$pkgname-$pkgver.deb")

prepare() {
  mkdir -p "$pkgname-$pkgver"
  bsdtar -xf $pkgname-$pkgver.deb -C "$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"
  bsdtar -xf data.tar.xz -C "$srcdir/$pkgname-$pkgver"
}

package() {
  mkdir -p "$pkgdir/opt/multimc"
  mkdir -p "$pkgdir/usr/share/metainfo"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"

  cp -R "$srcdir/$pkgname-$pkgver/opt/multimc/" -T "$pkgdir/opt/multimc/"
  cp -R "$srcdir/$pkgname-$pkgver/usr/share/metainfo/" -T "$pkgdir/usr/share/metainfo/"
  cp -R "$srcdir/$pkgname-$pkgver/usr/share/applications/" -T "$pkgdir/usr/share/applications/"

  install -m644 -D "$srcdir/$pkgname-$pkgver/usr/share/applications/multimc.desktop" "$pkgdir/usr/share/applications/multimc.desktop"
  install -m644 -D "$srcdir/$pkgname-$pkgver/usr/share/metainfo/multimc.metainfo.xml" "$pkgdir/usr/share/metainfo/multimc.metainfo.xml"
  install -m644 -D "$srcdir/$pkgname-$pkgver/opt/multimc/icon.svg" "$pkgdir/opt/multimc/icon.svg"
  install -m755 -D "$srcdir/$pkgname-$pkgver/opt/multimc/run.sh" "$pkgdir/opt/multimc/run.sh"
  install -m755 -D "$srcdir/multimc.1" "$pkgdir/usr/share/man/man1/multimc.1"
  ln -s "/opt/multimc/run.sh" "$pkgdir/usr/bin/multimc"
}
