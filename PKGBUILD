# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: klepz <felipe.junger@aluno.ufabc.edu.br>
# Contributor: Dave Blair <mail@dave-blair.de>
# Contributor: James An <james@jamesan.ca>
# Contributor: Mateus Rodrigues Costa <charles [dot] costar [at] gmail [dot] com>

pkgname=chrome-remote-desktop
pkgver=65.0.3325.39
pkgrel=2
pkgdesc="Allows you to securely access your computer over the Internet through Chrome."
url="https://chrome.google.com/webstore/detail/gbchcmhmhahfdphkhkmpfmihenigjmpp"
arch=("x86_64")
license=("BSD")
install="${pkgname}.install"
depends=("gconf" "gtk3" "nss" "python2" "python2-psutil" "xorg-server-xvfb" "xorg-setxkbmap" "xorg-xauth" "xorg-xdpyinfo")
source=("${pkgname}-${pkgver}.deb::http://dl.google.com/linux/direct/${pkgname}_current_amd64.deb"
        "${pkgname}.service" 
        "crd")
sha256sums=("098b877306269200c3e8044c34222db5c1724274f39b171585ad8b2248eaede5"
            "e5da5ae89b5bc599f72f415d1523341b25357931b0de46159fce50ab83615a4b"
            "d9c082c89371539877f0d9d167d73be32c5d9de99ba655be036232e606dcf1c8")

pkgver() {
  bsdtar -xf control.tar.gz -O control | grep "^Version: " | cut -f2 -d' '
}

build() {
  cd "${srcdir}"

  msg2 "Extracting data from debian package"
  bsdtar -xf data.tar.xz -C .
  
  msg2 "Removing unnecessary .deb related files"
  rm -R etc/cron.daily
  rm -R etc/init.d
  rm -R etc/pam.d
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/etc"
  install -d "${pkgdir}/opt"
  
  cp -r "etc/"* "${pkgdir}/etc"
  cp -r "opt/"* "${pkgdir}/opt"

  msg2 "Packaging copyright file"
  install -Dm644 "usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"

  msg2 "Adding systemd user service file"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  msg2 "Adding runnable crd command"
  install -Dm755 "crd" "${pkgdir}/usr/bin/crd"
  
  msg2 "Creating symlinks for Chromium compatibility"
  install -dm755 "${pkgdir}/etc/chromium/native-messaging-hosts"
  
  for _file in $(find "${pkgdir}/etc/opt/chrome/native-messaging-hosts" -type f); do
    _filename=${_file##*/}
    if [[ ! -f "/etc/chromium/native-messaging-hosts/${_filename}" ]]; then
      ln -s "/etc/opt/chrome/native-messaging-hosts/${_filename}" "${pkgdir}/etc/chromium/native-messaging-hosts/${_filename}"
    fi
  done
  
  msg2 "Setting uid root to user-session command"
  chmod u+s "${pkgdir}/opt/google/chrome-remote-desktop/user-session"
}
