# Maintainer: Szymon Grajner <szymongrajner@sfymmik.xyz>
pkgbase=termmik-git
pkgname=('termmik-git' 'termmik-x11-git' 'termmik-wayland-git')
pkgver=1.0.r1.g1234567
pkgrel=1
pkgdesc="A custom lightweight C-based terminal emulator"
arch=('x86_64')
url="https://git.sfymmik.xyz/SfymmiK/TermmiK"
license=('GPL3') # Update this if you use MIT, BSD, etc.

# Everything needed to compile all possible backends
makedepends=('git' 'make' 'gcc' 'fontconfig' 'libx11' 'libxrandr' 'libxext' 'wayland' 'libxkbcommon')

source=("${pkgbase}::git+https://git.sfymmik.xyz/SfymmiK/TermmiK.git")
# Fallback source (uncomment if the self-hosted instance is down)
# source=("${pkgbase}::git+https://github.com/SFYMMIK/TermmiK.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -a "$pkgbase" "$pkgbase-full"
  cp -a "$pkgbase" "$pkgbase-x11"
  cp -a "$pkgbase" "$pkgbase-wayland"
}

build() {
  # 1. Build Full (X11 + Wayland)
  cd "$srcdir/$pkgbase-full"
  make

  # 2. Build X11 Only
  cd "$srcdir/$pkgbase-x11"
  make DISABLE_WAYLAND=1

  # 3. Build Wayland Only
  cd "$srcdir/$pkgbase-wayland"
  make DISABLE_X11=1
}

package_termmik-git() {
  pkgdesc="A custom lightweight C-based terminal emulator (X11 and Wayland)"
  depends=('glibc' 'fontconfig' 'libx11' 'libxrandr' 'libxext' 'wayland' 'libxkbcommon')
  provides=('termmik')
  conflicts=('termmik' 'termmik-x11-git' 'termmik-wayland-git')
  
  cd "$pkgbase-full"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

package_termmik-x11-git() {
  pkgdesc="A custom lightweight C-based terminal emulator (X11 only)"
  depends=('glibc' 'fontconfig' 'libx11' 'libxrandr' 'libxext')
  provides=('termmik')
  conflicts=('termmik' 'termmik-git' 'termmik-wayland-git')
  
  cd "$pkgbase-x11"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

package_termmik-wayland-git() {
  pkgdesc="A custom lightweight C-based terminal emulator (Wayland only)"
  depends=('glibc' 'fontconfig' 'wayland' 'libxkbcommon')
  provides=('termmik')
  conflicts=('termmik' 'termmik-git' 'termmik-x11-git')
  
  cd "$pkgbase-wayland"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
