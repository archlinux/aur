# Maintainer: randomnobody <nobody "at" 420blaze "dot" it>
# Contributor: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

# To enable macOS guests support, uncomment the line below:
#_enable_macOS_guests=y
# CAUTION: Running macOS on VMware Workstation on non Apple computer is forbidden by
# Apple and VMware EULAs.

# vmware-keymaps dependency is needed to avoid some conflicts when you install
# this package with vmware-horizon-client. If you don't plan to install
# vmware-horizon-client and don't want to add this dependency, you can
# uncomment the line below:
#_remove_vmware_keymaps_dependency=y

#PKGEXT=.pkg.tar
pkgname=vmware-workstation-openrc
pkgver=25H2
_buildver=24995812
_pkgver=${pkgver}_${_buildver}
pkgrel=4
pkgdesc='The industry standard for running multiple operating systems as virtual machines on a single Linux PC. Modified to use OpenRC.'
arch=(x86_64)
url='https://www.vmware.com/products/workstation-for-linux.html'
license=(custom)
install="vmware-workstation.install"
conflicts=(
  vmware-modules-dkms
  vmware-ovftool
  vmware-patch
  vmware-systemd-services
  vmware-workstation
)
provides=(
  vmware-ovftool
  vmware-workstation
)
depends=(
  dkms
  fuse2
  gtkmm3
  libcanberra
  libaio
  pcsclite
  hicolor-icon-theme
  libxcrypt-compat # needed for ovftool
  libxml2-legacy # needed for vmrun
  # needed to use Arch GTK3 library (for theme integration)
  gtk3
  gcr
)
optdepends=(
  'linux-headers: build modules against Arch kernel'
)
makedepends=(
  sqlite
)
backup=(
  'etc/vmware/config'
  'etc/conf.d/vmware'
)

source=(
  "VMware-Workstation-${pkgver}-${_buildver}.${CARCH}.bundle::https://archive.org/download/VMware-Workstation-Full-${pkgver}-${_buildver}.${CARCH}/VMware-Workstation-Full-${pkgver}-${_buildver}.${CARCH}.bundle"

  "https://packages-prod.broadcom.com/tools/frozen/linux/linux.iso"
  "https://packages-prod.broadcom.com/tools/frozen/linux/linuxPreGlibc25.iso"
  "https://packages-prod.broadcom.com/tools/frozen/netware/netware.iso"
  "https://packages-prod.broadcom.com/tools/frozen/solaris/solaris.iso"
  "https://packages-prod.broadcom.com/tools/frozen/windows/winPre2k.iso"
  "https://packages-prod.broadcom.com/tools/frozen/windows/winPreVista.iso"

  "winVistaSP1.iso::https://packages-prod.broadcom.com/tools/frozen/windows/WindowsToolsVista/SP1/windows.iso"
  "winVistaSP2.iso::https://packages-prod.broadcom.com/tools/frozen/windows/WindowsToolsVista/SP2/windows.iso"

  'vmware-bootstrap'
  'vmware-vix-bootstrap'
  'config'
  'configure-initscript.sh'
  'vmware-environment.sh'

  'vmware-networks-configuration'
  'vmware-networks'
  'vmware-usbarbitrator'

  'dkms.conf.in'
  'Makefile'
  'vmmon.patch'
  'vmnet.patch'
)
sha256sums=('9beced8a0653c9382e9aa9917168a54bf5635e566c8cb341589d72cf14093322'
            '4e66b286b743d9cf788c487295b1dec3c6071d657674f650aadc23e8900758ff'
            'aef8f747bd9a6e84d139c57b8c1f8e87c83a9b9df69cd09602030190fec21973'
            '2c89993d811f5d90f7b0e2a286e9339907055e51ecb16f25509e5c4517326487'
            '4666b0adfec6636ecda60bfab889cbf28f06f77526442628a70789fd76823e70'
            'a17a11d65f841d213ffc2d6681acdf849c380e77055334c7a8127c1373991ebb'
            'aab73d3ef4668beec725541c08c41042bb22fc86cd5563310fc170b952631d8a'
            '3b8f9d6e43f5d1dff0576cb93d008c14e0434d7233872f6c63988513d2bda5d1'
            '8f1cc3181055891b98672f715e0ca7bbe4018960eae945d7a4b9f640c44c3d79'
            '67edc40e39686281f5101ced1a250648ae32e4cd5dffe4fd47bc3c7aed929d50'
            'da1698bf4e73ae466c1c7fc93891eba4b9c4581856649635e6532275dbfea141'
            'bcf24ce469527844c60f8fd50fda61a6b65cc326ff6bf026d5ae0576cf749c2c'
            'f2c9272dfa1e3de1de5f5545989e6e3d9f400084decaa5504559a20209648329'
            'b94959a11b28e51b541321be0588190eb10825e9ff55cbd16eb01483a839a69f'
            '6114cab1760bd1393de2ed16d9bc6f01c013a706e1b0a0a7fc34156d6adb7ae9'
            '8534321485f16783a70f8ce78ca04599756a98b955b046af623910e1ee6e412c'
            '452c1bfebac52f4808ba5f4bf2fc3eae9858f8745d60c13d3c46e7550a3e1eb1'
            '7ba8cbdb1981a9a714b4068e651cc7a20ab358dddf6cab68519d9f324ea800b3'
            '273d4357599a3e54259c78cc49054fef8ecfd2c2eda35cbcde3a53a62777a5ac'
            '16f0780792cd66f580a0a872679cac76f8df936a0f2d90ac2d014902d46da58c'
            'cefe79e418a7403bc0a788b1ca695a9463d6c2d9ecbf1ce15125e39e39391c2b')
options=(!strip emptydirs !debug)

if [ -z "$_remove_vmware_keymaps_dependency" ]; then
depends+=(
  vmware-keymaps
)
fi

_extractedimages=(windows)
_isoimages=(linux linuxPreGlibc25 netware solaris winPre2k winPreVista winVistaSP1 winVistaSP2)

if [ -n "$_enable_macOS_guests" ]; then

_vmware_fusion_ver=13.5.2
_vmware_fusion_buildver=23775688
_vmware_fusion_ver_full=${_vmware_fusion_ver}_${_vmware_fusion_buildver}
# List of VMware Fusion versions: https://softwareupdate-prod.broadcom.com/cds/vmw-desktop/fusion/index.html

makedepends+=(
  python
  7zip
  uefitool
)

source+=(
  "https://packages-prod.broadcom.com/tools/frozen/darwin/darwin.iso"
  "https://packages-prod.broadcom.com/tools/frozen/darwin/darwinPre15.iso"
  "unlocker.py"
  "efi-patches.txt"
)

sha256sums+=(
  'e0c96286f376b30e2c2362bd991709f0f6bc6ebd911be4056a58da8698c49236'
  'ef33fc5d152fd9db27cac0b1f21160226dfa5e5b7a501ffa25818682f3b4aaa0'
  '8a61e03d0edbbf60c1c84a43aa87a6e950f82d2c71b968888f019345c2f684f3'
  '392c1effcdec516000e9f8ffc97f2586524d8953d3e7d6f2c5f93f2acd809d91'
)

_fusion_isoimages=(darwin darwinPre15)
fi


_create_database_file() {
  # Create a database which contains the list of guest tools (necessary to avoid that vmware try to download them)
  local database_filename="$pkgdir/etc/vmware-installer/database"
  echo -n "" > "$database_filename"

  sqlite3 "$database_filename" "CREATE TABLE settings(key VARCHAR PRIMARY KEY, value VARCHAR NOT NULL, component_name VARCHAR NOT NULL);"
  sqlite3 "$database_filename" "INSERT INTO settings(key,value,component_name) VALUES('db.schemaVersion','2','vmware-installer');"
  sqlite3 "$database_filename" "CREATE TABLE components(id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, version VARCHAR NOT NULL, buildNumber INTEGER NOT NULL, component_core_id INTEGER NOT NULL, longName VARCHAR NOT NULL, description VARCHAR, type INTEGER NOT NULL);"

  for isoimage in ${_extractedimages[@]}
  do
    local version=$(cat "$srcdir/extracted/vmware-tools-$isoimage/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")
    sqlite3 "$database_filename" "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES('vmware-tools-$isoimage','$version',${_pkgver#*_},1,'$isoimage','$isoimage',1);"
  done

  for isoimage in ${_isoimages[@]}
  do
	  sqlite3 "$database_filename" "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES('vmware-tools-$isoimage','1',${_pkgver#*_},1,'$isoimage','$isoimage',1);"
  done

if [ -n "$_enable_macOS_guests" ]; then
  for isoimage in ${_fusion_isoimages[@]}
  do
	  sqlite3 "$database_filename" "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES('vmware-tools-$isoimage','1',${_vmware_fusion_ver_full#*_},1,'$isoimage','$isoimage',1);"
  done
fi
}

prepare() {
  extracted_dir="$srcdir/extracted"
  [[ -d "$extracted_dir" ]] && rm -r "$extracted_dir"

  bash \
    "$(readlink -f "$srcdir/VMware-Workstation-${_pkgver/_/-}.${CARCH}.bundle")" \
    --extract "$extracted_dir"

if [ -n "$_enable_macOS_guests" ]; then
  sed -i -e "s|/usr/lib/vmware/|${pkgdir}/usr/lib/vmware/|" "$srcdir/unlocker.py"
fi
}

package() {
  local vmware_installer_version=$(cat "$srcdir/extracted/vmware-installer/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")

  # Make directories and copy files.

  mkdir -p \
    "$pkgdir/etc"/{pam.d,modprobe.d,vmware} \
    "$pkgdir/usr"/{share,bin} \
    "$pkgdir/usr/include/vmware-vix" \
    "$pkgdir/usr/lib"/{vmware/setup,vmware-vix,vmware-ovftool,vmware-installer/"$vmware_installer_version",modules-load.d} \
    "$pkgdir/usr/share"/{doc/vmware-vix,licenses/"$pkgname"} \
    "$pkgdir/var/lib/vmware/Shared VMs"

  cd "$srcdir/extracted"

  cp -r \
    vmware-workstation/share/* \
    vmware-workstation/man \
    vmware-network-editor-ui/share/* \
    vmware-player-app/share/* \
    "$pkgdir/usr/share"

  cp -r \
    vmware-workstation/bin/* \
    vmware-vmx/{,s}bin/* \
    vmware-vix-core/bin/* \
    vmware-vprobe/bin/* \
    vmware-player-app/bin/* \
    "$pkgdir/usr/bin"

  cp -r \
    vmware-workstation/lib/* \
    vmware-player-app/lib/* \
    vmware-vmx/{lib/*,roms} \
    vmware-vprobe/lib/* \
    vmware-usbarbitrator/bin \
    vmware-network-editor/lib \
    "$pkgdir/usr/lib/vmware"

  cp -r \
    vmware-player-setup/vmware-config \
    "$pkgdir/usr/lib/vmware/setup"

  cp -r \
    vmware-vix-lib-Workstation1700/lib/Workstation-17.0.0 \
    vmware-vix-core/{lib/*,vixwrapper-config.txt} \
    "$pkgdir/usr/lib/vmware-vix"

  cp -r \
    vmware-vix-core/doc/* \
    "$pkgdir/usr/share/doc/vmware-vix"

  cp -r \
    vmware-ovftool/* \
    "$pkgdir/usr/lib/vmware-ovftool"

  cp -r \
    vmware-installer/{python,sopython,vmis,vmis-launcher,vmware-installer,vmware-installer.py} \
    "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version"

  cp -r \
    vmware-vix-core/include/* \
    "$pkgdir/usr/include/vmware-vix"

  for isoimage in ${_extractedimages[@]}
  do
    install -Dm 644 "vmware-tools-$isoimage/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
  done

  for isoimage in ${_isoimages[@]}
  do
    install -Dm 644 "$srcdir/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
  done

  install -Dm 644 "vmware-workstation/doc/EULA" "$pkgdir/usr/share/doc/vmware-workstation/EULA"
  ln -s "/usr/share/doc/vmware-workstation/EULA" "$pkgdir/usr/share/licenses/$pkgname/VMware Workstation - EULA.txt"
  ln -s "/usr/lib/vmware-ovftool/vmware.eula" "$pkgdir/usr/share/licenses/$pkgname/VMware OVF Tool - EULA.txt"
  install -Dm 644 "vmware-workstation/doc"/open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname/VMware Workstation open source license.txt"
  install -Dm 644 "vmware-workstation/doc"/ovftool_open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname/VMware OVF Tool open source license.txt"
  install -Dm 644 "vmware-vix-core"/open_source_licenses.txt "$pkgdir/usr/share/licenses/$pkgname/VMware VIX open source license.txt"
  rm "$pkgdir/usr/lib/vmware-ovftool"/{vmware-eula.rtf,open_source_licenses.txt,manifest.xml}

  install -d -m 755 "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version"/{lib/lib,artwork}
  install -Dm 755 "$srcdir/configure-initscript.sh" "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version/bin/configure-initscript.sh"

  install -Dm 644 "vmware-vmx/etc/modprobe.d/modprobe-vmware-fuse.conf" "$pkgdir/etc/modprobe.d/vmware-fuse.conf"

  install -Dm 644 vmware-vmx/extra/modules.xml "$pkgdir"/usr/lib/vmware/modules/modules.xml
  install -Dm 644 vmware-installer/bootstrap "$pkgdir"/etc/vmware-installer/bootstrap
  install -Dm 644 "$srcdir"/vmware-vix-bootstrap "$pkgdir"/etc/vmware-vix/bootstrap
  install -Dm 644 "$srcdir"/vmware-bootstrap "$pkgdir"/etc/vmware/bootstrap
  install -Dm 644 "$srcdir"/config "$pkgdir"/etc/vmware/config

if [ -z "$_remove_vmware_keymaps_dependency" ]; then
  rm -r "$pkgdir/usr/lib/vmware/xkeymap" # these files are provided by vmware-keymaps package
fi

  echo -e "vmw_vmci\nvmmon" > "$pkgdir/usr/lib/modules-load.d/vmware.conf"

  for service_file in \
    vmware-networks-configuration \
    vmware-networks \
    vmware-usbarbitrator
  do
    install -Dm 755 \
      "$srcdir/$service_file" \
      "$pkgdir/etc/init.d/$service_file"
  done


  # Apply permissions where necessary.

  chmod +x \
    "$pkgdir/usr/bin"/* \
    "$pkgdir/usr/lib/vmware/bin"/* \
    "$pkgdir/usr/lib/vmware/setup"/* \
    "$pkgdir/usr/lib/vmware/lib"/libvmware-gksu.so/gksu-run-helper \
    "$pkgdir/usr/lib/vmware-ovftool"/{ovftool,ovftool.bin} \
    "$pkgdir/usr/lib/vmware-installer/$vmware_installer_version"/{vmware-installer,vmis-launcher} \
    "$pkgdir/usr/lib/vmware-vix/setup"/*

  chmod +s \
    "$pkgdir/usr/bin"/vmware-authd \
    "$pkgdir/usr/lib/vmware/bin"/{vmware-vmx,vmware-vmx-debug,vmware-vmx-stats}


  # Add symlinks the installer would create.

  for link in \
    licenseTool \
    vmplayer \
    vmware \
    vmware-app-control \
    vmware-enter-serial \
    vmware-fuseUI \
    vmware-gksu \
    vmware-modconfig \
    vmware-modconfig-console \
    vmware-mount \
    vmware-netcfg \
    vmware-setup-helper \
    vmware-tray \
    vmware-vmblock-fuse \
    vmware-vprobe \
    vmware-zenity
  do
    ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/lib/vmware/bin/$link"
  done

  for link in \
    vmrest
  do
    ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/bin/$link"
  done

  for link in \
    vmware-fuseUI \
    vmware-mount \
    vmware-netcfg \
    vmware-usbarbitrator
  do
    ln -s /usr/lib/vmware/bin/$link "$pkgdir/usr/bin/$link"
  done

  ln -s /usr/lib/vmware/icu "$pkgdir/etc/vmware/icu"
  ln -s /usr/lib/vmware-ovftool/ovftool "$pkgdir/usr/bin/ovftool"
  ln -s /usr/lib/vmware-vix/libvixAllProducts.so "$pkgdir/usr/lib/libvixAllProducts.so"


  # Replace placeholder "variables" with real paths.

  for file in \
    gtk-3.0/gdk-pixbuf.loaders
  do
    sed -i 's,@@LIBCONF_DIR@@,/usr/lib/vmware/libconf,g' "$pkgdir/usr/lib/vmware/libconf/etc/$file"
  done

  sed -i 's,@@BINARY@@,/usr/bin/vmware,' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmplayer,' "$pkgdir/usr/share/applications/vmware-player.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmware-netcfg,' "$pkgdir/usr/share/applications/vmware-netcfg.desktop"

  sed \
    -e "s/@@VERSION@@/$vmware_installer_version/" \
    -e "s,@@VMWARE_INSTALLER@@,/usr/lib/vmware-installer/$vmware_installer_version," \
    -i "$pkgdir/etc/vmware-installer/bootstrap"


  # Patch up the VMware kernel sources and configure DKMS.

  dkms_dir="$pkgdir/usr/src/$pkgname-$_pkgver"

  install -Dm 644 "$srcdir/Makefile" "$dkms_dir/Makefile"
  install -Dm 644 "$srcdir/dkms.conf.in" "$dkms_dir/dkms.conf"

  sed \
    -e "s/@PKGNAME@/$pkgname/g" \
    -e "s/@PKGVER@/$_pkgver/g" \
    -i "$dkms_dir/dkms.conf"

  for module in vmmon vmnet; do
    tar -xf "vmware-vmx/lib/modules/source/$module.tar" -C "$dkms_dir"
    msg "Patching $module module for DKMS"
    patch -p2 --read-only=ignore --directory="$dkms_dir/$module-only" < "$srcdir/$module.patch"
  done

  rm -r "$pkgdir/usr/lib/vmware/modules/source"

if [ -n "$_enable_macOS_guests" ]; then
  msg "Patching VMware to enable macOS guest support"
  python3 "$srcdir/unlocker.py" > /dev/null

  for isoimage in ${_fusion_isoimages[@]}
  do
    install -Dm 644 "$srcdir/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
  done

  msg "Patching EFI firmwares to disable macOS server checking"
  _efi_arch=("32" "64" "20-32" "20-64")
  for arch in ${_efi_arch[@]}
  do
    uefipatch "$pkgdir/usr/lib/vmware/roms/EFI${arch}.ROM" "$srcdir/efi-patches.txt" -o "$pkgdir/usr/lib/vmware/roms/EFI${arch}.ROM" > /dev/null
  done
fi

  _create_database_file

  # Define some environment variables for VMware and remove the tests about kernel modules
  install -Dm 644 "$srcdir/vmware-environment.sh" "$pkgdir/etc/conf.d/vmware"
  for program in vmware vmplayer vmware-tray; do
    sed -e '/export PRODUCT_NAME/asource /etc/conf.d/vmware' \
        -e 's/if "$BINDIR"\/vmware-modconfig --appname=.*/if true ||/' \
        -i "$pkgdir/usr/bin/$program"
  done

  # Add StartupWMClass attribute to desktop files
  sed -i '/^StartupNotify=.*/a StartupWMClass=vmware' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i '/^StartupNotify=.*/a StartupWMClass=vmplayer' "$pkgdir/usr/share/applications/vmware-player.desktop"
  sed -i '/^StartupNotify=.*/a StartupWMClass=vmware-netcfg' "$pkgdir/usr/share/applications/vmware-netcfg.desktop"
}
