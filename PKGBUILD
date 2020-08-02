# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=tap-lv2
pkgname="${_pkgname}-nomodgui-git"
pkgver=r98.cab6e0d
pkgrel=1
pkgdesc="LV2 port of the TAP (Tom's Audio Processing) plugins without the MOD GUI"
arch=('x86_64')
url="https://github.com/moddevices/tap-lv2"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc')
makedepends=('git' 'lv2')
provides=("${_pkgname}" 'tap-plugins.lv2' 'tap-plugins-lv2')
conflicts=("${_pkgname}" 'tap-plugins.lv2' 'tap-plugins-lv2' 'tap-plugins-lv2-git')
source=("git+https://github.com/moddevices/${_pkgname}.git"
        'tap-lv2-makefile.patch')
md5sums=('SKIP'
         'dee24b09ecbe707d4d9d397149f9a794')


pkgver() {
  cd "$srcdir/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # remove reference to modgui.ttl from all plugin manifests
  for ttl in */manifest.ttl; do
    sed -i -e 's/,<modgui\.ttl>//' "$ttl"
  done

  # patch install target to not install modgui.ttl and modgui files
  patch -p1 -N -i "${srcdir}"/tap-lv2-makefile.patch
}

build() {
  cd "$srcdir/${_pkgname}"

  make INSTALL_PATH=/usr/lib/lv2
}

package() {
  cd "$srcdir/${_pkgname}"

  make INSTALL_PATH=/usr/lib/lv2 DESTDIR="$pkgdir/" install
  install -Dm644 CREDITS README README.md -t "${pkgdir}"/usr/share/${pkgname}
}
