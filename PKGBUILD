# Maintainer: Marcel Huber <`echo "moc tknup liamg tä oofrebuhlecram" | rev`>

pkgbase=mpss
pkgname=(mpss-modules-dkms mpss-gen-symver-map mpss-libscif mpss-micmgmt-miclib
         mpss-micmgmt-tools mpss-micmgmt-python mpss-daemon
         mpss-boot-files mpss-flash-files)
pkgdesc="Intel® Manycore Platform Software Stack"
pkgver=3.7.1
pkgrel=6
arch=('x86_64')
url="https://software.intel.com/en-us/articles/intel-manycore-platform-software-stack-mpss"
license=('LGPL2.1')
depends=(dkms python nfs-utils netctl ifplugd)
makedepends=(asciidoc libarchive)
source_x86_64=(
  http://registrationcenter-download.intel.com/akdlm/irc_nas/9226/mpss-${pkgver}-linux.tar
  http://registrationcenter-download.intel.com/akdlm/irc_nas/9226/mpss-${pkgver}-k1om.tar
  http://registrationcenter-download.intel.com/akdlm/irc_nas/9226/mpss-src-${pkgver}.tar
  dkms.conf
  blacklist-mpss.conf
  mpss-daemon.service
  micmgmt.setup.py
  mpss-daemon-archlinux-extension.patch
  mpss-daemon-minimize-modules.patch
  mpss-modules-explicit-coprocessor-build.patch
  mpss-modules-init-indent.patch
  mpss-modules-rcu-lockup.patch
  mpss-modules-page-cache.patch
  mpss-gen-symver-map-python3-compat.patch
  mpss-micmgmt-misleading-indent.patch
  mpss-micmgmt-remove-inline0.patch
  mpss-micmgmt-remove-inline1.patch
  mpss-micmgmt-whitespace.patch
)
sha256sums_x86_64=('3a8d070d7b82d41afa67766db8e3305621643ced1b3f8e2845bf333cdf39b83b'
                   'd73abe69df8f36e6214194fc010877b2ee5ea47e2227acf823d88896804899aa'
                   '4458257ded25dc7b69fa6de49e7ec066d0053ef6be54267bb283dbb4e6eb38c8'
                   'a76162c169073060ee3a966e95342f29b3e342c956d29169c10a6dd97e342fa5'
                   '540cfb724426aaa92fd3998cf6f1a34e491332316af88848d251409bdd596fb3'
                   '8fe2d3b0f1374cf74ea9ef1c5ade0a6cdf891cbcd0438420c19da27feef144c7'
                   '191d6fd54157ad5a9465947c73b4332a83fc4411be5d9738d0594a2b7ddb7273'
                   '265d26efa3e127f4d5211bb32e65c70beb9ee6b1703a5e2c146e9aa3e4d33604'
                   'b135e8af616fa2404777ae8c689ea97b9ffb73d18036039fd545108b9b9310fc'
                   '2169df02b5623c43feb272f2d142472d2d42a089a370a6f33f470aa3dea50603'
                   'b1264678b77a3ae64716e507e225fce5cfd1c77ae77d0119071c28cab74d0a97'
                   '3690295e9e24e6a8b42323ca5b2b76f56a3a8f4bdee75b3dfc5a3f01e3f3d1bc'
                   'ace053c75b096c2e120c73076c9a86fcbf1528518761766b9e41e975dc44ae43'
                   '17791147eef797e4fe161bb08e989685303dbff866d01f2e37335c09e6367688'
                   '64d26ff84029d246868f995cf9fd49b20851a671208c3fa474e0fef5216708cd'
                   '99d0e6d58a14bfbbe96b41de8f0f4383225acaefba8e4d48c7ff86924502c545'
                   'ac8e471ddd8ff1cba8b269434ab0efac2ece7bc68cf0044147d99e70e831ce09'
                   '1e523015afb1919023d61648126e13baa7d577a9b64aa3445dd67e156e75e5fa')

extract_rpmfiles() {
  _extract_rpmfiles=(
    "mpss-boot-files-${pkgver}-1.glibc2.12.${arch}.rpm|mpss-boot-files"
    "mpss-micsmc-gui-${pkgver}-1.glibc2.12.${arch}.rpm|mpss-micmgmt-tools"
    "glibc2.12pkg-mpss-flash-${pkgver}-1.glibc2.12.${arch}.rpm|mpss-flash-files"
    "k1om/mpss-rasmm-kernel-${pkgver}-1.k1om.rpm|mpss-boot-files"
    "k1om/mpss-memdiag-kernel-${pkgver}-1.k1om.rpm|mpss-boot-files"
  )
  for ef in "${_extract_rpmfiles[@]}"; do
    _filepart="$(cut -d'|' -f1 <<<$ef)";
    _destdir="$(cut -d'|' -f2 <<<$ef)";
    msg2 "Extracting into $(basename $srcdir)/$_destdir..."
    eval "bsdtar xf $srcdir/mpss-${pkgver}/${_filepart} -s '|^.*\$|${_destdir}/~|S'"
  done
}

extract_srcfiles() {
  _extract_srcfiles=(
    "src/mpss-modules-${pkgver}.tar.bz2|mpss-modules"
    "src/gen-symver-map-${pkgver}.tar.bz2|mpss-gen-symver-map"
    "src/libscif-${pkgver}.tar.bz2|mpss-libscif"
    "src/mpss-daemon-${pkgver}.tar.bz2|mpss-daemon"
    "src/mpss-micmgmt-${pkgver}.tar.bz2|mpss-micmgmt"
    "src/mpss-metadata-${pkgver}.tar.bz2|mpss-metadata"
  )
  for ef in "${_extract_srcfiles[@]}"; do
    _filepart="$(cut -d'|' -f1 <<<$ef)";
    _destdir="$(cut -d'|' -f2 <<<$ef)";
    msg2 "Extracting into $(basename $srcdir)/$_destdir..."
    eval "bsdtar xf $srcdir/mpss-${pkgver}/${_filepart} -s '|^.*-${pkgver}|${_destdir}|S'"
  done
}

prepare() {
  extract_rpmfiles
  extract_srcfiles
  msg2 "Patching files..."
  for p in $srcdir/*.patch; do
    ( cd $srcdir && patch --forward --strip=0 --input="$p" );
  done
}

# common build variables
_metadata_include_dir=$(pwd)/src/mpss-metadata
_install_root="$(pwd)/pkg/build"
_install_bin="${_install_root}/usr/bin"
_install_include="${_install_root}/usr/include"
_install_lib="${_install_root}/usr/lib"

ensure_pkg_install_dirs() {
  for d in "$_install_bin" "$_install_include" "$_install_lib"; do
    mkdir -p "$d";
   done
}

package_mpss-modules-dkms() {
  depends=(dkms)
  install=$pkgname.install
  pkgdesc="mic Kernel module of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname%-*}
  msg2 "Starting make conf_install in ${_pkgname}..."
  make -C $_pkgname \
    DESTDIR="$pkgdir" \
    sysconfdir=/etc \
    includedir=/usr/include \
    conf_install dev_install

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
  install -Dm644 blacklist-mpss.conf "${pkgdir}"/etc/modprobe.d/
  sed -e "s|/sbin/modprobe|/usr/bin/modprobe|" \
      -i "${pkgdir}"/etc/sysconfig/modules/mic.modules

  sed -e '/redhat/ d' -e '/rhel7/ d' \
      -i "${pkgdir}"/etc/udev/rules.d/50-udev-mic.rules

  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  msg2 "Copy sources (including Makefile) for dmks build..."
  cp -r ${_pkgname}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  cp  ${_pkgname}/.mpss-metadata "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  rm "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/*mic.*

  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install again to fixed destination for including and linking
  ensure_pkg_install_dirs
  make -C $_pkgname \
    DESTDIR="$_install_root" \
    sysconfdir=/etc \
    includedir=/usr/include \
    dev_install
}

package_mpss-gen-symver-map() {
  depends=(python)
  pkgdesc="gen-symver-map utility of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=$pkgname
  install -D -m755 ${_pkgname}/gen-symver-map "$pkgdir/usr/bin/gen-symver-map"
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install again to fixed destination for its usage
  ensure_pkg_install_dirs
  install -D -m755 ${_pkgname}/gen-symver-map "$_install_root/usr/bin/gen-symver-map"
}

package_mpss-libscif() {
  depends=(mpss-modules-dkms)
  pkgdesc="libscif library of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=$pkgname
  msg2 "Starting make in ${_pkgname}..."

  # need to extend path for gen-symver-map tool
  PATH=$PATH:$_install_bin \
  CFLAGS="-I$_install_include -g" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    all

  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    install

  install -D -m644 ${_pkgname}/COPYING.LIB "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install again to fixed destination for including and linking
  ensure_pkg_install_dirs
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$_install_root" \
    prefix=/usr \
    install
}

package_mpss-micmgmt-miclib() {
  depends=(mpss-libscif)
  pkgdesc="micmgmt library of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname%-*}
  msg2 "Starting make in ${_pkgname}..."

  LIBPATH="-L$_install_lib" \
  CPPFLAGS="-I$_install_include" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    lib

  CPPFLAGS="-I$_install_include" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    libdir=/usr/lib \
    install_lib

  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # install again to fixed destination for including and linking
  ensure_pkg_install_dirs
  CPPFLAGS="-I$_install_include" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$_install_root" \
    prefix=/usr \
    libdir=/usr/lib \
    install_lib
}

package_mpss-micmgmt-tools() {
  depends=(mpss-micmgmt-miclib netctl ifplugd)
  pkgdesc="micmgmt tools of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname%-*}
  msg2 "Starting make in ${_pkgname}..."

  LIBPATH="-L$_install_lib" \
  LDFLAGS="-L$_install_lib" \
  CFLAGS="-I$_install_include" \
  CPPFLAGS="-I$_install_include" \
  make -C $_pkgname -j1 \
    --include-dir=$_metadata_include_dir \
    all

  CFLAGS="-I$_install_include" \
  CPPFLAGS="-I$_install_include" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    install
  # remove files already installed by mpss-micmgmt-miclib
  rm $pkgdir/usr/share/doc/micmgmt/libmicmgmt.7.html

  install -D -m755 $srcdir/${pkgname}/usr/bin/micsmc-gui "$pkgdir"/usr/bin/
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-micmgmt-python() {
  depends=(mpss-micmgmt-miclib python)
  pkgdesc="miclib python wrapper of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  arch=('any')
  _pkgname=${pkgname%-*}
  cd "$srcdir/$_pkgname/miclib_py"
  sed -e "s/@PKGVER@/${pkgver}/" \
      $srcdir/micmgmt.setup.py >setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-boot-files() {
  depends=()
  pkgdesc="Boot image for the coprocessor of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  arch=('any')
  _pkgname=${pkgname}
  install -d -m644 $pkgdir/usr/share/mpss/boot/
  bsdtar cf - -C $srcdir/${_pkgname}/usr/share/mpss/boot/ . | bsdtar xf - -C "$pkgdir"/usr/share/mpss/boot/
  install -D -m644 $srcdir/${_pkgname}/usr/share/doc/${_pkgname}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-flash-files() {
  depends=()
  pkgdesc="Flash files for the coprocessor of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  arch=('any')
  _pkgname=${pkgname}
  install -d -m644 $pkgdir/usr/share/mpss/flash/
  bsdtar cf - -C $srcdir/${_pkgname}/usr/share/mpss/flash/ . | bsdtar xf - -C "$pkgdir"/usr/share/mpss/flash/
}

package_mpss-daemon() {
  depends=(mpss-libscif nfs-utils mpss-boot-files)
  pkgdesc="mpssd and micctrl of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname}
  msg2 "Starting make in ${_pkgname}..."

  LDFLAGS="-g -L$_install_lib" \
  CFLAGS="-g -I$_install_include" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    all

  LDFLAGS="-g -L$_install_lib" \
  CFLAGS="-g -I$_install_include" \
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$pkgdir" \
    prefix=/usr \
    sbindir=/usr/bin \
    libdir=/usr/lib \
    install

  sed -e "s|/usr/sbin/|/usr/bin/|g" \
      -i "${pkgdir}"/etc/mpss/mpss.*

  rm "${pkgdir}"/etc/mpss/mpss.{redhat,ubuntu,suse,service,resume,suspend*}

  install -D -m644 $srcdir/mpss-daemon.service "$pkgdir/usr/lib/systemd/system/mpssd.service"
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

