# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=vmware-tools
pkgver=10.2.5
_buildver=8068393
_pkgver=${pkgver}_${_buildver}
_vmware_ver=14.1.2_8497320
pkgrel=1
pkgdesc='The proprietary implementation of VMware Tools'
arch=('i686' 'x86_64')
url='https://www.vmware.com/products/workstation-for-linux.html'
license=(custom)
install="vmware-tools.install"
conflicts=(
  open-vm-tools
)
provides=(
  open-vm-tools
)
depends=(
  fuse2
  net-tools
)
makedepends=(
  p7zip
  vmware-component-extractor-git
)
optdepends=(
  'cups: print using ThinPrint'
)
backup=(
  'etc/tpvmlp.conf'
  'etc/vmware-tools/guestproxy-ssl.conf'
  'etc/vmware-tools/vmware-user.desktop'
)
source=(
  "https://softwareupdate.vmware.com/cds/vmw-desktop/ws/${_vmware_ver/_/\/}/linux/packages/vmware-tools-linux-${_pkgver/_/-}.x86_64.component.tar"
  'vmtoolsd.service'
  'vmware-thinprint.service'
  'vgauth.service'
  'vmware-caf.service'
  'config-vmware-tools'
  'locations'
)
sha256sums=(
  '283ede0c7285d7fe4b7523ee8bac9935b140fb091d3310f3d888e52f491ab792'
  '5bd7e1f6e238eae829bbc7edc434e63910f41abeb7c0513d30988e80c28a1630'
  '02971c67bdbb289accd3faa6f0a8f1803e8145713235f4ba69671c16a9938dcc'
  '97f2e4673a518dc138585cfaf6ca636e15f2ce1e1a1af0e7bcc039a066d67f6b'
  'f911152ed8104d96973e6ffab9973578bc06ab4e2b8fd5618dd729953d609790'
  '8ea4eb16d72c746b552a7610962644f806efe958357c44a842cf8d84d965f94c'
  '9a2f35987cae17cf767e7aa8188b32df8f97c43aec769d5c1645a6ea42995fd2'
)
noextract=("vmware-tools-linux-${_pkgver/_/-}.x86_64.component.tar")

if [ "$CARCH" = "x86_64" ]; then
  _arch=64
else
  _arch=32
fi

prepare() {
  rm -f linux.iso
  vmware-component-extractor "vmware-tools-linux-${_pkgver/_/-}.x86_64.component.tar"
  7z x linux.iso "VMwareTools-${_pkgver/_/-}.tar.gz" -y > /dev/null
  tar xf "VMwareTools-${_pkgver/_/-}.tar.gz"
}

package() {
  # Make directories and copy files.

  mkdir -p \
    "$pkgdir/etc"/{vmware-tools,xdg/autostart} \
    "$pkgdir/usr"/{bin,share/licenses/"$pkgname"} \
    "$pkgdir/usr/lib"/{cups/backend,vmware-tools,vmware-vgauth} \
    "$pkgdir/var/lib"

  cd "$srcdir/vmware-tools-distrib"

  cp -r \
    etc/{messages,scripts,statechange.subr,*-vm-default,vmware-tools-*.conf,vmware-user.*,xsession-*} \
    installer/{guestproxy-ssl.conf,vgauth.conf} \
    "$pkgdir/etc/vmware-tools"

  cp -r \
    lib/{bin${_arch},include,lib${_arch},plugins${_arch},sbin${_arch}} \
    "$pkgdir/usr/lib/vmware-tools"

  cp -r \
    vgauth/schemas \
    "$pkgdir/usr/lib/vmware-vgauth"

  cp -r \
    caf/etc/vmware-caf \
    "$pkgdir/etc"
  cp -r \
    caf/usr/lib/vmware-caf \
    "$pkgdir/usr/lib"
  cp -r \
    caf/var/lib/vmware-caf \
    "$pkgdir/var/lib"

  cp -r \
    doc/{open_source_licenses.txt,README} \
    "$pkgdir/usr/share/licenses/${pkgname}"

  install -Dm 644 "$srcdir"/config-vmware-tools "$pkgdir/etc/vmware-tools/config"
  install -Dm 644 "$srcdir"/locations "$pkgdir/etc/vmware-tools/locations"
  install -Dm 644 etc/tpvmlp.conf "$pkgdir/etc/tpvmlp.conf"
  install -Dm 644 etc/vmware-tools-libraries.conf "$pkgdir/etc/ld.so.conf.d/vmware-tools-libraries.conf"
  install -Dm 644 lib/configurator/pam.d/vmtoolsd "$pkgdir/etc/pam.d/vmtoolsd"
  install -Dm 644 lib/configurator/thinprint.ppd "$pkgdir/etc/cups/ppd/VMware_Virtual_Printer.ppd"
  install -Dm 644 lib/configurator/udev/99-vmware-scsi-udev.rules "$pkgdir/usr/lib/udev/rules.d/99-vmware-scsi-udev.rules"

  # Symlink does not work for these two files
  install -Dm 755 "$pkgdir/usr/lib/vmware-tools/bin${_arch}/appLoader-av0" "$pkgdir/usr/lib/cups/backend/tpvmgp"
  install -Dm 755 "$pkgdir/usr/lib/vmware-tools/bin${_arch}/appLoader-av0" "$pkgdir/usr/lib/cups/backend/tpvmlp"

  for service_file in \
    vmtoolsd.service \
    vmware-thinprint.service \
    vgauth.service \
    vmware-caf.service
  do
    install -Dm 644 \
      "$srcdir/$service_file" \
      "$pkgdir/usr/lib/systemd/system/$service_file"
  done


  # Apply permissions where necessary.

  chmod +x \
    "$pkgdir/usr/lib/vmware-tools/bin${_arch}"/* \
    "$pkgdir/usr/lib/vmware-tools/sbin${_arch}"/* \
    "$pkgdir/etc/vmware-caf/pme"/{scripts,install}/*
    #"$pkgdir/usr/bin"/*

  chmod -x \
    "$pkgdir/usr/lib/vmware-tools/lib${_arch}"/*/* \
    "$pkgdir/usr/lib/vmware-tools/plugins${_arch}"/*/* \
    "$pkgdir/etc/vmware-tools/messages"/*/* \
    "$pkgdir/etc/vmware-tools"/*.conf \
    "$pkgdir/usr/lib/vmware-caf/pme/lib"/*

  chmod +s \
    "$pkgdir/usr/lib/vmware-tools/bin${_arch}"/vmware-user-suid-wrapper


  # Add symlinks the installer would create.

  for link in \
    tpvmlp \
    tpvmlpd \
    vmhgfs-fuse \
    vmware-guestproxycerttool \
    vmware-hgfsclient \
    vmware-namespace-cmd \
    vmware-toolbox-cmd \
    vmware-vmblock-fuse \
    vmware-xferlogs
  do
    ln -s /usr/lib/vmware-tools/bin/appLoader "$pkgdir/usr/bin/$link"
  done

  for link in \
    vmtoolsd \
    vmware-checkvm \
    vmware-rpctool
  do
    ln -s /usr/lib/vmware-tools/sbin/"$link" "$pkgdir/usr/bin/$link"
  done

  for link in \
    VGAuthService \
    vmware-alias-import \
    vmware-vgauth-cmd
  do
    ln -s /usr/lib/vmware-tools/bin/appLoader "$pkgdir/usr/lib/vmware-vgauth/$link"
  done

  ln -s /usr/lib/vmware-tools/bin/appLoader "$pkgdir/usr/lib/vmware-tools/sbin${_arch}/vmtoolsd"
  ln -s /usr/lib/vmware-tools/bin/appLoader "$pkgdir/usr/lib/vmware-tools/sbin${_arch}/vmware-modconfig-console"
  ln -s /usr/lib/vmware-tools/sbin/vmware-hgfsmounter "$pkgdir/usr/bin/mount.vmhgfs"

  ln -s /etc/vmware-tools/vmware-user.desktop "$pkgdir/etc/xdg/autostart/vmware-user.desktop"
  ln -s /usr/lib/vmware-tools/plugins "$pkgdir/etc/vmware-tools/plugins"
  ln -s /usr/lib/vmware-tools/bin/vmware-user-suid-wrapper "$pkgdir/usr/bin/vmware-user"

  ln -s liblog4cpp.so.5.0.6 "$pkgdir/usr/lib/vmware-caf/pme/lib/liblog4cpp.so"
  ln -s liblog4cpp.so.5.0.6 "$pkgdir/usr/lib/vmware-caf/pme/lib/liblog4cpp.so.5"
  ln -s librabbitmq.so.4.2.1 "$pkgdir/usr/lib/vmware-caf/pme/lib/librabbitmq.so"
  ln -s librabbitmq.so.4.2.1 "$pkgdir/usr/lib/vmware-caf/pme/lib/librabbitmq.so.4"

  ln -s bin${_arch} "$pkgdir/usr/lib/vmware-tools/bin"
  ln -s sbin${_arch} "$pkgdir/usr/lib/vmware-tools/sbin"
  ln -s lib${_arch} "$pkgdir/usr/lib/vmware-tools/lib"
  ln -s lib${_arch}/libconf "$pkgdir/usr/lib/vmware-tools/libconf"
  ln -s plugins${_arch} "$pkgdir/usr/lib/vmware-tools/plugins"


  # Replace placeholder "variables" with real paths.

  sed -i 's,@@LIBDIR@@,/usr/lib/vmware-tools,' "$pkgdir/etc/ld.so.conf.d/vmware-tools-libraries.conf"
  sed -i 's,@@VGAUTHSCHEMADIR@@,/usr/lib/vmware-vgauth/schemas,' "$pkgdir/etc/vmware-tools/vgauth.conf"

  sed \
    -e "s,@binDir@,/usr/lib/vmware-caf/pme/bin,g" \
    -e "s,@libDir@,/usr/lib/vmware-caf/pme/lib,g" \
    -e "s,@configDir@,/etc/vmware-caf/pme/config,g" \
    -e "s,@inputDir@,/var/lib/vmware-caf/pme/data/input,g" \
    -e "s,@outputDir@,/var/lib/vmware-caf/pme/data/output,g" \
    -e "s,@logDir@,/var/log/vmware-caf/pme,g" \
    -e "s,@invokersDir@,/var/lib/vmware-caf/pme/data/input/invokers,g" \
    -e "s,@providersDir@,/var/lib/vmware-caf/pme/data/input/providers,g" \
    -e "s,@toolsLibDir@,/usr/lib/vmware-tools/lib,g" \
    -e "s,@cafInstallMode@,tools,g" \
    -i "$pkgdir//etc/vmware-caf/pme/config/cafenv-appconfig"


  # Some fixes

  sed -i 's,Exec=/usr/bin/vmware-user-suid-wrapper,Exec=/usr/bin/vmware-user,' "$pkgdir/etc/vmware-tools/vmware-user.desktop"
}
