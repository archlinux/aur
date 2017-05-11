# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

################################################################################
# Patch VMware Workstation to enable macOS guests support
# Uncomment the line below to enable it

#_enable_macOS_guests=y

# CAUTION: Run macOS on a non Apple computer may be forbidden in your country.
# Source of the patch: https://github.com/DrDonk/unlocker
# Forum: http://www.insanelymac.com/forum/topic/303311-workstation-1112-player-712-fusion-78-and-esxi-6-mac-os-x-unlocker-2
################################################################################

#PKGEXT=.pkg.tar
pkgname=vmware-workstation
pkgver=12.5.5_5234757
pkgrel=1
pkgdesc='The industry standard for running multiple operating systems as virtual machines on a single Linux PC.'
arch=(x86_64)
url='https://www.vmware.com/products/workstation-for-linux.html'
license=(custom)
install="vmware-workstation.install"
conflicts=(
  vmware-modules-dkms
  vmware-ovftool
  vmware-patch
  vmware-systemd-services
)
provides=(
  vmware-ovftool
)
depends=(
  dkms
  # needed to replace internal libs:
  fontconfig
  zlib
)
optdepends=(
  'linux-headers: build modules against Arch kernel'
)
makedepends=(
  sqlite
)
backup=('etc/vmware/config')
source=(
  "https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-${pkgver/_/-}.x86_64.bundle"

  bootstrap
  config

  config.xml
  datastores.xml
  environments.xml
  proxy.xml

  vmware-hostd-certificates.service
  vmware-hostd.service
  vmware-networks-configuration.service
  vmware-networks.service
  vmware-usbarbitrator.service

  dkms.conf
  vmblock.patch
  vmci.patch
  vmmon.patch
  vmnet.patch
  vsock.patch
)
sha1sums=(
  85082ae7d79ae42b5debe4be1dc210ec5ea69bae

  a91b3d711846dafe10f45d89c531dab703bfb113
  e57f7715c092d9b1fb74a7baadc07ef214cfb4cd

  4bea74ce942e73bf25a8e5fdb0027493d3f114b9
  dfad83699f7546aeb85a38551a33666dbb14535f
  a7e4a6fe33dc6ca95b469ec6f88de21e5b16a95b
  80c5626984ffcdea6fa655d248c731e7c9c657fa

  e9855dfdc07a8261336b13fcf4831f0696e94303
  3ee361c861eee5e462716c3aeb22425193e2e1b6
  d90c687250c16fc5586938de5dc7539a58500adc
  529556a0db5564dc8237ee327a2ee176bcf2c02d
  c1dbfbad3473d12e9c82b75c5f1faf795f3cc217

  91907f53492e3cfdabffd00b6c56e6a435fc9749
  f4af25095e51d8f12bfde89282261dbc0f0faa10
  73a78bbeac0625d50756da786a59e1e1e5df95f3
  c183c6a5be9ecf834381832e63d7f39edf147678
  c5109127f746cb6672f871331bab9bd368d990ac
  3ca42f0e86986782827f221cbbd3ed66e7330b73
)
options=(!strip emptydirs)


_isoimages=(freebsd linux linuxPreGlibc25 netware solaris windows winPre2k winPreVista)

if [ -n "$_enable_macOS_guests" ]; then

_vmware_fusion_ver=8.5.6_5234762
# List of VMware Fusion versions: https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/

makedepends+=(
  python2
  unzip
)

source+=(
  "https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/${_vmware_fusion_ver/_//}/packages/com.vmware.fusion.tools.darwinPre15.zip.tar"
  "https://softwareupdate.vmware.com/cds/vmw-desktop/fusion/${_vmware_fusion_ver/_//}/packages/com.vmware.fusion.tools.darwin.zip.tar"
  unlocker.py
)
sha1sums+=(
  de76483a5c58c4fbdec8dc1e339808497aa2afbb
  3dca561a996bea5f356ea47a62f7a0e995b5e7ce
  18773b64c403621a9c286797ba3c0ea618b58af6
)

_fusion_isoimages=(darwin darwinPre15)
fi


_create_database_file() {
  # Create a database which contains the list of guest tools (necessary to avoid that vmware try to download them)
  local database_filename="$pkgdir/etc/vmware-installer/database"
  echo -n "" > $database_filename

  sqlite3 $database_filename "CREATE TABLE settings(key VARCHAR PRIMARY KEY, value VARCHAR NOT NULL, component_name VARCHAR NOT NULL);"
  sqlite3 $database_filename "INSERT INTO settings(key,value,component_name) VALUES('db.schemaVersion','2','vmware-installer');"
  sqlite3 $database_filename "CREATE TABLE components(id INTEGER PRIMARY KEY, name VARCHAR NOT NULL, version VARCHAR NOT NULL, buildNumber INTEGER NOT NULL, component_core_id INTEGER NOT NULL, longName VARCHAR NOT NULL, description VARCHAR, type INTEGER NOT NULL);"

  for isoimage in ${_isoimages[@]}
  do
	local version=$(cat "$srcdir/extracted/vmware-tools-$isoimage/manifest.xml" | grep -oPm1 "(?<=<version>)[^<]+")
	sqlite3 $database_filename "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES(\"vmware-tools-$isoimage\",\"$version\",\"${pkgver#*_}\",1,\"$isoimage\",\"$isoimage\",1);"
  done

if [ -n "$_enable_macOS_guests" ]; then
  for isoimage in ${_fusion_isoimages[@]}
  do
	sqlite3 $database_filename "INSERT INTO components(name,version,buildNumber,component_core_id,longName,description,type) VALUES(\"vmware-tools-$isoimage\",\"0\",\"${_vmware_fusion_ver#*_}\",1,\"$isoimage\",\"$isoimage\",1);"
  done
fi
}

prepare() {
  extracted_dir="$srcdir/extracted"
  [[ -d "$extracted_dir" ]] && rm -r "$extracted_dir"

  bash \
    "$(readlink -f "$srcdir/VMware-Workstation-Full-${pkgver/_/-}.x86_64.bundle")" \
    --extract "$extracted_dir"

if [ -n "$_enable_macOS_guests" ]; then
  for isoimage in ${_fusion_isoimages[@]}
  do
    unzip -q com.vmware.fusion.tools.$isoimage.zip
    rm manifest.plist
  done

  sed -i -e "s/vmx_path = '/vmx_path = '${pkgdir//\//\\/}/" \
      -i -e "s/vmwarebase = '/vmwarebase = '${pkgdir//\//\\/}/" \
      -i -e "s/vmx_version = .*$/vmx_version = 'VMware Player ${pkgver/_/ build-}'/" "$srcdir/unlocker.py"
fi
}

package() {
  # Make directories and copy files.

  mkdir -p \
    "$pkgdir/usr"/{share,bin} \
    "$pkgdir/usr/lib"/{vmware/setup,vmware-vix,vmware-ovftool,vmware-installer/2.1.0} \
    "$pkgdir/var/lib/vmware/Shared VMs" \
    "$pkgdir/etc/vmware" \
    "$pkgdir/usr/share/licenses/$pkgname"

  cd "$srcdir/extracted"

  cp -r \
    vmware-workstation/share/* \
    vmware-workstation/doc \
    vmware-workstation/man \
    vmware-network-editor-ui/share/* \
    vmware-player-app/share/* \
    "$pkgdir/usr/share"

  cp -r \
    vmware-workstation/bin/* \
    vmware-vmx/bin/* \
    vmware-vix-core/bin/* \
    vmware-workstation-server/{vmware-hostd,vmware-vim-cmd,vmware-wssc-adminTool} \
    vmware-network-editor-ui/bin/* \
    vmware-player-app/bin/* \
    "$pkgdir/usr/bin"

  cp -r \
    vmware-workstation/lib/* \
    vmware-player-app/lib/* \
    vmware-vmx/lib/* \
    vmware-workstation-server/{bin,lib,hostd} \
    vmware-usbarbitrator/bin \
    vmware-network-editor/lib \
    "$pkgdir/usr/lib/vmware"

  cp -r \
    vmware-player-setup/vmware-config \
    "$pkgdir/usr/lib/vmware/setup"

  cp -rL \
    vmware-workstation-server/config/etc/vmware/* \
    vmware-workstation-server/etc/vmware/* \
    "$srcdir"/{bootstrap,config} \
    "$pkgdir/etc/vmware"

  cp -r \
    vmware-vix-lib-Workstation1200/lib/Workstation-12.0.0 \
    vmware-vix-core/vixwrapper-config.txt \
    "$pkgdir/usr/lib/vmware-vix"

  cp -r \
    vmware-ovftool/* \
    "$pkgdir/usr/lib/vmware-ovftool"

  cp -r \
    vmware-installer/{python,sopython,vmis,vmis-launcher,vmware-installer,vmware-installer.py} \
    "$pkgdir/usr/lib/vmware-installer/2.1.0"

  for isoimage in ${_isoimages[@]}
  do
    install -Dm 644 "vmware-tools-$isoimage/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
    install -Dm 644 "vmware-tools-$isoimage/$isoimage.iso.sig" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso.sig"
  done

  mv "$pkgdir/usr/lib/vmware/licenses"/* "$pkgdir/usr/share/licenses/$pkgname"
  rmdir "$pkgdir/usr/lib/vmware/licenses"
  mv "$pkgdir/usr/share/doc"/{EULA,*open_source_licenses.txt} "$pkgdir/usr/share/licenses/$pkgname"

  install -Dm 644 vmware-player-app/lib/isoimages/tools-key.pub "$pkgdir/usr/lib/vmware/isoimages/tools-key.pub"

  install -Dm 644 vmware-vmx/extra/modules.xml "$pkgdir/usr/lib/vmware/modules/modules.xml"
  install -Dm 644 vmware-installer/bootstrap "$pkgdir/etc/vmware-installer/bootstrap"

  for hostd_file in config datastores environments proxy; do
    install -Dm 644 "$srcdir/$hostd_file.xml" "$pkgdir/etc/vmware/hostd/$hostd_file.xml"
  done

  for service_file in \
    vmware-hostd-certificates.service \
    vmware-hostd.service \
    vmware-networks-configuration.service \
    vmware-networks.service \
    vmware-usbarbitrator.service
  do
    install -Dm 644 \
      "$srcdir/$service_file" \
      "$pkgdir/usr/lib/systemd/system/$service_file"
  done


  # Apply permissions where necessary.

  chmod +x \
    "$pkgdir/usr/bin"/* \
    "$pkgdir/usr/lib/vmware/bin"/* \
    "$pkgdir/usr/lib/vmware/setup/vmware-config" \
    "$pkgdir/usr/lib/vmware/lib"/{wrapper-gtk24.sh,libgksu2.so.0/gksu-run-helper} \
    "$pkgdir/usr/lib/vmware-ovftool"/{ovftool,ovftool.bin} \
    "$pkgdir/usr/lib/vmware-installer/2.1.0"/{vmware-installer,vmis-launcher}

  chmod -R 600 "$pkgdir/etc/vmware/ssl"
  chmod +s "$pkgdir/usr/lib/vmware/bin/vmware-vmx"


  # Add symlinks the installer would create.

  for link in \
    licenseTool \
    thnuclnt \
    vmplayer \
    vmware \
    vmware-app-control \
    vmware-enter-serial \
    vmware-fuseUI \
    vmware-gksu \
    vmware-modconfig \
    vmware-modconfig-console \
    vmware-netcfg \
    vmware-tray \
    vmware-unity-helper \
    vmware-vmblock-fuse \
    vmware-zenity
  do
    ln -s /usr/lib/vmware/bin/appLoader "$pkgdir/usr/lib/vmware/bin/$link"
  done

  ln -s /usr/lib/vmware/icu "$pkgdir/etc/vmware/icu"
  ln -s /usr/lib/vmware-ovftool/ovftool "$pkgdir/usr/bin/ovftool"


  # Replace placeholder "variables" with real paths.

  for file in \
    pango/pangorc \
    pango/pango.modules \
    pango/pangox.aliases \
    gtk-2.0/gdk-pixbuf.loaders \
    gtk-2.0/gtk.immodules
  do
    sed -i 's,@@LIBCONF_DIR@@,/usr/lib/vmware/libconf,g' "$pkgdir/usr/lib/vmware/libconf/etc/$file"
  done

  sed -i 's,@@BINARY@@,/usr/bin/vmware,' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmware-netcfg,' "$pkgdir/usr/share/applications/vmware-netcfg.desktop"
  sed -i 's,@@VMWARE_INSTALLER@@,/usr/bin/vmware,' "$pkgdir/usr/share/applications/vmware-workstation.desktop"
  sed -i 's,@@BINARY@@,/usr/bin/vmplayer,' "$pkgdir/usr/share/applications/vmware-player.desktop"

  sed -i 's,@@AUTHD_PORT@@,902,' "$pkgdir/usr/lib/vmware/hostd/docroot/client/clients.xml"

  sed \
    -e 's/@@VERSION@@/2.1.0/' \
    -e 's,@@VMWARE_INSTALLER@@,/usr/lib/vmware-installer/2.1.0,' \
    -i "$pkgdir/etc/vmware-installer/bootstrap"


  # Patch up the VMware kernel sources and configure DKMS.

  dkms_dir="$pkgdir/usr/src/$pkgname-$pkgver"

  install -Dm 644 "$srcdir/dkms.conf" "$dkms_dir/dkms.conf"

  sed \
    -e "s/@PKGNAME@/$pkgname/g" \
    -e "s/@PKGVER@/$pkgver/g" \
    -i "$dkms_dir/dkms.conf"

  find vmware-vmx/lib/modules/source -mindepth 1 -exec bsdtar -xf {} -C "$dkms_dir" \;

  for module in vmblock vmci vmmon vmnet vsock; do
    patch -p2 --read-only=ignore --directory="$dkms_dir/$module-only" < "$srcdir/$module.patch"
  done

if [ -n "$_enable_macOS_guests" ]; then
  # Patch VMware files to add macOS guest support
  python2 "$srcdir/unlocker.py"

  for isoimage in ${_fusion_isoimages[@]}
  do
    install -Dm 644 "$srcdir/payload/$isoimage.iso" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso"
    install -Dm 644 "$srcdir/payload/$isoimage.iso.sig" "$pkgdir/usr/lib/vmware/isoimages/$isoimage.iso.sig"
  done
fi

  _create_database_file

  # use system font rendering
  ln -sf /usr/lib/libfreetype.so.6 "$pkgdir/usr/lib/vmware/lib/libfreetype.so.6/"

  # to solve bugs with incompatibles library versions:
  ln -sf /usr/lib/libz.so.1 "$pkgdir/usr/lib/vmware/lib/libz.so.1/"
  # if there is not a better solution, define environment variable VMWARE_USE_SHIPPED_LIBS
  install -dm755 "$pkgdir/etc/profile.d"
  echo -e "#export VMWARE_USE_SHIPPED_LIBS=yes" > "$pkgdir/etc/profile.d/vmware.sh"
  chmod 755 "$pkgdir/etc/profile.d/vmware.sh"
  ln -sf /usr/lib/libfontconfig.so.1 "$pkgdir/usr/lib/vmware/lib/libfontconfig.so.1/" # avoid a conflict with fontconfig when VMWARE_USE_SHIPPED_LIBS is defined
}
