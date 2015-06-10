# Maintainer: Kevin Borgolte <cao@cao.vc>

# This PKGBUILD file is maintained at:
#   https://github.com/cao/arch-aur-packages
# Contributions and pull requests are welcome and they will be posted to AUR
# after verification (don't forget to add yourself as a contributor as per
# APS) :)

# Notes:
#   1. This package does NOT conflict with the AUR package qira. It can be
#      installed alongside qira because it is completely contained (hence it
#      cannot break dependencies) and it is available via qira-git instead of
#      qira.
#   2. We do not build BAP and we are not including OPAM or any of the OCaml
#      nuts and bolts.
#   3. We do build specific versions of QEMU for QIRA though. Therefore, the
#      created package is quite large (~400+ MB). This does NOT violate the
#      Arch packaging standard because we are not replacing an already
#      installed QEMU (only QIRA uses the QEMU version that we are compiling
#      and including).

# TODOs:
#   1. Verify that dependencies are exhaustive and minimal.
#   2. Reduce package size: trim / remove unnecessary files from QIRA's QEMU.

pkgname=qira-git
pkgver=r1000.3313476
pkgrel=4
pkgdesc='QEMU Interactive Runtime Analyser'
url='http://qira.me/'
arch=('x86_64' 'i686')
license=('GPL2')
source=("qira-git::git+http://github.com/BinaryAnalysisPlatform/qira.git#branch=master")
md5sums=(SKIP)
options=(!strip)
depends=('graphviz' 'zlib')

# QIRA dependencies first, QEMU dependencies after (via qemu PKGBUILD)
makedepends=('python2-setuptools' 'python2-virtualenv' 'python2-pip'
             'fakeroot' 'fakechroot' 'wget' 'glib2' 'unzip' 'zlib' 'git'

             'pixman' 'libjpeg' 'libpng' 'sdl' 'alsa-lib' 'nss' 'glib2'
             'gnutls>=2.4.1' 'bluez-libs' 'vde2' 'util-linux' 'curl' 'libsasl'
             'libgl' 'libpulse' 'seabios' 'libcap-ng' 'libaio' 'libseccomp'
             'libiscsi' 'libcacard' 'spice' 'spice-protocol' 'python2'
             'usbredir')

pkgver() {
  cd "$srcdir/$pkgname"
  (set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # We want to install the virtualenv when creating the package to have a
  # contained QIRA installation. This requires some fakechroot magic
  # because the path of the virtualenv is hard-coded (and some packages
  # cannot be relocated). Technically, we only need the chroot for /opt,
  # which is why we are excluding most default directories (some might be
  # missing).
  export FAKECHROOT_BASE=${pkgdir}
  export FAKECHROOT_EXCLUDE_PATH=/bin:/usr:/proc:/dev:/var:/home:/etc:${srcdir}

  # Capstone workaround
  ABSBUILDDIR=${BUILDDIR}
  unset BUILDDIR

  # Besides the virtualenv, we also have to build QIRA's QEMU in our
  # fakechroot because it needs Python 2.7 at compile time.
  #
  # yaourt behaves a bit weirdly when using fakechroot, which results in
  # QEMU's configure not running properly (as /bin/sh does not behaves
  # unexpected) and it generates out-of-tree/in-tree compilation error
  # messages on make.
  fakechroot \
    bash -c "virtualenv-2.7 \"/opt/${pkgname}/venv\"
             source \"/opt/${pkgname}/venv/bin/activate\"

             cd ${srcdir}/${pkgname}
             pip2 install -U -I -r requirements.txt

             echo '---------------------------------------------------------'
             echo 'You need to compile qemu after installation. :('
             echo 'Currently, building qemu will fail via makepkg because of'
             echo 'path-related issues (qemu configure does not detect the'
             echo 'path at configuration/build time, which I do not have to'
             echo 'fix just yet). To build qemu simply enable the venv:'
             echo '  source /opt/qira-git/venv/bin/activate'
             echo 'and go to /opt/qira-git/tracers/ and run:'
             echo '  qemu_build.sh'
             echo 'Sorry!'
             echo '---------------------------------------------------------'"

  # Capstone workaround
  export BUILDDIR=${ABSBUILDDIR}


  # No more fakechroot magic from here on out :)
  cd $srcdir/$pkgname

  # Patch out BAP and OPAM/OCaml
  mv qiradb/VERSION VERSION
  sed -i 's/WITH_BAP = True/WITH_BAP = False/' middleware/qira_config.py
  sed -i '/eval $(opam config env)/d' qira
  rm -r qiradb
  rm -r releases

  # Move files over
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/qira" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
