# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-api-git
pkgver=6.0.9.r0.g2925d69
pkgrel=1
pkgdesc='Golang bindings for dde-daemon'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dde-api"
license=('GPL3')
# alsa-utils: alsactl used in sound-theme-player
# bc: used in adjust-grub-theme
# fontconfig: fc-match used in adjust-grub-theme
# librsvg: rsvg-convert used in adjust-grub-theme
# util-linux: rfkill used in device
# deepin-application-manager: org.desktopspec.ApplicationManager1
depends=('alsa-utils' 'bc' 'fontconfig' 'glib2' 'gdk-pixbuf-xlib' 'gtk3' 'libcanberra-pulse'
         'librsvg' 'libxi' 'libxfixes' 'poppler-glib' 'util-linux' 'xcur2png' 'blur-effect'
         'libpulse' 'libxcursor' 'cairo' 'gdk-pixbuf2' 'freetype2' 'alsa-lib' 'libgudev'
         'deepin-application-manager')
makedepends=('git' 'deepin-gettext-tools' 'go')
provides=('deepin-api')
conflicts=('deepin-api')
groups=('deepin-git')
install=deepin-api.install
source=("$pkgname::git+https://github.com/linuxdeepin/dde-api/"
        deepin-api.sysusers)
sha512sums=('SKIP'
            'e894eb3928af9e244fa78010fdf16c8abb6ce18df114cf05327d02b18774d6ba5b023e4dfa0d07042f4e44a5c6e2ddb55b07f3e0db466a0e6169b52465fdefd6')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  cd $pkgname
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" SYSTEMD_LIB_DIR=/usr/lib install

  install -Dm644 ../deepin-api.sysusers "$pkgdir"/usr/lib/sysusers.d/deepin-api.conf
}

