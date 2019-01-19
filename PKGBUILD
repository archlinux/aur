# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Det <nimetonmaili g-mail>

pkgname=jre10
pkgver=10.0.2
_major=${pkgver/.*}
pkgrel=1
pkgdesc="Oracle Java Runtime Environment (public release - end of support)"
arch=('x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'gtk2: for Gtk+ look and feel (desktop)')
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}" "java-web-start=${_major}"
          "java-runtime-jre=${_major}" "java-runtime-headless-jre=${_major}" "java-web-start-jre=${_major}"
          "java-openjfx=${_major}" "jre")
conflicts=("java-runtime-jre=${_major}")
backup=("etc/java-${pkgname}/management/jmxremote.access"
        "etc/java-${pkgname}/management/management.properties"
        "etc/java-${pkgname}/security/java.policy"
        "etc/java-${pkgname}/security/java.security"
        "etc/java-${pkgname}/security/javaws.policy"
        "etc/java-${pkgname}/logging.properties"
        "etc/java-${pkgname}/net.properties"
        "etc/java-${pkgname}/sound.properties")
install=${pkgname}.install
source=("http://url.muflone.com/jre-${pkgver}_linux-x64_bin.tar.gz")
sha256sums=('7d2909a597574f1821903790bb0f31aaa57ab7348e3ae53639c850371450845d')
_jvmdir="/usr/lib/jvm/java-${_major}-jre/jre"

package() {
  cd "jre-${pkgver}"

  echo "Creating directory structure..."
  install -d "${pkgdir}/etc/.java/.systemPrefs"
  install -d "${pkgdir}/usr/lib/jvm/java-${_major}-jre/jre/bin"
  install -d "${pkgdir}/usr/lib/mozilla/plugins"
  install -d "${pkgdir}/usr/share/licenses/java${_major}-jre"

  echo "Removing redundancies..."
  rm -r "lib/desktop/icons/HighContrast"
  rm -r "lib/desktop/icons/HighContrastInverse"
  rm -r "lib/desktop/icons/LowContrast"
  rm  lib/fontconfig.*.bfc
  rm  lib/fontconfig.*.properties.src

  echo "Moving contents..."
  mv * "${pkgdir}/${_jvmdir}"

  # Cd to the new playground
  cd "${pkgdir}/${_jvmdir}"

  echo "Fixing directory structure..."
  # Fix bundled .desktops
  sed -e "s|Exec=|Exec=${_jvmdir}/bin/|" \
      -e "s|.png|-${pkgname}.png|" \
      -i lib/desktop/applications/*

  # Move .desktops + icons to /usr/share
  mv lib/desktop/* "${pkgdir}/usr/share/"

  # Suffix .desktops + icon (sun-jcontrol.png -> sun-jcontrol-${pkgname}.png)
  for i in $(find "${pkgdir}"/usr/share/ -type f)
  do
    rename -- "." "-${pkgname}." $i
  done

  # Link missing icons
  for i in $(find "${pkgdir}/usr/share/icons/" -name "sun-jcontrol-${pkgname}.png" -type f)
  do
    ln -s "sun-jcontrol-${pkgname}.png" "${i/jcontrol/java}"
    ln -s "sun-jcontrol-${pkgname}.png" "${i/jcontrol/javaws}"
  done

  # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-${pkgname}/conf -> /etc
  for sub_path in $(find conf/ -type f)
  do
    # New location
    new_etc_path="/etc/java-${pkgname}/${sub_path/conf\/}"

    # Move & link
    install -Dm644 "${sub_path}" "${pkgdir}/${new_etc_path}"
    ln -sf "${new_etc_path}" "${sub_path}"
  done

  # Link NPAPI plugin
  ln -sf "${_jvmdir}/lib/libnpjp2.so" "${pkgdir}/usr/lib/mozilla/plugins/libnpjp2-${pkgname}.so"

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf "/etc/ssl/certs/java/cacerts" "lib/security/cacerts"

  # Move & link licenses
  mv legal/ "${pkgdir}/usr/share/licenses/java${_major}-jre/"
  ln -sf "/usr/share/licenses/java${_major}-jre/" "${pkgdir}/usr/share/licenses/${pkgname}"

  echo "Enabling copy+paste in unsigned applets..."
  # Copy/paste from system clipboard to unsigned Java applets has been disabled since 6u24:
  # - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
  # - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
  _line=$(awk '/permission/{a=NR}; END{print a}' "${pkgdir}"/etc/java-${pkgname}/security/java.policy)
  sed "${_line} a\\\\n \
    // (AUR) Allow unsigned applets to read system clipboard, see:\n \
    // - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java\n \
    // - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html\n \
    permission java.awt.AWTPermission \"accessClipboard\";" \
    -i "${pkgdir}/etc/java-${pkgname}/security/java.policy"
}
