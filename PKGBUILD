# Maintainer Xichen Zhou <xzhou@xeechou.net>

pkgname=taiwins
_pkgname=taiwins
pkgrel=1
pkgver=0.3.1
pkgdesc="Tiling and floating wayland window manager focused on speed and size"
url="https://taiwins.org"
license=('GPL2')
source=("https://github.com/taiwins/taiwins/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.sig})
md5sums=('e28ec8ec3fce49e40a1f04a70685eed4' 'SKIP')
arch=('x86_64')
provides=('taiwins')
conflicts=('taiwins' 'taiwins-git')

depends=( 'glibc' 'wayland>=1.17' 'libxkbcommon' 'libinput' 'pixman>=0.25.0'
          'libdrm>=2.4.68' 'pam' 'systemd-libs' 'dbus' 'lua>=5.3.0' 'libxcursor'
          'cairo' 'fontconfig' 'freetype2' 'librsvg' 'libgl' 'libegl' 'libgles')

validpgpkeys=('A9C874AAE5654786A694114A041BB7CB35A212C3') #xichen zhou

makedepends=('meson' 'ninja' 'git' 'wayland-protocols>=1.18')

prepare() {
    cd $srcdir/${_pkgname}
    meson --wrap-mode=nodownload --prefix /usr \
	  -Dbuildtype=release \
	  -Dxwayland=enabled \
	  -Dx11-backend=enabled \
	  -Dprofiler=disabled  build
}

build() {
    cd $srcdir/${_pkgname}
    ninja -C build
}

package() {
    cd $srcdir/${_pkgname}
    DESTDIR=$pkgdir ninja -C build install
    install -Dm644 $srcdir/${_pkgname}/subprojects/twclient/LICENSE "$pkgdir/usr/share/licenses/twclient/LICENSE"
    install -Dm644 $srcdir/${_pkgname}/LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

#vim: syntax=sh
