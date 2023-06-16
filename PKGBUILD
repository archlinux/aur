# Maintainer: Vasiliy Stelmachenok <ventureo@yandex.ru>
# Contributor: mfcmquintela <mfcmquintela@gmail.com>
# Contributor: lazerl0rd <lazerl0rd@thezest.dev>
# Contributor: Joel Selvaraj

pkgname=nvlax-git
pkgver=r11.b3699ad
pkgrel=8
pkgdesc='Future-proof NvENC & NvFBC patcher'
arch=('x86_64')
url='https://github.com/illnyang/nvlax'
license=('GPL')
depends=('nvidia-utils')
makedepends=('cmake' 'git')
provides=('nvlax' 'nvlax-git')
conflicts=('nvlax')
options=(!ccache)
source=("nvlax"::"git+https://github.com/illnyang/${pkgname%%-git}.git"
        'nvlax-upgrade.hook'
        'nvlax-install.hook'
        '530-NVENC.patch'
        'gcc13.patch')
sha256sums=('SKIP'
            '347ba347a37f70c008be340c40cd55fff8588ce7aa3dd1dd7ef0241bd2f5e09a'
            '120488c0831ae4b347432c46add9f56f146f69580ebedfece4bb4ed947fb12df'
            'a0f4ff5c12d20390cd9b0e348b4042dcece0aaf476b76dc1ef22d8d187203764'
            'fe7b9f180be83960e4d41a0e3e12452eb972832f6d9bec6b7b176e1fc3c28d23')

prepare() {
  cd ${pkgname%%-git}

  # Patch fixes for compatibility with driver 530.xx.
  # Probably breaks compatibility with previous versions of driver
  patch -Np1 -i "${srcdir}/530-NVENC.patch"

  # Fixes: Build with GCC 13
  # Fixes: https://github.com/illnyang/nvlax/issues/11
  patch -Np1 -i "${srcdir}/gcc13.patch"
}

pkgver() {	
  cd ${pkgname%%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%%-git}
  cmake -B build -DCMAKE_INSTALL_PREFIX="/usr"
  cmake --build build
}

package() {
  cd ${pkgname%%-git}
  DESTDIR="$pkgdir" cmake --install build

  # Auto applying hooks
  install -Dm644 "${srcdir}/nvlax-install.hook" -t "$pkgdir/usr/share/libalpm/hooks"
  install -Dm644 "${srcdir}/nvlax-upgrade.hook" -t "$pkgdir/usr/share/libalpm/hooks"
}
