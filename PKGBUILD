# Maintainer: Det <nimetonmaili g-mail>

_pkgname=jre
pkgname=jre-devel
_major=11
_build=7
_jname=${_pkgname}${_major}
pkgver=${_major}b${_build}
pkgrel=1
pkgdesc="Oracle Java $_major Runtime Environment Snapshot"
arch=('x86_64')
url="http://jdk.java.net/$_major/"
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'gtk2: for Gtk+ look and feel (desktop)')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major"
          "java-openjfx=$_major" "$_jname")
conflicts=("$_jname")
_jvmdir=/usr/lib/jvm/java-$_major-$_pkgname/jre
backup=("etc/java-$_jname/management/jmxremote.access"
        "etc/java-$_jname/management/management.properties"
        "etc/java-$_jname/security/java.policy"
        "etc/java-$_jname/security/java.security"
        "etc/java-$_jname/security/javaws.policy"
        "etc/java-$_jname/logging.properties"
        "etc/java-$_jname/net.properties"
        "etc/java-$_jname/sound.properties")
install=$pkgname.install
source=("https://download.java.net/java/early_access/jdk${_major}/${_build}/BCL/${_pkgname}-${_major}-ea+${_build}_linux-x64_bin.tar.gz"
        "policytool.desktop"
        'LICENSE-Early-Adopter-Development-Agreement.txt')
sha256sums=('9ac2b81412dce632c0509bfcd49ecda258b80dd67b7353687b61664bb86c1c29'
            'b36201e2de826393ed8a14d298a5197f205775c2609a5b8857384324e9fc0227'
            '36d48f14c16f0dcc98a8ce2301fd2a111701e6f59a7da08b0e51fdb3e2f9ca89')

package() {
  cd $_pkgname-$_major

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/etc/.java/.systemPrefs
  install -d "$pkgdir"/usr/lib/jvm/java-$_major-$_pkgname/jre/bin
  install -d "$pkgdir"/usr/lib/mozilla/plugins
  install -d "$pkgdir"/usr/share/licenses/java$_major-$_pkgname

  msg2 "Removing redundancies..."
  rm -r lib/desktop/icons/HighContrast
  rm -r lib/desktop/icons/HighContrastInverse
  rm -r lib/desktop/icons/LowContrast
  rm  lib/fontconfig.*.bfc
  rm  lib/fontconfig.*.properties.src

  msg2 "Moving contents..."
  mv * "$pkgdir"/$_jvmdir

  # Cd to the new playground
  cd "$pkgdir"/$_jvmdir

  msg2 "Fixing directory structure..."
  # Fix bundled .desktops
  sed -e '/JavaWS/!s|Name=Java|Name=Java '"$_major"'|' \
      -e "s|Name=JavaWS|Name=JavaWS $_major|" \
      -e "s|Comment=Java|Comment=Java $_major|" \
      -e "s|Exec=|Exec=$_jvmdir/bin/|" \
      -e "s|.png|-$_jname.png|" \
      -i lib/desktop/applications/*

  # Move .desktops + icons to /usr/share
  mv lib/desktop/* "$pkgdir"/usr/share/
  install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

  # Suffix .desktops + icon (sun-jcontrol.png -> sun-jcontrol-$_jname.png)
  for i in $(find "$pkgdir"/usr/share/ -type f); do
    rename -- "." "-$_jname." $i
  done

  # Write versions to .desktops + .install
  sed -i "s/<version>/$_major/" "$pkgdir"/usr/share/applications/* "$startdir"/$pkgname.install

  # Link missing icons
  for i in $(find "$pkgdir"/usr/share/icons/ -name "sun-jcontrol-$_jname.png" -type f); do
    ln -s "sun-jcontrol-$_jname.png" "${i/jcontrol/java}"
    ln -s "sun-jcontrol-$_jname.png" "${i/jcontrol/javaws}"
  done

  # Move confs to /etc and link back to /usr: /usr/lib/jvm/java-$_jname/conf -> /etc
  for sub_path in $(find conf/ -type f); do
    # New location
    new_etc_path="/etc/java-$_jname/${sub_path/conf\/}"

    # Move & link
    install -Dm644 "$sub_path" "$pkgdir/$new_etc_path"
    ln -sf "$new_etc_path" "$sub_path"
  done

  # Link NPAPI plugin
  ln -sf $_jvmdir/lib/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

  # Move & link licenses
  mv legal/ "$pkgdir"/usr/share/licenses/java$_major-$_pkgname/
  install -m644 "$srcdir"/LICENSE-Early-Adopter-Development-Agreement.txt "$pkgdir"/usr/share/licenses/java$_major-$_pkgname/
  ln -sf /usr/share/licenses/java$_major-$_pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

  msg2 "Enabling copy+paste in unsigned applets..."
  # Copy/paste from system clipboard to unsigned Java applets has been disabled since 6u24:
  # - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java
  # - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html
  _line=$(awk '/permission/{a=NR}; END{print a}' "$pkgdir"/etc/java-$_jname/security/java.policy)
  sed "$_line a\\\\n \
    // (AUR) Allow unsigned applets to read system clipboard, see:\n \
    // - https://blogs.oracle.com/kyle/entry/copy_and_paste_in_java\n \
    // - http://slightlyrandombrokenthoughts.blogspot.com/2011/03/oracle-java-applet-clipboard-injection.html\n \
    permission java.awt.AWTPermission \"accessClipboard\";" \
    -i "$pkgdir"/etc/java-$_jname/security/java.policy
}
