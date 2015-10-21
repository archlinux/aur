# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: an7oine <an7oine at me com>
pkgname=dvbhdhomerun-git
pkgver=20151021
pkgrel=1
pkgdesc="A linux DVB driver for the HDHomeRun (http://www.silicondust.com)"
arch=('i686' 'x86_64' 'arm')
url="http://sourceforge.net/apps/trac/dvbhdhomerun/wiki"
license=('GPL')
groups=()
depends=('libhdhomerun')
makedepends=('git' 'gcc-libs' 'bash')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='dvbhdhomerun-git.install'
source=('userhdhomerun.rc.d' 'userhdhomerun.service')
noextract=()
md5sums=('8db3071fb3c4b7603a6b1fe2b9248388'
         '84388e51257ad98505453e5782c5bf35')

_gitroot=https://github.com/h0tw1r3/dvbhdhomerun.git
_gitname=dvbhdhomerun

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  cd kernel
  make
  cd ..

  cd userhdhomerun
  sed -i 's/hdhomerun_discover_find_devices_custom/&_v2/' hdhomerun_controller.cpp
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  cd kernel
  make INSTALL_MOD_PATH="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  mkdir -p "${pkgdir}/etc/modules-load.d"
  install "${srcdir}/${_gitname}-build/debian/dvbhdhomerun-utils.udev" \
"${pkgdir}/usr/lib/udev/rules.d/dvbhdhomerun-utils.rules"
  echo "dvb_hdhomerun" > "${pkgdir}/etc/modules-load.d/dvbhdhomerun.conf"

  _device_id="$( hdhomerun_config discover |cut -d ' ' -s -f 3 )"
  if [ "${_device_id}" = "" ]
	then _device_id=FFFFFFFF
  fi
  cat > "${pkgdir}/etc/dvbhdhomerun" <<EOF
[${_device_id}-0]
tuner_type=DVB-T

[${_device_id}-1]
tuner_type=DVB-T
EOF

  cd ..

  cd userhdhomerun
  PREFIX=/usr make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/etc/rc.d"
  install -m0755 "${srcdir}/userhdhomerun.rc.d" "${pkgdir}/etc/rc.d/userhdhomerun"

  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -m0644 "${srcdir}/userhdhomerun.service" "${pkgdir}/usr/lib/systemd/system/userhdhomerun.service"
}

# vim:set ts=2 sw=2 et:
