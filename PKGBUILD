# Maintainer : Alexey Andreyev <aa13q@ya.ru>

pkgname=libdrm-grate-git
_realname=libdrm
pkgver=r6381.2e6927aa
pkgrel=1
pkgdesc="Userspace interface to kernel DRM services, fork for open-source NVIDIA Tegra driver"
arch=(armv7h)
license=('custom')
depends=('libpciaccess')
makedepends=('libxslt' 'docbook-xsl' 'meson')
checkdepends=('cairo' 'bcunit-cunit-compat')
url="http://dri.freedesktop.org/"

source=('libdrm::git://github.com/grate-driver/libdrm.git')
sha512sums=('SKIP')
provides=('libdrm')
conflicts=('libdrm')

pkgver() {
  cd "${srcdir}/${_realname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/$_realname"
  NOCONFIGURE=1 ./autogen.sh
}

check() {
  cd "${srcdir}/$_realname"
  make check
}

build() {
    cd "${srcdir}/${_realname}"
    sh configure --prefix=/usr --enable-tegra-experimental-api --disable-freedreno --disable-vmwgfx --disable-nouveau --disable-amdgpu --disable-radeon --disable-intel --disable-vc4
}

package() {
  cd "${srcdir}/${_realname}"
  DESTDIR="$pkgdir" make install
}
