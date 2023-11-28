# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=cinnamon-settings-daemon-git
pkgver=6.0.0.r0.gebff319
pkgrel=1
pkgdesc="The Cinnamon Settings daemon"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/${pkgname%-git}"
license=('GPL')
depends=('cinnamon-desktop>=4.4.1.r7.gf2c6cb7' 'colord' 'dbus-glib' 'libcanberra-pulse' 'libcups'
         'libgnomekbd' 'libgudev' 'libnotify' 'librsvg' 'libwacom' 'nss' 'polkit'
         'pulseaudio-alsa' 'upower')
optdepends=('cinnamon-translations: i18n')
makedepends=('git' 'meson' 'samurai' 'intltool' 'python' 'xf86-input-wacom')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
options=('!emptydirs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}"/${pkgname%-git}

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/${pkgname%-git}
  [[ -d build ]] || mkdir build
}

build() {
    cd "${srcdir}"/${pkgname%-git}/build
    meson --prefix=/usr \
                --sysconfdir=/etc \
                --localstatedir=/var \
                --libexecdir="/usr/lib/${pkgname%-git}" \
                ..
 
    samu
}

package() {
    cd "${srcdir}"/${pkgname%-git}/build
    DESTDIR="${pkgdir}" samu install
}
