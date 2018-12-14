# Maintainer: Mirko Scholz

pkgname=cctbx-bin
pkgver=1617
pkgrel=4
pkgdesc="The Computational Crystallography Toolbox (cctbx)"
arch=('x86_64')
url="https://cci.lbl.gov/cctbx_docs/index.html"
license=('BSD')
depends=(python2 libpng15)
makedepends=(fakechroot)
_installer="cctbx-installer-dev-$pkgver-intel-linux-2.6-x86_64-centos6"
source=("http://cci.lbl.gov/cctbx_build/dev-${pkgver}/${_installer}.tar.gz")
noextract=("${source[@]##*/}")
sha1sums=('6e66addfa2df9e96c29058a95748eeb792319877')
options=(!strip)

#
# this makes CCTBX available on Arch Linux
#
# I am not using any graphical facilities, only cctbx python modules
#
# The following tests succeed mostly
#
# cctbx.python /opt/cctbx-*/modules/cctbx_project/cctbx/run_tests.py
# cctbx.python /opt/cctbx-*/modules/cctbx_project/libtbx/run_tests.py
# cctbx.python /opt/cctbx-*/modules/cctbx_project/iotbx/run_tests.py
#
# The following tests fail 
#
# cctbx.python /opt/cctbx-*/modules/cctbx_project/scitbx/run_tests.py

package() {
  # follows https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=microchip-mplabx-bin
  mkdir -p "$pkgdir"/{etc,tmp,opt}
  ln -s /usr/bin "$pkgdir"
  echo "root:x:0:0:root:/root:/bin/bash" > "${pkgdir}/etc/passwd"
  echo "root:x:0:root" > "${pkgdir}/etc/group"
  # cp -r --reflink=auto --no-dereference --preserve=links "$srcdir/$_installer" "$pkgdir/tmp"
  (cd "$pkgdir/tmp"; tar xf "$srcdir/${_installer}.tar.gz")
  cat <<EOF > "$pkgdir/tmp/install.sh"
#!/bin/sh
PATH=/bin
echo Running CCTBX installer...
cd "/tmp/$_installer"
./install --verbose --prefix /opt
EOF
  chmod 0755 "$pkgdir/tmp/install.sh"

  # the installer uses the system's python (although it ships with its own version)
  env FAKECHROOT_EXCLUDE_PATH=/dev:/proc:/sys:/usr \
  fakechroot chroot "$pkgdir" /tmp/install.sh

  (cd "${pkgdir}/tmp/${_installer}"; install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE")

  rm -rf "$pkgdir"/{etc,tmp,bin}

  # don't know why it isn't set executable, tests work better that way
  find "$pkgdir/opt" -name libtbx.python -exec chmod a+x '{}' ';'

  mkdir -p "$pkgdir/usr/bin"
  cat <<EOF > "$pkgdir/usr/bin/cctbx.python"
#!/bin/sh
. /opt/cctbx-dev-${pkgver}/cctbx_env.sh
exec cctbx.python "\$@"
EOF
  chmod a+x "$pkgdir/usr/bin/cctbx.python"

}
