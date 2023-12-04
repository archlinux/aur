# Maintainer: mickael9 <mickael9 at gmail dot com>
# Contributor: Peter Ivanov <ivanovp@gmail.com>
# Contributor: joat
# Submitter: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabx-bin
pkgver=6.15
pkgrel=2
pkgdesc="IDE for Microchip PIC and dsPIC development"
arch=(x86_64)
url='http://www.microchip.com/mplabx'
license=(custom)
depends=(gtk2 alsa-lib libxslt libxtst jre8-openjdk java8-openjfx)
makedepends=(fakechroot desktop-file-utils)
optdepends=('microchip-mplabxc8-bin: C compiler for PIC10 PIC12 PIC16 PIC18 MCUs'
            'microchip-mplabxc16-bin: C compiler for PIC24 MCUs and dsPIC DSCs'
            'microchip-mplabxc32-bin: C Compiler for PIC32 MCUs'
            'microchip-mplabc18-bin: C compiler for PIC18 MCUs'
            'sdcc: C compiler for PIC16/18 MCUs'
            )
provides=(mplab)
conflicts=(mplab)
options=(!strip docs libtool emptydirs !zipman)

_mplabx_dir="/opt/microchip/mplabx/v${pkgver}"
_mplabx_installer="MPLABX-v${pkgver}-linux-installer"

_mplabcomm_dir="/opt/microchip/mplabcomm"

# Override DLAGENTS as microchip doesn't allow direct download if the Referer header is not provided
DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -e "https://www.microchip.com/en-us/tools-resources/develop/mplab-x-ide" -o %o %u')

source=("https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/${_mplabx_installer}.tar"
        "LICENSE"
        "mplabx-override.conf")

md5sums=('d2a6c974a0597b37734eda0e7952ae98'
         'a34a85b2600a26f1c558bcd14c2444bd'
         'a476a71af625380a2fd52f82fb5d5492')

backup=("etc/mplab_ide.conf")

PKGEXT='.pkg.tar'

build() {
  chrootdir="${srcdir}"/chroot

  mkdir -p "${chrootdir}"/{etc,usr/{bin,lib},tmp}

  # Create a fake chroot in $chrootdir to run the installer into
  ln -s /usr/bin "${chrootdir}/"

  echo "root:x:0:0:root:/root:/bin/bash" > "${chrootdir}/etc/passwd"
  echo "root:x:0:root" > "${chrootdir}/etc/group"

  echo "Extracting installers..."
  sh ${_mplabx_installer}.sh --tar xf ./${_mplabx_installer}.run
  mv ${_mplabx_installer}.run "${chrootdir}/tmp"
  chmod 0755 "${chrootdir}/tmp/${_mplabx_installer}.run"

  # Create install script in chroot
  cat << EOF > "${chrootdir}/tmp/install.sh"
#!/bin/sh
PATH=/bin
echo Running MPLABX installer...
tmp/${_mplabx_installer}.run --mode unattended
EOF

  chmod 0755 "${chrootdir}/tmp/install.sh"

  # Run the installer in the fake chroot
  fakechroot fakeroot chroot "${chrootdir}" tmp/install.sh

  # Remove uninstaller files
  rm -f "${chrootdir}${_mplabx_dir}"/Uninstall_*

  # Fix permissions
  chmod -R og-w "${chrootdir}"

  # Fix ugly fonts
  sed -i 's/^default_options="/default_options="-J-Dawt.useSystemAAFontSettings=on /' "${chrootdir}${_mplabx_dir}/mplab_platform/etc/mplab_ide.conf"

  # Rename udev rules to avoid conflict with jlink-software-and-documentation
  mv "${chrootdir}"/etc/udev/rules.d/{99-jlink,98-jlink-mplabx}.rules

  # Move them to /usr/lib/udev/rules.d
  mv "${chrootdir}/etc/udev" "${chrootdir}/usr/lib/"

  # Patch jdkhome to use system JRE
  local conf
  for conf in etc/mplab_ide.conf etc/mplab_ipe.conf harness/etc/app.conf mplab_ipe/ipecmd.sh; do
    sed -i -r '\@^#?jdkhome=@c\jdkhome=/usr/lib/jvm/java-8-openjdk/jre/' "${chrootdir}${_mplabx_dir}/mplab_platform/${conf}"
  :
  done

  # Move config file to /etc (and add a symlink into the old location)
  mv "${chrootdir}${_mplabx_dir}/mplab_platform/etc/mplab_ide.conf" "${chrootdir}/etc/"

  ln -sf /etc/mplab_ide.conf "${chrootdir}${_mplabx_dir}/mplab_platform/etc/"

  # Remove bundled JRE
  rm -rf "${chrootdir}${_mplabx_dir}/sys/java"
  rmdir "${chrootdir}${_mplabx_dir}/sys" # the intent here is to fail if something else than java is put into sys.

  # Remove the /usr/local directory (now empty)
  rm -rf "${chrootdir}/usr/local/"

  _mplabcomm_chrootdir=("${chrootdir}${_mplabcomm_dir}"/*)
  _mplabcomm_version=$(basename "${_mplabcomm_chrootdir}")
  _mplabcomm_dstdir="${_mplabcomm_dir}/${_mplabcomm_version}"

  # Symlink executables
  ln -sf "${_mplabx_dir}/mplab_platform/bin/mplab_ide" "${chrootdir}/usr/bin/"
  ln -sf "${_mplabx_dir}/mplab_platform/bin/mdb.sh" "${chrootdir}/usr/bin/mdb"
  ln -sf "${_mplabx_dir}/mplab_platform/bin/prjMakefilesGenerator.sh" "${chrootdir}/usr/bin/prjMakefilesGenerator"
  ln -sf "${_mplabx_dir}/mplab_platform/bin/mplab_ipe" "${chrootdir}/usr/bin/"
  ln -sf "${_mplabcomm_dstdir}/lib/mchplinusbmonitor" "${chrootdir}/etc/.mplab_ide/"

  # Symlink libs from MPLABCOMM
  local lib
  for lib in "${_mplabcomm_chrootdir}/lib/"*.so{,.*}; do
    local bname=$(basename "$lib")
    ln -sf "${_mplabcomm_dstdir}/lib/${bname}"  "${chrootdir}/usr/lib/"
  done

  # Correctly link .so.* -> .so for all libs
  for lib in "${chrootdir}"/usr/lib/*.so.*; do
    local bname=$(basename "$lib")
    local soname=${bname%.so.*}
    ln -sf ${bname} "${chrootdir}/usr/lib/${soname}.so"
  done

  # Make lock files world-writable
  for lockfile in mchppnplock mchpsegpnplock; do
    chmod a+w "${chrootdir}/etc/.mplab_ide/${lockfile}"
  done

  # Tweak .desktop files for better desktop integration
  echo "StartupWMClass=MPLAB X IDE v${pkgver}" >> "${chrootdir}/usr/share/applications/mplab_ide-v${pkgver}.desktop"
  echo "StartupWMClass=MPLAB IPE" >> "${chrootdir}/usr/share/applications/mplab_ipe-v${pkgver}.desktop"

  install -Dm 644 -t "${chrootdir}/usr/lib/systemd/system/systemd-udevd.service.d/" "${srcdir}/mplabx-override.conf"

  # Install license files
  install -Dm 644 "${srcdir}"/LICENSE "${chrootdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${_mplabcomm_chrootdir}"/MPLABCOMMLicense.txt "${chrootdir}/usr/share/licenses/${pkgname}/MPLABCOMMLicense.txt"

  # Cleanup
  rm "${chrootdir}"/{bin,etc/{group,passwd}}
  rm -r "${chrootdir}/tmp"
  # wtf
  rm -f "${_mplabcomm_chrootdir}"/MPLABCOMM-*.run
}

package() {
  # Copy the contents of the chroot to the package dir
  cp -R "${srcdir}"/chroot/* "${pkgdir}"/
}

