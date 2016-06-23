# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: joat
# Submitter: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabx-bin
pkgver=3.35
_mplabcomm_version=3.20.00
pkgrel=1
pkgdesc="IDE for Microchip PIC and dsPIC development"
arch=(i686 x86_64)
url='http://www.microchip.com/mplabx'
license=(custom)
depends=(gtk2 alsa-lib libxslt libxtst "java-runtime>=7" "java-openjfx")
makedepends=(fakechroot desktop-file-utils)
makedepends_x86_64=(lib32-fakeroot)
optdepends=('microchip-mplabxc8-bin: C compiler for PIC10 PIC12 PIC16 PIC18 MCUs'
            'microchip-mplabxc16-bin: C compiler for PIC24 MCUs and dsPIC DSCs'
            'microchip-mplabxc32-bin: C Compiler for PIC32 MCUs'
            'microchip-mplabc18-bin: C compiler for PIC18 MCUs'
            'sdcc: C compiler for PIC16/18 MCUs'
            )
provides=(mplab)
conflicts=(mplab)
options=(!strip docs libtool emptydirs !zipman !upx)
install="${pkgname}.install"

_mplabx_dir="/opt/microchip/mplabx/v${pkgver}"
_mplabx_installer="MPLABX-v${pkgver}-linux-installer"

_mplabcomm_installer="MPLABCOMM-v${_mplabcomm_version}-linux-installer"
_mplabcomm_dir="/opt/microchip/mplabcomm/v${_mplabcomm_version}"

source=("http://ww1.microchip.com/downloads/en/DeviceDoc/${_mplabx_installer}.tar"
        "LICENSE")
source_x86_64=("fakechroot-i686.pkg.tar.xz::http://www.archlinux.org/packages/extra/i686/fakechroot/download/")

md5sums=('f9e6ca7a1f1013cc545dc406db557cb1'
         'a34a85b2600a26f1c558bcd14c2444bd')
md5sums_x86_64=('92b9a1dc8fa0534048790731a7bf2fc5')

backup=("etc/mplab_ide.conf")

PKGEXT='.pkg.tar'

package() {
  mkdir -p "${pkgdir}"/{etc,usr/{bin,lib},tmp}

  # Create a fake chroot in $pkgdir to run the installer into
  ln -s /usr/bin "${pkgdir}/"

  echo "root:x:0:0:root:/root:/bin/bash" > "${pkgdir}/etc/passwd"
  echo "root:x:0:root" > "${pkgdir}/etc/group"

  echo "Extracting installers..."
  sh ${_mplabx_installer}.sh --tar xf ./${_mplabx_installer}.run
  mv ${_mplabx_installer}.run "${pkgdir}/tmp"
  chmod 0755 "${pkgdir}/tmp/${_mplabx_installer}.run"

  # Create install script in chroot
  cat << EOF > "${pkgdir}/tmp/install.sh"
#!/bin/sh
LD_LIBRARY_PATH="${srcdir}/usr/lib/libfakeroot/fakechroot:\$LD_LIBRARY_PATH"
PATH=/bin
echo Running MPLABX installer...
tmp/${_mplabx_installer}.run --mode unattended
EOF

  chmod 0755 "${pkgdir}/tmp/install.sh"

  # Run the installer in the fake chroot
  fakechroot chroot "${pkgdir}" tmp/install.sh

  # Remove uninstaller files
  rm -f "${pkgdir}${_mplabx_dir}"/Uninstall_*

  # Fix ugly fonts
  sed -i 's/^default_options="/default_options="-J-Dawt.useSystemAAFontSettings=on /' "${pkgdir}${_mplabx_dir}/mplab_ide/etc/mplab_ide.conf"

  # Fix broken udev rules
  sed -i '/^BUS!="usb"/c \ACTION!="add", SUBSYSTEM!="usb_device", GOTO="jlink_rules_end"\r' "${pkgdir}/etc/udev/rules.d/99-jlink.rules"

  # Patch jdkhome to use system JRE
  local conf
  for conf in mplab_ipe/mplab_ipe mplab_ipe/ipecmd.sh mplab_ide/etc/mplab_ide.conf; do
    sed -i '/^jdkhome=/c \jdkhome=/usr/lib/jvm/default-runtime/' "${pkgdir}${_mplabx_dir}/${conf}"
  done
  sed -i '/^"$jdkhome"bin\/java/c\ java -jar '${_mplabx_dir}'/mplab_ipe/ipe.jar' "${pkgdir}${_mplabx_dir}/mplab_ipe/mplab_ipe"

  # Move config file to /etc (and add a symlink into the old location)
  mv "${pkgdir}${_mplabx_dir}/mplab_ide/etc/mplab_ide.conf" "${pkgdir}/etc/"

  ln -sf /etc/mplab_ide.conf "${pkgdir}${_mplabx_dir}/mplab_ide/etc/"

  # Remove bundled JRE
  rm -rf "${pkgdir}${_mplabx_dir}/sys/java"
  rmdir "${pkgdir}${_mplabx_dir}/sys" # the intent here is to fail if something else than java is put into sys.

  # Move libs away from /usr/local/lib
  mv "${pkgdir}"/usr/local/lib/*.so{,.*} "${pkgdir}"/usr/lib/
  rm -rf "${pkgdir}/usr/local/"

  # Symlink executables
  ln -sf "${_mplabx_dir}/mplab_ide/bin/mplab_ide" "${pkgdir}/usr/bin/"
  ln -sf "${_mplabx_dir}/mplab_ide/bin/mdb.sh" "${pkgdir}/usr/bin/mdb"
  ln -sf "${_mplabx_dir}/mplab_ide/bin/prjMakefilesGenerator.sh" "${pkgdir}/usr/bin/prjMakefilesGenerator"
  ln -sf "${_mplabx_dir}/mplab_ipe/mplab_ipe" "${pkgdir}/usr/bin/"
  ln -sf "${_mplabcomm_dir}/lib/mchplinusbdevice" "${pkgdir}/etc/.mplab_ide/"

  # Symlink libs from MPLABCOMM
  local lib
  for lib in "${pkgdir}${_mplabcomm_dir}"/lib/*.so{,.*}; do
    local bname=$(basename "$lib")
    ln -sf "${_mplabcomm_dir}/lib/${bname}"  "${pkgdir}/usr/lib/"
  done

  # Correctly link .so.* -> .so for all libs
  for lib in "${pkgdir}"/usr/lib/*.so.*; do
    local bname=$(basename "$lib")
    local soname=${bname%.so.*}
    ln -sf ${bname} "${pkgdir}/usr/lib/${soname}.so"
  done

  # Tweak .desktop files for better desktop integration
  echo "StartupWMClass=MPLAB X IDE v${pkgver}" >> "${pkgdir}/usr/share/applications/mplab.desktop"
  echo "StartupWMClass=com-microchip-ipe-ui-ProdProgrammerApp" >> "${pkgdir}/usr/share/applications/mplab_ipe.desktop"

  # Install license files
  install -Dm 644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgdir}${_mplabcomm_dir}/MPLABCOMMLicense.txt" "${pkgdir}/usr/share/licenses/${pkgname}/MPLABCOMMLicense.txt"

  # Cleanup
  rm "${pkgdir}"/{bin,etc/{group,passwd}}
  rm -r "${pkgdir}/tmp"
  # wtf
  rm -f "${pkgdir}${_mplabcomm_dir}/${_mplabcomm_installer}.run"
}

