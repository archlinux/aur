# Maintainer: Lev Lybin <aur@devtrue.net>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: K900 <k0009000@gmail.com>

pkgname=steam-client
_realname=steam
pkgver=1.0.0.52
pkgrel=2
pkgdesc="A launcher for the Steam client from Valve Corporation"
arch=("i686" "x86_64")
url="http://steampowered.com/"
license=('custom')
install=steam.install
source=("http://repo.steampowered.com/${_realname}/pool/${_realname}/s/${_realname}/${_realname}_${pkgver}.tar.gz"
        'file://alsa_sdl_audiodriver.patch'
        'file://99-steam-controller-perms.rules')
md5sums=('18fe1e009d229ec2eb28e4e7fa87ebc8'
         'ac0e03d70f1101331598b2b32ed9bac3'
         'cd8475f127bd7cec8f98862cb591f095')
conflicts=('steam')
depends=(
   'bash' 'desktop-file-utils' 'hicolor-icon-theme' 'curl'
   'dbus' 'freetype2'  'gdk-pixbuf2' 'ttf-font' 'zenity'
)
depends_x86_64=(
    'lib32-libgl' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libxss'
)
optdepends_x86_64=(
  'lib32-mesa-dri: for open source driver users'
  'lib32-catalyst-utils: for AMD Catalyst users'
  'lib32-nvidia-utils: for NVIDIA proprietary blob users'
  'lib32-alsa-plugins: for pulseaudio on some games'
)

prepare() {
    patch -d "${_realname}" -Np1 -i "${srcdir}/alsa_sdl_audiodriver.patch"
}

package() {
  make -C "${_realname}" DESTDIR="${pkgdir}" install

  install -Dm644 "${pkgdir}/usr/share/doc/steam/steam_install_agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/steam/lib/udev/rules.d/99-HTC-Vive-perms.rules" "${pkgdir}/usr/lib/udev/rules.d/98-HTC-Vive-perms.rules"
  # https://steamcommunity.com/app/353370/discussions/0/490123197956024380/
  # https://bugs.archlinux.org/task/47995
  install -Dm644 "${srcdir}/99-steam-controller-perms.rules" "${pkgdir}/usr/lib/udev/rules.d/98-steam-controller-perms.rules"

  # blank steamdeps because no apt-get
  ln -sf /bin/true "${pkgdir}/usr/bin/steamdeps"
}
