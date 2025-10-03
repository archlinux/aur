# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=snapcast
pkgver=0.34.0
pkgrel=1
_pkgname_snapweb=snapweb
_snapweb_version=0.9.2
pkgdesc="Synchronous multi-room audio player"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/badaix/snapcast"
license=('GPL-1.0-or-later')
depends=(alsa-lib avahi libvorbis flac opus expat libsoxr libpulse libpipewire openssl)
optdepends=("python-websocket-client: stream plugin script"
  "python-mpd2: stream plugin script"
  "python-musicbrainzngs: stream plugin script"
  "python-requests: general plugin support"
  "python-gobject: mpris and mpd plugin support"
  "libnotify: mpris plugin support"
  "python-dbus: mpris plugin support")
makedepends=(cmake alsa-utils boost)
install="snapcast.install"
backup=('etc/default/snapserver' 'etc/default/snapclient' 'etc/snapserver.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/badaix/snapcast/archive/v${pkgver}.tar.gz"
  "${_pkgname_snapweb}-${_snapweb_version}.zip::https://github.com/badaix/snapweb/releases/download/v${_snapweb_version}/snapweb.zip"
  "snapcast.sysusers"
  "snapcast.tmpfiles"
  "snapcast.install")
noextract=("${_pkgname_snapweb}-${_snapweb_version}.zip")
sha256sums=('a2918ea4d1f9b2df9c4247fd71bd452ea03a5d20ac44f60a736df90488858944'
            'e4ebeb911d4485daa469a12238d935721d4577612f9b5e43d2febf105f5a4660'
            '9fe6e9e07adb77f555a617b772e6d01e098e1dfaad1e8075e03a7d7ba76141de'
            'e8c3441c4ca646a9b66d61355e90862fd3481562ae3b4e0a4bc1c978464ae2c7'
            '23a0390774279f8c5d02d3307cfb67f2e9360f42704bb4f13d8c43e091fe997f')

prepare() {
  mkdir -p ${_pkgname_snapweb}-${_snapweb_version}
  bsdtar -xf ${_pkgname_snapweb}-${_snapweb_version}.zip -C ${_pkgname_snapweb}-${_snapweb_version}
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DBUILD_WITH_PULSE=ON \
    -DBUILD_WITH_PIPEWIRE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 bin/snapserver "${pkgdir}/usr/bin/snapserver"
  install -Dm644 server/snapserver.1 "${pkgdir}/usr/share/man/man1/snapserver.1"
  install -Dm644 server/etc/snapserver.conf "${pkgdir}/etc/snapserver.conf"
  # install snapweb
  for file in ${srcdir}/${_pkgname_snapweb}-${_snapweb_version}/*\.*; do
    install -Dm 644 ${file} -t "${pkgdir}/usr/share/snapserver/snapweb/"
  done
  for file in ${srcdir}/${_pkgname_snapweb}-${_snapweb_version}/assets/*\.*; do
    install -Dm 644 ${file} -t "${pkgdir}/usr/share/snapserver/snapweb/assets/"
  done
  for file in server/etc/plug-ins/*\.*; do
    install -Dm 755 ${file} -t "${pkgdir}/usr/share/snapserver/plug-ins/"
  done

  install -Dm755 bin/snapclient "${pkgdir}/usr/bin/snapclient"
  install -Dm644 client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

  install -Dm644 extras/package/debian/snapserver.service "${pkgdir}/usr/lib/systemd/system/snapserver.service"
  install -Dm644 extras/package/debian/snapserver.default "${pkgdir}/etc/default/snapserver"
  install -Dm644 extras/package/debian/snapclient.service "${pkgdir}/usr/lib/systemd/system/snapclient.service"
  install -Dm644 extras/package/debian/snapclient.default "${pkgdir}/etc/default/snapclient"

  install -Dm644 "${srcdir}/snapcast.sysusers" "${pkgdir}/usr/lib/sysusers.d/snapclient.conf"
  install -Dm644 "${srcdir}/snapcast.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/snapclient.conf"

  # install documentation
  install -d "${pkgdir}/usr/share/doc/${pkgname}/control"
  cp -R doc/* "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "changelog.md" "${pkgdir}/usr/share/doc/${pkgname}"

  find "${pkgdir}"/usr/share/doc/${pkgname} -type f -exec chmod 0644 {} \;
  find "${pkgdir}"/usr/share/doc/${pkgname} -type d -exec chmod 0755 {} \;

  # example control scripts
  cp -R control/* "${pkgdir}/usr/share/doc/${pkgname}/control/"
}
