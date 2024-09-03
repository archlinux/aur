# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: skydrome
# Contributor: IgnorantGuru http://igurublog.wordpress.com/contact-ignorantguru/

pkgname=spacefm-thermitegod-git
pkgver=2.1.0.r1423.gfee899c2
pkgrel=1
pkgdesc="Multi-panel tabbed file manager"
arch=(x86_64)
url="https://github.com/thermitegod/spacefm"
license=(GPL3)
depends=(gtk3 gtkmm3 ffmpegthumbnailer exo fmt pugixml zeromq zmqpp python libgexiv2

        # namcap implicit depends
        gdk-pixbuf2 ffmpeg glibmm openssl libsigc++ systemd-libs pango glib2 hicolor-icon-theme glibc gcc-libs)
depends+=(libspdlog.so)
makedepends=(git meson cmake nlohmann-json libsigc++-3.0) #magic_enum toml11 concurrencpp cli11 spdlog #fish
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
source=("spacefm-thermitegod::git+https://github.com/thermitegod/spacefm.git"
        "git+https://github.com/ToruNiina/toml11.git"
        "git+https://github.com/thermitegod/ztd.git"
        "git+https://github.com/CLIUtils/CLI11.git"
        "git+https://github.com/Neargye/magic_enum.git"
        "git+https://github.com/David-Haim/concurrencpp.git"
        "git+https://github.com/gabime/spdlog.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "spacefm-thermitegod"
  git submodule init
  git config submodule.subprojects/toml11.url "${srcdir}/toml11"
  git config submodule.subprojects/ztd.url "${srcdir}/ztd"
  git config submodule.subprojects/CLI11.url "${srcdir}/CLI11"
  git config submodule.subprojects/magic_enum.url "${srcdir}/magic_enum"
  git config submodule.subprojects/concurrencpp.url "${srcdir}/concurrencpp"
  git config submodule.subprojects/spdlog.url "${srcdir}/spdlog"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd "spacefm-thermitegod"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "spacefm-thermitegod"
  arch-meson build
  ninja -C build
}

package() {
  cd "spacefm-thermitegod"
  DESTDIR="${pkgdir}" ninja -C build install
}
