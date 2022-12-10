# Maintainer: Amin Mesbah <dev@aminmesbah.com>

pkgname=milton
pkgver=1.9.1
pkgrel=1
pkgdesc='An infinite-canvas paint program'
arch=('x86_64')
url='https://www.miltonpaint.com/'
license=('GPL3')
depends=('gtk3' 'sdl2')
makedepends=('cmake' 'icoutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/serge-rgb/milton/archive/v${pkgver}.tar.gz"
        'system-sdl.patch'
        'gtk3.patch'
        'gtk-keep-above.patch'
        '400f7c177dd9e71255aff66cebf756289cc6561e.patch'
        'milton.desktop')
sha512sums=('26b531be432065ab9a683f5a015754853bdd59bdde2e034e862ada6813f6044412d11e4db6bd984693b4c00d186f11b6f3a45092255bda9ca50c5e749e647895'
            'bf31ac904ad1ae03489f18111a5ee9a4321ce474e73032b3c7c7bf146cceff1d822b743df57ab405309020fbec749b8d628a29cbe7e97e862d610ad5cdf16fe6'
            'eea5c25582bfd60fd0e854aaf211f252448dc1a916533cf13e1d17830a8165dfaec6183b92f8929b33e637260981e861fe5f28a15acdfd1181a9587a9e506eb9'
            'eb838021641f2b73b08a7def6bfc2f492039fd72118aa6d46b14007dad2d12cf3e89375051a301ee7fe9c5f59e18e487fb98c5db8364c24ee7e91688c8e4a8ef'
            '895f1529860b0b763b39697a86e94e9d28750bc9c041919f88b4864f79558649943b166577c686897f6c6eddaff91474cdc8399f9b5c3fbef594f64aacecafa7'
            '341658c9b948e1ccee4487d693d66a901a7612bd2cc984ae7771606fa27a467b88139458a1f2a7d9e12e6fe9d4f63919ecdbdc34f38e8965045c846aeae5ff67')

prepare() {
  [[ -d build ]] || mkdir build
  cd $pkgname-$pkgver

  # Use SDL installed on the system
  patch -Np1 -i ../system-sdl.patch

  # Use GTK3 instead of GTK2
  patch -Np1 -i ../gtk3.patch

  # Keep above GTK dialogs
  patch -Np1 -i ../gtk-keep-above.patch

  # Fix build
  patch -Np1 -i ../400f7c177dd9e71255aff66cebf756289cc6561e.patch
}

build() {
  cd build
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}
  cmake -G "Unix Makefiles" ../$pkgname-$pkgver/ \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  install -Dm755 Milton "$pkgdir/usr/bin/milton"

  icotool -x milton_icon.ico
  for res in 16 32 48 64 128 256; do
    install -Dm644 milton_icon_*"_${res}x${res}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/milton.png"
  done

  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
