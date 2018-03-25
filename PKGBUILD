# Maintainer: Det <nimetonmaili g-mail>

pkgname=jre
pkgver=10
_major=${pkgver/.*}
_build=46
_hash=76eac37278c24557a3c4199677f19b62
_jname=${pkgname}${_major}
pkgrel=1
pkgdesc="Oracle Java Runtime Environment"
arch=('x86_64')
url="http://www.oracle.com/technetwork/java/javase/downloads/index.html"
license=('custom:Oracle')
depends=('ca-certificates-java' 'hicolor-icon-theme' 'java-runtime-common' 'nss' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'gtk2: for Gtk+ look and feel (desktop)')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major"
          "java-openjfx=$_major" "$_jname")
conflicts=("$_jname")
_jvmdir=/usr/lib/jvm/java-$_major-$pkgname/jre
backup=("etc/java-$_jname/management/jmxremote.access"
        "etc/java-$_jname/management/management.properties"
        "etc/java-$_jname/security/java.policy"
        "etc/java-$_jname/security/java.security"
        "etc/java-$_jname/security/javaws.policy"
        "etc/java-$_jname/logging.properties"
        "etc/java-$_jname/net.properties"
        "etc/java-$_jname/sound.properties")
install=$pkgname.install
source=("http://download.oracle.com/otn-pub/java/jdk/${pkgver}+${_build}/${_hash}/${pkgname}-${pkgver}_linux-x64_bin.tar.gz"
        "policytool.desktop")
sha256sums=('9c147ae25aceccf5bc2c9a878d0e7e5885b21ffbd861db6f8241d10915e38ab2'
            '175bf53f43aa42bcf719b9d08d6cbc926fb6e3fbdf2eea7a8090c1750a285a7f')

DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -b oraclelicense=a -o %o %u')

package() {
  cd $pkgname-$pkgver

  msg2 "Creating directory structure..."
  install -d "$pkgdir"/etc/.java/.systemPrefs
  install -d "$pkgdir"/usr/lib/jvm/java-$_major-$pkgname/jre/bin
  install -d "$pkgdir"/usr/lib/mozilla/plugins
  install -d "$pkgdir"/usr/share/licenses/java$_major-$pkgname

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
  sed -e "s|Exec=|Exec=$_jvmdir/bin/|" \
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
  mv legal/ "$pkgdir"/usr/share/licenses/java$_major-$pkgname/
  ln -sf /usr/share/licenses/java$_major-$pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

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
