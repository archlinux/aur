# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-thermitegod-git
pkgver=2.1.0.r1512.ge8e26b90
pkgrel=1
pkgdesc="Multi-panel tabbed file manager"
arch=(x86_64)
url="https://github.com/thermitegod/spacefm"
license=(GPL3)
depends=(gtk3 gtkmm3 gtkmm-4.0 ffmpegthumbnailer exo fmt pugixml zeromq cppzmq python libgexiv2 botan

        libspdlog.so
        # namcap implicit depends
        gdk-pixbuf2 ffmpeg glibmm openssl libsigc++ systemd-libs pango glib2 hicolor-icon-theme glibc gcc-libs)
makedepends=(git meson cmake nlohmann-json libsigc++-3.0 toml11 concurrencpp cli11 spdlog glaze ztd-git magic_enum)
#cmake required to find toml11
#optdepends=('dbus: dbus integration'
#            'util-linux: disk eject support'
#            'lsof: device processes'
#            'wget: plugin download'
#            'gksu: perform as root functionality'
#            'udevil: mount as non-root user and mount networks'
#            'udisks2: mount as non-root user'
#            'pmount: mount as non-root user'
#            'curlftpfs: mount FTP shares'
#            'jmtpfs: mount MTP devices'
#            'gphotofs: mount cameras'
#            'ifuse: mount your iPhone/iPod Touch'
#            'fuseiso: mount ISO files')
conflicts=(spacefm spacefm-thermitegod)
provides=(spacefm spacefm-thermitegod)
source=("spacefm-thermitegod::git+https://github.com/thermitegod/spacefm.git")
sha256sums=('SKIP')

pkgver() {
  cd "spacefm-thermitegod"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" -Wno-changes-meaning"
  export CXXFLAGS+=" -Wno-changes-meaning"

  local _flags=(
    -D with-system-cli11=true
    -D with-system-concurrencpp=true
    -D with-system-glaze=true
    -D with-system-magic-enum=false
    -D with-system-spdlog=true
    -D with-system-toml11=true
    -D with-system-ztd=false
    --wrap-mode default
  )

  cd "spacefm-thermitegod"
  arch-meson build "${_flags[@]}"
  ninja -C build
}

package() {
  cd "spacefm-thermitegod"
  DESTDIR="${pkgdir}" ninja -C build install
}
