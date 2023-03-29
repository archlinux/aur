# Merged with official ABS xkeyboard-config PKGBUILD by João, 2023/03/29 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config-git
pkgver=2.37_r2690.g2433ef1a
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=($CARCH)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=(git xorg-xkbcomp libxslt python meson git)
conflicts=(${pkgname%-git} xkbdata xkbdata-git)
provides=(${pkgname%-git} xkbdata xkbdata-git)
replaces=(xkbdata-git)
source=("git+https://github.com/freedesktop/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^[^[:digit:]]*-//;s/-[^-]*$//;s/^v//;s/-.*//')"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  arch-meson ${pkgname}-${pkgver} build \
	-D xkb-base="/usr/share/X11/xkb" \
	-D compat-rules=true \
	-D xorg-rules-symlinks=true

  # Print config
  meson configure build

  ninja -C build

 }
 
 package() { 

  DESTDIR="$pkgdir" ninja -C build install

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
