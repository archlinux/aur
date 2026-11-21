# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: klepz <felipe.junger@aluno.ufabc.edu.br>
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=chrome-remote-desktop
pkgver=159.0.8154.7
pkgrel=1
pkgdesc="Access other computers or allow another user to access your computer securely over the Internet"
arch=("x86_64")
url="https://remotedesktop.google.com"
license=("BSD-3-Clause")
depends=("dbus" "gtk3" "libutempter" "libxss" "libxtst" "mesa" "nss" "python-dbus" "python-packaging" "python-psutil" "python-pyxdg" "xf86-video-dummy" "xorg-server-xvfb" "xorg-setxkbmap" "xorg-xauth" "xorg-xdpyinfo" "xorg-xrandr")
options=('!debug' '!strip')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.deb::https://dl.google.com/linux/${pkgname}/deb/pool/main/c/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
  "pamrule"
  "crd"
  "xorg-binary-path.patch"
)
sha256sums=('2b883528d5605bbb0cc01731444f83ad919d5301efdcca6d5512225c3b3c47ea'
            'fcc38269eb1cc902abff9688eda9377a22367e39b9f111f87c0dd8e77adb82e2'
            'e4105af96f029a80275986a0b19c7eaf563034230b20ee4d9158e1169d155e6d'
            '12c871fdad25ac6ddae99fec55d18d91b74581bf5dec4dad114d96ef4c63dd98')

latestver() {
  curl -qs https://dl.google.com/linux/chrome-remote-desktop/deb/dists/stable/main/binary-amd64/Packages | awk '/^Version:/{print $2}' | sort -V | tail -1
}

prepare() {
  cd "${srcdir}"

  bsdtar -xf data.tar.xz -C .
  
  # Removing unnecessary .deb related files
  rm -rf "${srcdir}/etc/cron.daily"
  rm -rf "${srcdir}/etc/init.d"
  rm -rf "${srcdir}/etc/pam.d"

  # Upstream probes /usr/lib/xorg/Xorg, which this xorg-server no longer
  # ships, and otherwise falls back to "Xorg" from PATH — on Arch a script
  # that execs the setuid /usr/lib/Xorg.wrap, which refuses to start the
  # server for non-console users, so the CRD systemd user session would never
  # get a display. Point it at the real binary instead.
  patch -Np1 -i "${srcdir}/xorg-binary-path.patch"
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/etc/"* "${pkgdir}/etc"
  cp -r "${srcdir}/opt/"* "${pkgdir}/opt"
  install -Dm644 "${srcdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
  install -Dm644 "${srcdir}/lib/systemd/system/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
  install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf" <<END
g ${pkgname} -
END
  install -Dm644 "${srcdir}/pamrule" "${pkgdir}/etc/pam.d/${pkgname}"
  install -Dm755 "${srcdir}/crd" "${pkgdir}/usr/bin/crd"
  install -dm755 "${pkgdir}/etc/chromium/native-messaging-hosts"
  
  for _file in $(find "${pkgdir}/etc/opt/chrome/native-messaging-hosts" -type f); do
    local _filename=$(basename ${_file})
    if [[ ! -f "/etc/chromium/native-messaging-hosts/${_filename}" ]]; then
      ln -s "/etc/opt/chrome/native-messaging-hosts/${_filename}" "${pkgdir}/etc/chromium/native-messaging-hosts/${_filename}"
    fi
  done
  # user-session removed in recent versions
}
