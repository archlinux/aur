# Maintainer: Markus Heidelberg <markus dot heidelberg at web dot de>

pkgname=microchip-libraries-for-applications-legacy
pkgver=v2013_06_15
pkgrel=1
pkgdesc="Microchip Libraries for Applications (Legacy)"
arch=('i686' 'x86_64')
url="http://www.microchip.com/MLA"
license=('custom')
optdepends=('java-runtime: Graphics and TCP/IP utilities support')
makedepends=('fakechroot')
[ $CARCH = x86_64 ] && depends+=('lib32-glibc' 'lib32-fakeroot')
options=(!strip libtool staticlibs emptydirs !zipman)
install=$pkgname.install
_instdir=/opt/microchip_solutions
_installer=${pkgname//-legacy/}-${pkgver//_/-}-linux-installer.run
source=(http://ww1.microchip.com/downloads/en/softwarelibrary/$_installer
        LICENSE)
[ $CARCH = x86_64 ] && source+=(fakechroot-i686.pkg.tar.xz::http://www.archlinux.org/packages/extra/i686/fakechroot/download/)

md5sums=('2b4d56053e22b47196ff370267f3505e'
         'dd2eec20ed33d2924fa301cea78467fa')
[ $CARCH = x86_64 ] && md5sums+=('SKIP')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir"/{bin,etc,usr/{bin,lib,local/lib},tmp}

  ln -s /bin/bash "$pkgdir/bin/"

  echo "root:x:0:0:root:/root:/bin/bash" > "$pkgdir/etc/passwd"
  echo "root:x:0:root" > "$pkgdir/etc/group"

  cp "$srcdir/$_installer" "$pkgdir/"
  chmod 0755 "$pkgdir/$_installer"

  # 10x enter: read license
  # 1x y + enter: accept license [y/n]
  # 1x enter: accept installation directory
  # 13x enter: select components [Y/n]
  # 1x enter: confirm selection [Y/n]
  # 1x enter: start installation [Y/n]
  # 1x enter: continue
  # 1x n + enter: download JRE [Y/n]
  # 1x n + enter: open ReadMe [Y/n]
  echo -e "\n\n\n\n\n\n\n\n\n\ny\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nn\nn" > "$pkgdir/inst_input"

  # do not use $pkgdir$_instdir as installation directory because of the fakechroot environment
  echo "#!/bin/bash
  LD_LIBRARY_PATH=\"$srcdir/usr/lib/libfakeroot/fakechroot\":\$LD_LIBRARY_PATH
  ./$_installer --prefix "$_instdir" --mode text < inst_input &> /dev/null || true"> "$pkgdir/chroot_input.sh"
  chmod 0755 "$pkgdir/chroot_input.sh"

  echo -e "Creating the Package\n  Please wait..."

  fakechroot chroot "$pkgdir" ./chroot_input.sh

  rm "$pkgdir"/{chroot_input.sh,inst_input,$_installer,etc/{group,passwd}}
  rm -r "$pkgdir"/{bin,tmp}

  # remove unwanted files created by the installer, already available in package "microchip-mplabx-bin"
  rm -r "$pkgdir"/{etc,usr/{bin,lib,local}}
  rm "$pkgdir$_instdir"/Uninstall*

  # fix totally messed up file permissions
  find "$pkgdir$_instdir" -type d -exec chmod 0755 '{}' \; -exec chmod ug-s '{}' \;
  find "$pkgdir$_instdir" -type f -exec chmod 0644 '{}' \;

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # executable files
  install -d "$pkgdir/usr/bin"

  # Graphics Resource Converter
  cat << EOF > "$pkgdir/usr/bin/grc-legacy"
#!/bin/sh
java -jar "$_instdir/Microchip/Graphics/bin/grc/grc.jar" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/grc-legacy"

  # External Memory Programmer
  cat << EOF > "$pkgdir/usr/bin/memory_programmer-legacy"
#!/bin/sh
java -jar "$_instdir/Microchip/Graphics/bin/memory_programmer/memory_programmer.jar" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/memory_programmer-legacy"

  # Microchip 2 Binary Information Base
  cat << EOF > "$pkgdir/usr/bin/mib2bib"
#!/bin/sh
java -jar "$_instdir/Microchip/TCPIP Stack/Utilities/mib2bib.jar" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mib2bib"

  # Microchip MPFS Generator
  cat << EOF > "$pkgdir/usr/bin/mpfs2"
#!/bin/sh
java -jar "$_instdir/Microchip/TCPIP Stack/Utilities/MPFS2.jar" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/mpfs2"

  # Microchip Hash Table Filter Entry Calculator"
  cat << EOF > "$pkgdir/usr/bin/hash_calculator"
#!/bin/sh
java -jar "$_instdir/Microchip/TCPIP Stack/Utilities/Hash Calculator.jar"
EOF
  chmod 755 "$pkgdir/usr/bin/hash_calculator"

  # Microchip TCPIP Discoverer
  cat << EOF > "$pkgdir/usr/bin/tcpip_discoverer"
#!/bin/sh
java -jar "$_instdir/Microchip/TCPIP Stack/Utilities/TCPIP Discoverer.jar"
EOF
  chmod 755 "$pkgdir/usr/bin/tcpip_discoverer"
}
