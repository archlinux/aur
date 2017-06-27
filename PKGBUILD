# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributors: Det, JavaAtom, Ethan Hall, Giovanni Santini, Guillaume ALAUX, Daniel J Griffiths,
#               Jason Chu, Geoffroy Carrier, Thomas Dziedzic, Dan Serban, Firas Zaidan

_pkgname=jdk
pkgname=jdk5
_major=5
_minor=22
pkgver=${_major}u${_minor}
pkgrel=1
pkgdesc="Oracle Java $_major Development Kit (public release - end of support)"
arch=('i686' 'x86_64')
url=https://www.java.com/en/download/faq/java_5.xml
license=('custom')
depends=('ca-certificates-java' 'desktop-file-utils' 'hicolor-icon-theme' 'java-environment-common'
         'java-runtime-common' 'libx11' 'libxrender' 'libxslt' 'libxtst' 'shared-mime-info' 'xdg-utils')
optdepends=('alsa-lib: for basic sound support'
            'derby: for Oracle Apache Derby Java database (AUR)'
            'eclipse: "Oracle Java Mission Control" plugins for Eclipse'
            'gtk2: for Gtk+ look and feel (desktop)'
            'ttf-font: fonts'
            'visualvm: for lightweight profiling capabilities')
provides=("java-runtime=$_major" "java-runtime-headless=$_major" "java-web-start=$_major" "java-environment=$_major"
          "java-runtime-jre=$_major" "java-runtime-headless-jre=$_major" "java-web-start-jre=$_major" "java-environment-jdk=$_major")

# Variables
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')
if [[ $CARCH = x86_64 ]]; then
_arch=amd64
_arch2=$_arch
else # Force fallback to i386 for AUR
  _arch=i586
  _arch2=i386
fi
_jname=${_pkgname}${_major}
_jvmdir=/usr/lib/jvm/java-$_major-$_pkgname

backup=("etc/java-$_jname/$_arch2/jvm.cfg"
        "etc/java-$_jname/$_arch2/server/Xusage.txt"
        "etc/java-$_jname/images/cursors/cursors.properties"
        "etc/java-$_jname/management/jmxremote.access"
        "etc/java-$_jname/management/jmxremote.password.template"
        "etc/java-$_jname/management/management.properties"
        "etc/java-$_jname/management/snmp.acl.template"
        "etc/java-$_jname/security/java.policy"
        "etc/java-$_jname/security/java.security"
        "etc/java-$_jname/content-types.properties"
        "etc/java-$_jname/flavormap.properties"
        "etc/java-$_jname/fontconfig.properties.src"
        "etc/java-$_jname/jvm.hprof.txt"
        "etc/java-$_jname/logging.properties"
        "etc/java-$_jname/net.properties"
        "etc/java-$_jname/psfont.properties.ja"
        "etc/java-$_jname/psfontj2d.properties"
        "etc/java-$_jname/sound.properties")
options=(!strip) # JDK debug-symbols
install=$pkgname.install
source=('javaws-launcher'
        "jconsole-$_jname.desktop"
        "jmc-$_jname.desktop"
        "jvisualvm-$_jname.desktop"
        "policytool-$_jname.desktop"
        "http://download.oracle.com/otn-pub/java/jce_policy/1.5.0/jce_policy-1_5_0.zip")

# NOTE: Please manually download these files from
# http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase5-419410.html
source_i686=("http://download.oracle.com/otn-pub/java/jdk/1.5.0_$_minor/jdk-1_5_0_$_minor-linux-i586.bin")
source_x86_64=("http://download.oracle.com/otn-pub/java/jdk/1.5.0_$_minor/jdk-1_5_0_$_minor-linux-amd64.bin")

md5sums=('45c15a6b4767288f2f745598455ea2bf'
         '53791b5a3760001717835e1964ecbe9a'
         '5394b9d4bf6c50ffe9dfe855c7c81741'
         'ee554e0942d784c067015c011283e516'
         'e07e3edd343022795feb877f97207e5c'
         '169441bba1ca95e84e030e116f258d79')
md5sums_i686=('df5dae6d50d2abeafb472dde6d9a17f3')
md5sums_x86_64=('b62abcaf9ea8617c50fa213bbc88824a')

package() {
  msg2 "Extracting the .bin"
  rm -rf ${_pkgname}1.${_major}.0_${_minor}
  sh $_pkgname-1_5_0_$_minor-linux-$_arch.bin > /dev/null <<< "yes"

  msg2 "Creating required dirs"
  cd ${_pkgname}1.${_major}.0_${_minor}
  install -d "$pkgdir"/{usr/{lib/{jvm/java-$_major-$_pkgname/bin,mozilla/plugins},share/licenses/java$_major-$_pkgname},etc/.java/.systemPrefs}

  msg2 "Preparing"
  # Link duplicate binaries from jre/
  for i in $(ls jre/bin/); do
    ln -sf $_jvmdir/jre/bin/$i bin/$i
  done

  # Link NPAPI plugin
  ln -sf $_jvmdir/jre/lib/$_arch2/libnpjp2.so "$pkgdir"/usr/lib/mozilla/plugins/libnpjp2-$_jname.so

  # Replace JKS keystore with 'ca-certificates-java'
  ln -sf /etc/ssl/certs/java/cacerts jre/lib/security/cacerts

  # Suffix man pages
  rename -- ".1" "-$_jname.1" man/{,ja_JP.eucJP/}man1/*

  msg2 "Removing redundancies"
  rm -r jre/lib/fontconfig.*.{bfc,properties.src} jre/{COPYRIGHT,LICENSE,README,*.txt} man/ja

  msg2 "Moving stuff in place"
  # .desktops + icons
  mkdir -p "$pkgdir"/usr/share/applications/
  install -m644 "$srcdir"/*.desktop "$pkgdir"/usr/share/applications/

  # Move/link configs: /usr/lib/jvm/java-$_jname/jre/lib -> /etc
  for new_etc in ${backup[@]}; do
    old_usr=jre/lib/${new_etc#*$_jname/}
    install -Dm644 $old_usr "$pkgdir"/$new_etc
    ln -sf /$new_etc $old_usr
  done

  # Man pages
  mv man/ja_JP.eucJP/ man/ja/
  mv man/ "$pkgdir"/usr/share/

  # Licenses
  mv COPYRIGHT LICENSE *.txt "$pkgdir"/usr/share/licenses/java$_major-$_pkgname/
  ln -sf /usr/share/licenses/java$_major-$pkgname/ "$pkgdir"/usr/share/licenses/$pkgname

  # Java Cryptography Extension (JCE) Unlimited Strength files
  rename -- ".jar" "-limited.jar" jre/lib/security/*
  install -Dm644 "$srcdir"/jce/* jre/lib/security/

  # Do the move
  mv * "$pkgdir"/$_jvmdir

  msg2 "Enabling copy+paste in unsigned applets"
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
