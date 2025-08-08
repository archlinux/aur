# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor  Spyros Stathopoulos <foucault.online (at) gmail[dot[com> (https://aur.archlinux.org/account/Foucault)
# Contributor: Alex Forenchich <alex(at(alexforencich[dot]com>

# PKGBUILD taken and modified from the PKGBUILD of
# * 'linux-gpib-dkms' (https://aur.archlinux.org/packages/linux-gpib-dkms),
# with a peek into the PKGBUILDs of
# * 'python-linux-gpib' (https://aur.archlinux.org/packages/python-linux-gpib) and
# * 'python2-linux-gpib' (https://aur.archlinux.org/packages/python2-linux-gpib),
# on 2025-04-29.

_gitname='linux-gpib'
_pkgbase="${_gitname}"
pkgbase="${_pkgbase}-git"
pkgname=(
  "linux-gpib-git"
  "linux-gpib-docs-git"
  "linux-gpib-dkms-git"
  "linux-gpib-user-git"
  ## Bindings for other languages:
  "guile-linux-gpib-git"
  "perl-linux-gpib-git"
  "php-linux-gpib-git"
  "python-linux-gpib-git"
  #"python2-linux-gpib-git"
  "tcl-linux-gpib-git"
)
pkgver=4.3.7.r2157.20250726.0fc6e300
pkgrel=1
pkgdesc='A support package for GPIB (IEEE 488) hardware: Kernel drivers, userspace utilities and libraries, python bindings.'
arch=('i686' 'x86_64' 'aarch64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL-2.0-only')
makedepends=(
  'autoconf'
  'automake'
  'bison'
  # 'docbook-utils'
  'gcc-libs'
  'git'
  'glibc'
  'guile'
  'libtool'
  'make'
  'perl'
  'php'
  'python'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  # 'python2'
  # 'python2-setuptools'
  'readline'
  'tcl'
  'which'
)
source=(
  "${_gitname}::git+https://git.code.sf.net/p/linux-gpib/git"
  "dkms.conf.in"
  "linux-gpib-kernel.install"
)
sha256sums=(
  'SKIP'  # Main upstream source
  '9b7e01d13be0b15bc5c5a4d1d3a0c8e6cdb488c2eff5fb835c8672047ca9de77'  # dkms.conf.in
  'e745f2a6acc4f1bdf06e0ae15763e07f6a75b4112f7738d8c4fd2f5140e4327e'  # linux-gpib-user.install
)
options+=('emptydirs')


prepare() {
  cd "${srcdir}"

  printf '%s\n' "   > Creating 'dkms.conf' from 'dkms.conf.in' ..."
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" dkms.conf.in > dkms.conf

  cd "${srcdir}/${_gitname}"

  git log > git.log

  cd linux-gpib-kernel

  printf '%s\n' "   > Patching kernel module makefile to be DKMS compatible ..."
  sed -E -e 's|`uname -r`|$(LINUX_VERSION)|' -i Makefile

  printf '%s\n' "   > Changing some stuff in some driver sources ..."
  sed -i -e 's/ioremap_nocache/ioremap/g' drivers/gpib/eastwood/fluke_gpib.c
  sed -i -e 's/config.slave_id = 0;//g' drivers/gpib/eastwood/fluke_gpib.c
  sed -i -e 's/ioremap_nocache/ioremap/g' drivers/gpib/fmh_gpib/fmh_gpib.c
  sed -i -e 's/config.slave_id = 0;//g' drivers/gpib/fmh_gpib/fmh_gpib.c

  case "${CARCH}" in
    'x86_64')
      printf '%s\n' "   > remove the GPIO driver from build recipe as it's failing to compile on x64 ..."
      sed -i -e 's/obj-y += gpio\///g' drivers/gpib/Makefile
    ;;
  esac

  cd "${srcdir}/${_gitname}"
  cd linux-gpib-user

  printf '%s\n' "   > fix 'FXLOAD_OPTIONS' in 'usb/gpib_udev_fxloader.in' ..."
  sed -i -e 's/fx2/fx2 -p \$BUSNUM,\$DEVNUM/g' usb/gpib_udev_fxloader.in

  # printf '%s\n' "   > Creating 'usb/99-gpib-generic.rules' ..."
  # printf '%s\n' 'ACTION=="add|change", KERNEL=="gpib[0-9]*", MODE="0660", GROUP="gpib"' >| usb/99-gpib-generic.rules

  cd "${srcdir}/${_gitname}"
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(grep -E '^[[:space:]]*#define[[:space:]]+GPIB_VERSION' linux-gpib-kernel/drivers/gpib/include/version.h | tail -n1 | awk '{print $3}' | tr -d \"\')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_gitname}"
  cd linux-gpib-user

  printf '%s\n' "   > Configuring userland utils ..."
  ./bootstrap
  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --enable-shared \
      --enable-static \
      --enable-guile-binding \
      --enable-perl-binding \
      --enable-php-binding \
      --enable-python-binding \
      --enable-tcl-binding \
      --disable-documentation
      # --with-tcl=/usr/lib
  printf '%s\n' "   > Building userland utils ..."
  make

  printf '%s\n' "   > Building python binding using 'python -m build --wheel --no-isolation' ..."
  cd language/python
  python -m build --wheel --no-isolation

  ## INFO: If you want to build for 'python2', add it to 'makedepends' array and use 'python2 setup.py ...' in the 'linux-gpib-user/language/python' directory.
}

package_linux-gpib-git() {
  pkgdesc="Metapackage installing 'linux-gpib-kernel' and 'linux-gpib-user', and providing 'linux-gpib' dependency."
  arch=('any')
  depends=(
    "linux-gpib-dkms-git=${pkgver}"
    "linux-gpib-user-git=${pkgver}"
  )
  optdepends=(
    "python-linux-gpib:   Python bindings."
    "python2-linux-gpib:  Python2 bindings."
  )
  provides=(
    "linux-gpib=${pkgver}"
  )
  conflicts=()
  replaces=(
    "linux-gpib-svn<=r2106"
  )
}

package_linux-gpib-docs-git() {
  pkgdesc="Documentation for 'linux-gpib-*' packages."
  arch=('any')
  license=('GFDL-1.2-no-invariants-or-later')
  depends=()
  optdepends=(
    "linux-gpib-modules:  For the kernel modules this documentation is for."
    "linux-gpib-user:     For the user space utilities this documentation is for."
    "php:                 For PHP examples."
    "perl:                For Perl examples."
    "tk:                  For tcl examples."
  )
  provides=(
    "linux-gpib-docs=${pkgver}"
  )
  conflicts=(
    "linux-gpib-docs"
  )
  replaces=()

  cd "${srcdir}/${_gitname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}"      git.log ChangeLog README.md README.rel

  cd linux-gpib-kernel
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-kernel" AUTHORS INSTALL NEWS README

  cd ../linux-gpib-user
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user"   AUTHORS ChangeLog INSTALL README README.HAMEG README.hp82335 TODO
  cp -rv doc "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user"/

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  doc/fdl.xml


  local _binding
  for _binding in guile perl python tcl; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user/${_binding}"  "language/${_binding}/README"
  done

  cp -rv language/perl/examples "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user/perl"/
  find "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user/perl/examples" -type f -name '*.pl' -exec chmod 775 {} +
  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user/php"

  cp -rv language/php/TESTS "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user/php"/

  cp -rv language/tcl/examples "${pkgdir}/usr/share/doc/${_pkgbase}/linux-gpib-user/tcl"/
}

package_linux-gpib-dkms-git() {
  pkgdesc="Kernel drivers (DKMS) for some GPIB (IEEE 488) hardware."
  depends=(
    'dkms'
    'linux>=2.6.8'
  )
  optdepends=(
    "fxload:              firmware upload support for NI USB-B, Keithley KUSB-488 and Agilent 82357."
    "linux-gpib-firmware: Firmware for some devices."
    "linux-gpib-libs:     User space libraries."
    "linux-gpib-tools:    User space utilities."
    "linux-gpib-udev:     udev rules."
    "linux-gpib-docs:     Documentation."
    "gpib-utils:          More user space utilities."
  )
  provides=(
    "linux-gpib-dkms=${pkgver}"
    "linux-gpib-kernel=${pkgver}"
    "linux-gpib-kernel-git=${pkgver}"
    "linux-gpib-modules=${pkgver}"
  )
  conflicts=(
    "linux-gpib-dkms"
    "linux-gpib-kernel"
    "linux-gpib-modules"
  )
  replaces=()
  install='linux-gpib-kernel.install'

  cd "${srcdir}/${_gitname}"

  local _modulesourceinstalldir="/usr/src/linux-gpib-${pkgver}"
  install -dvm755 "${pkgdir}/${_modulesourceinstalldir}"
  cp -rv linux-gpib-kernel/* "${pkgdir}/${_modulesourceinstalldir}"/
  install -Dvm644 -t "${pkgdir}/${_modulesourceinstalldir}"  "${srcdir}/dkms.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  linux-gpib-kernel/COPYING
}

package_linux-gpib-user-git() {
  pkgdesc='Userspace libraries and tools for GPIB (IEEE 488) hardware, as well as udev rules.'
  depends=(
    'bash'
    'gcc-libs'
    'glibc'
    'libreadline.so'
  )
  optdepends=(
    "linux-gpib-docs:  Documentation."
    "udev:             For the provided udev rules."
  )
  provides=(
    "linux-gpib-user=${pkgver}"
    "linux-gpib-libs=${pkgver}"
    "linux-gpib-libs-git=${pkgver}"
    "linux-gpib-tools=${pkgver}"
    "linux-gpib-tools-git=${pkgver}"
    "linux-gpib-udev=${pkgver}"
    "linux-gpib-udev-git=${pkgver}"
    "libgpib.so"
  )
  conflicts=(
    "linux-gpib-user"
    "linux-gpib-libs"
    "linux-gpib-tools"
    "linux-gpib-udev"
    "libgpib.so"
  )
  replaces=()
  backup=(
    'etc/gpib.conf'
    'etc/udev/rules.d/98-gpib-generic.rules'
    'etc/udev/rules.d/99-agilent_82357a.rules'
    'etc/udev/rules.d/99-lpvo_usb_gpib.rules'
    'etc/udev/rules.d/99-ni_usb_gpib.rules'
  )

  cd "${srcdir}/${_gitname}/linux-gpib-user"
  printf '%s\n' "   > Installing user space libraries and programmes ..."
  make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" -j1 install

  ## Remove the language bindings which will be installed by the separate packages:
  printf '%s\n' "   > Removing files that are provided by split out language binding packages ..."
  rm -fv "${pkgdir}/usr/lib"/libgpib-guile*.so
  rm -Rfv "${pkgdir}/usr/lib"/php
  rm -Rfv "${pkgdir}/usr/lib"/python3*
  rm -fv "${pkgdir}/usr/lib"/libgpib_tcl*.so

  cd "${srcdir}/${_gitname}"

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  linux-gpib-user/COPYING
}

package_guile-linux-gpib-git() {
  pkgdesc="Guile bindings for 'linux-gpib' (libraries for GPIB (IEEE 488) hardware)."
  depends=(
    "libgpib.so"
    "glibc"
    "guile"
  )
  optdepends=(
    "linux-gpib-docs:  Documentation"
  )
  provides=(
    "guile-linux-gpib=${pkgver}"
  )
  conflicts=(
    "guile-linux-gpib"
  )
  replaces=()

  cd "${srcdir}/${_gitname}/linux-gpib-user/language/guile"
  printf '%s\n' "   > Installing guile bindings ..."
  make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" -j1 install

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/${_gitname}/linux-gpib-user/COPYING"
}

package_perl-linux-gpib-git() {
  pkgdesc="Perl bindings for 'linux-gpib' (libraries for GPIB (IEEE 488) hardware)."
  depends=(
    "libgpib.so"
    "glibc"
    "perl"
  )
  optdepends=(
    "linux-gpib-docs:  Documentation"
  )
  provides=(
    "perl-linux-gpib=${pkgver}"
  )
  conflicts=(
    "perl-linux-gpib"
  )
  replaces=()

  cd "${srcdir}/${_gitname}/linux-gpib-user/language/perl"
  printf '%s\n' "   > Installing perl bindings ..."
  make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" -j1 install

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/${_gitname}/linux-gpib-user/COPYING"
}

package_php-linux-gpib-git() {
  pkgdesc="PHP bindings for 'linux-gpib' (libraries for GPIB (IEEE 488) hardware)."
  depends=(
    "libgpib.so"
    "glibc"
    "php"
  )
  optdepends=(
    "linux-gpib-docs:  Documentation"
  )
  provides=(
    "php-linux-gpib=${pkgver}"
  )
  conflicts=(
    "php-linux-gpib"
  )
  replaces=()

  cd "${srcdir}/${_gitname}/linux-gpib-user/language/php"
  printf '%s\n' "   > Installing php bindings ..."
  make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" -j1 install

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/${_gitname}/linux-gpib-user/COPYING"
}

package_python-linux-gpib-git() {
  pkgdesc="Python 3 bindings for 'linux-gpib' (libraries for GPIB (IEEE 488) hardware)."
  depends=(
    "libgpib.so"
    "glibc"
    "python>=3"
  )
  optdepends=(
    "linux-gpib-docs:  Documentation"
  )
  provides=(
    "python-linux-gpib=${pkgver}"
  )
  conflicts=(
    "python-linux-gpib"
  )
  replaces=()

  cd "${srcdir}/${_gitname}/linux-gpib-user/language/python"
  printf '%s\n' "   > Installing python bindings ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
  # make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" -j1 install

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/${_gitname}/linux-gpib-user/COPYING"
}

# package_python2-linux-gpib-git() {
#   pkgdesc="Python 2 bindings for 'linux-gpib' (libraries for GPIB (IEEE 488) hardware)."
#   depends=(
#     "libgpib.so"
#     "glibc"
#     "python2"
#   )
#   optdepends=(
#     "linux-gpib-docs:  Documentation"
#   )
#   provides=(
#     "python2-linux-gpib=${pkgver}"
#   )
#   conflicts=(
#     "python2-linux-gpib"
#   )
#   replaces=()
# 
#   cd "${srcdir}/${_gitname}/linux-gpib-user/language/python"
#   printf '%s\n' "   > Installing python2 bindings ..."
#   python2 setup.py install --prefix=/usr --root=${pkgdir}
# 
#   install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/${_gitname}/linux-gpib-user/COPYING"
# }

package_tcl-linux-gpib-git() {
  pkgdesc="Tcl bindings for 'linux-gpib' (libraries for GPIB (IEEE 488) hardware)."
  depends=(
    "libgpib.so"
    "glibc"
    "tcl"
  )
  optdepends=(
    "linux-gpib-docs:  Documentation"
  )
  provides=(
    "tcl-linux-gpib=${pkgver}"
  )
  conflicts=(
    "tcl-linux-gpib"
  )
  replaces=()

  cd "${srcdir}/${_gitname}/linux-gpib-user/language/tcl"
  printf '%s\n' "   > Installing tcl bindings ..."
  make INSTALL_MOD_PATH="${pkgdir}" DESTDIR="${pkgdir}" -j1 install

  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "${srcdir}/${_gitname}/linux-gpib-user/COPYING"
}

# vim:ts=4:et:sw=4
