# Maintainer: Rainmaker <rainmaker52@gmail.com>
# Original script by: M0Rf30

pkgname=virtualbox-bin
pkgver=5.1.10
_build=112026
pkgrel=1
pkgdesc='Oracle VM VirtualBox Binary Edition (Oracle branded non-OSE version)'
arch=('i686' 'x86_64')
url='http://virtualbox.org/'
license=('GPL2')
options=('!strip')
depends=(
  'dkms'
  'fontconfig'
  'gcc'
  'libgl'
  'libidl2'
  'libxcursor'
  'libxinerama'
  'libxmu'
  'linux-headers'
  'python2'
  'sdl'
)
optdepends=('virtualbox-ext-oracle: for Oracle extensions')
provides=("virtualbox=${pkgver}")
conflicts=('virtualbox' 'virtualbox-host-dkms' 'virtualbox-host-modules-arch')
replaces=('virtualbox_bin' 'virtualbox-sun')
backup=('etc/vbox/vbox.cfg' 'etc/conf.d/vboxweb')
install='install'
_arch='amd64'
[[ "${CARCH}" = i686 ]] && _arch='x86'
source=(
  "VirtualBox-${pkgver}-${_build}-Linux_${_arch}.run::http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}-${_build}-Linux_${_arch}.run"
  'VBoxFixUSB'
  '10-vboxdrv.rules'
  'vboxweb.rc'
  'vboxweb.conf'
  'do_dkms'
  'dkms.conf'
)


md5sums=('5d7518b7c73924762fd01e6efe3075e2'
         '2d04c2e2d8c71558c910a51ec773731a'
         'fe60f9510502bea67383d9198ae8c13c'
         'c159d683ba1947290fc2ad2c64194150'
         '3ac185709bfe688bb753c46e170d0546'
         '31144fa409c0d7c6b464d44b2140b521'
         '05175249e1206c491b2b36670e8db9ec')

_installdir='/opt/VirtualBox'

package() {
  # Check and unpack the run package via sh(1)
  echo yes | sh "VirtualBox-$pkgver-$_build-Linux_$_arch.run" --target "$srcdir" \
    --nox11 --noexec &> /dev/null

  # Unpack bundled files
  install -d "$pkgdir/$_installdir"
  tar -jxf "$srcdir/VirtualBox.tar.bz2" -C "$pkgdir/$_installdir"

  # Hardened build: Mark binaries suid root, create symlinks for working around
  #                 unsupported $ORIGIN/.. in VBoxC.so and make sure the
  #                 directory is only writable by the user (paranoid).
  cd "$pkgdir/$_installdir"
  chmod 4511 VirtualBox VBox{SDL,Headless,NetDHCP,NetNAT,NetAdpCtl,VolInfo}
  for _lib in VBox{VMM,RT}.so; do
    ln -sf "$_installdir/$_lib" "components/$_lib"
  done
  chmod go-w "$pkgdir/$_installdir"

  # Install the SDK
  pushd 'sdk/installer'
  VBOX_INSTALL_PATH="${_installdir}" python2 vboxapisetup.py install --root "${pkgdir}"
  rm -r -f build
  popd

  # Install udev rules
  install -D -m 0644 "$srcdir/10-vboxdrv.rules" "$pkgdir/usr/lib/udev/rules.d/10-vboxdrv.rules"
  # we need to copy and not symlink VBoxCreateUSBNode.sh in /usr/lib/udev to avoid udevd
  # to look /opt when /opt is not mounted. This can be done until VBoxCreateUSBNode.sh doesn't
  # need more stuff from /opt
  cp VBoxCreateUSBNode.sh "$pkgdir/usr/lib/udev/"

  # Install Fixusb script
  install -D -m 0755 "$srcdir/VBoxFixUSB" VBoxFixUSB

  # Patch "vboxshell.py" to use Python 2.x instead of Python 3
  sed -i 's#/usr/bin/python#\02#' vboxshell.py

  # Install vboxweb initscript
  install -D -m 0755 "$srcdir/vboxweb.rc" "$pkgdir/etc/rc.d/vboxweb"
  install -D -m 0644 "$srcdir/vboxweb.conf" "$pkgdir/etc/conf.d/vboxweb"

  # Symlink the launchers. Second link can fail if fs is not case sensitive.
  install -d -m 0755 "$pkgdir/usr/bin"
  for _bin in VirtualBox VBox{Headless,Manage,SDL,SVC,Tunctl,NetAdpCtl,FixUSB} rdesktop-vrdp; do
    ln -s "$_installdir/$_bin" "$pkgdir/usr/bin/$_bin"
    ln -s "$_installdir/$_bin" "$pkgdir/usr/bin/${_bin,,}" &>/dev/null || :
  done

  # Symlink the desktop icon and ".desktop" files
  install -d -m 0755 "$pkgdir/usr/"{share/applications,share/pixmaps}
  ln -s "$_installdir/VBox.png" "$pkgdir/usr/share/pixmaps/VBox.png"
  ln -s "$_installdir/icons/128x128/virtualbox.png" "$pkgdir/usr/share/pixmaps/virtualbox.png"
  ln -s "$_installdir/virtualbox.desktop" "$pkgdir/usr/share/applications/virtualbox.desktop"

  # Symlink mime info
  install -d -m 0755 "$pkgdir/usr/share/mime/packages"
  ln -s "$_installdir/virtualbox.xml" "$pkgdir/usr/share/mime/packages/virtualbox.xml"

  # Symlink doc
  install -d -m 0755 "$pkgdir/usr/share/doc/$pkgname"
  ln -s "$_installdir/VirtualBox.chm" "$pkgdir/usr/share/doc/$pkgname/virtualbox.chm"

  # Symlink icons
  pushd icons
  for _dir in *; do
    cd "$_dir"
    install -d -m 0755 "$pkgdir/usr/share/icons/hicolor/$_dir/"{apps,mimetypes}
    for _icon in *; do
      if [[ "$_icon" = 'virtualbox.png' ]]; then
          ln -s "$_installdir/icons/$_dir/$_icon" "$pkgdir/usr/share/icons/hicolor/$_dir/apps/$_icon"
      else
          ln -s "$_installdir/icons/$_dir/$_icon" "$pkgdir/usr/share/icons/hicolor/$_dir/mimetypes/$_icon"
      fi
    done
    cd - >/dev/null
  done
  popd

  # With the relase of VBox 5.1.0, Oracle dropped DKMS from their package
  # We will restore DKMS with the use of these config files
  install -m 0755 "${srcdir}/do_dkms" "${pkgdir}/${_installdir}/src/vboxhost/do_dkms"
  # Update module version
  sed -i "s/PACKAGE_VERSION=/PACKAGE_VERSION=${pkgver}/" "${srcdir}/dkms.conf"
  install -m 0644 "${srcdir}/dkms.conf" "${pkgdir}/${_installdir}/src/vboxhost/dkms.conf"

  # module sources in /usr/src
  install -d -m 0755 "${pkgdir}/usr/src"
  mv "${pkgdir}/${_installdir}/src/vboxhost" "${pkgdir}/usr/src/vboxhost-${pkgver}"

  # Write the configuration file
  install -D -m 0644 /dev/null "$pkgdir/etc/vbox/vbox.cfg"
  cat > "$pkgdir/etc/vbox/vbox.cfg" <<EOF
# VirtualBox installation directory"
INSTALL_DIR='$_installdir'

# VirtualBox version
INSTALL_VER='$pkgver'
INSTALL_REV='$_build'
EOF

  # Write modules-load.d configuration to ensure that modules are loaded at boot
  install -Dm644 /dev/null "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
  printf \
  "# Load virtualbox kernel modules at boot.\n# This file was installed by the ${pkgname} AUR package\n\nvboxdrv\nvboxpci\nvboxnetadp\nvboxnetflt" > \
  "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"

}

# vim:set ts=2 sw=2 ft=sh et:

