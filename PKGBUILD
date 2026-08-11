# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Fredy García <frealgagu at gmail dot com>
# Contributor: klepz <felipe.junger@aluno.ufabc.edu.br>
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=chrome-remote-desktop
pkgver=152.0.7977.9
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
  "xdg-base-directory.patch"
)
sha256sums=('fc6e10808f589a0475ce20a0038c902701e9e59cfb0ac810a45116f8c057f9e7'
            'fcc38269eb1cc902abff9688eda9377a22367e39b9f111f87c0dd8e77adb82e2'
            'e4105af96f029a80275986a0b19c7eaf563034230b20ee4d9158e1169d155e6d'
            '90bcfab85a87cfa6d038a55c556206f74b22eb03644ea51f46732cfb27679963')

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

  # Fix problem with missing import xdg.BaseDirectory, fixing xorg_binary location
  patch -Np1 -i "${srcdir}/xdg-base-directory.patch"
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
