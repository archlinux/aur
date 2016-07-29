# Maintainer: Marcel Huber <`echo "moc tknup liamg tä oofrebuhlecram" | rev`>

pkgbase=mpss
pkgname=(mpss-modules-dkms mpss-gen-symver-map mpss-libscif mpss-micmgmt-miclib mpss-micmgmt-tools mpss-micmgmt-python mpss-daemon)
pkgdesc="Intel® Manycore Platform Software Stack"
pkgver=3.7.1
pkgrel=2
arch=('x86_64')
url="https://software.intel.com/en-us/articles/intel-manycore-platform-software-stack-mpss"
license=('LGPL2.1')
depends=(dkms python)
makedepends=(asciidoc)
source=(dkms.conf
        blacklist-mic-host.conf
        micmgmt.setup.py)
source_x86_64=(git+https://github.com/marcelhuberfoo/mpss-modules.git#branch=ModuleAndKernelUpdates
               git+https://github.com/marcelhuberfoo/mpss-gen-symver-map.git
               git+https://github.com/marcelhuberfoo/mpss-libscif.git
               git+https://github.com/marcelhuberfoo/mpss-daemon.git
               git+https://github.com/marcelhuberfoo/mpss-micmgmt.git
               git+https://github.com/marcelhuberfoo/mpss-metadata.git)
sha256sums=('a76162c169073060ee3a966e95342f29b3e342c956d29169c10a6dd97e342fa5'
            '42dda3527ed2496b851c0fad6a841f660a0c086ecf742bb4f132308b9e38d913'
            '191d6fd54157ad5a9465947c73b4332a83fc4411be5d9738d0594a2b7ddb7273')
sha256sums_x86_64=('SKIP'
                   'SKIP'
                   'SKIP'
                   'SKIP'
                   'SKIP'
                   'SKIP')

## within each split package’s packaging function:
# arch
# backup
# changelog
# conflicts
# depends
# groups
# install
# license
# optdepends
# options
# pkgdesc
# provides
# replaces
# url

package_mpss-modules-dkms() {
  depends=(dkms)
  install=$pkgname.install
  pkgdesc="mic Kernel module of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname%-*}
  msg2 "Starting make conf_install in ${_pkgname}..."
  make -C $_pkgname DESTDIR="$pkgdir" sysconfdir=/etc includedir=/usr/include \
    conf_install dev_install

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf
  install -Dm644 blacklist-mic-host.conf "${pkgdir}"/etc/modprobe.d/
  sed -e "s|/sbin/modprobe|/usr/bin/modprobe|" \
      -i "${pkgdir}"/etc/sysconfig/modules/mic.modules

  sed '8,9 d' \
      -i "${pkgdir}"/etc/udev/rules.d/50-udev-mic.rules

  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/dkms.conf

  msg2 "Copy sources (including Makefile) for dmks build..."
  cp -r ${_pkgname}/* "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  cp  ${_pkgname}/.mpss-metadata "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/
  rm "${pkgdir}"/usr/src/${_pkgname}-${pkgver}/*mic.*

  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-gen-symver-map() {
  depends=(python)
  pkgdesc="gen-symver-map utility of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=$pkgname
  install -D -m755 ${_pkgname}/gen-symver-map "$pkgdir/usr/bin/gen-symver-map"
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-libscif() {
  depends=(mpss-modules-dkms mpss-gen-symver-map)
  makedepends=(mpss-gen-symver-map)
  pkgdesc="libscif library of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=$pkgname
  _metadata_include_dir=$srcdir/mpss-metadata
  _modules_include_dir=$srcdir/mpss-modules/include
  _gem_symver_map_path=$srcdir/mpss-gen-symver-map
  msg2 "Starting make in ${_pkgname}..."
  PATH=$PATH:$_gem_symver_map_path \
  CFLAGS="-I$_modules_include_dir -g" \
    make -C $_pkgname \
      --include-dir=$_metadata_include_dir \
      all
  make -C $_pkgname \
    --include-dir=$_metadata_include_dir \
    DESTDIR="$pkgdir" \
    prefix=/usr install
  install -D -m644 ${_pkgname}/COPYING.LIB "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-micmgmt-miclib() {
  depends=(mpss-libscif)
  pkgdesc="micmgmt library of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname%-*}
  _metadata_include_dir=$srcdir/mpss-metadata
  _modules_include_dir=$startdir/pkg/mpss-modules-dkms/usr/include
  _libscif_lib_dir=$startdir/pkg/mpss-libscif/usr/lib
  _libscif_include_dir=$srcdir/mpss-libscif
  msg2 "Starting make in ${_pkgname}..."
  LIBPATH="-L$_libscif_lib_dir" \
  CPPFLAGS="-I$_modules_include_dir -I$_libscif_include_dir" \
    make -C $_pkgname \
      --include-dir=$_metadata_include_dir \
      lib
  CPPFLAGS="-I$_modules_include_dir -I$_libscif_include_dir" \
    make -C $_pkgname \
      --include-dir=$_metadata_include_dir \
      DESTDIR="$pkgdir" \
      prefix=/usr \
      libdir=/usr/lib \
      install_lib
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-micmgmt-tools() {
  depends=(mpss-micmgmt-miclib)
  pkgdesc="micmgmt tools of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname%-*}
  _metadata_include_dir=$srcdir/mpss-metadata
  _modules_include_dir=$startdir/pkg/mpss-modules-dkms/usr/include
  _libscif_lib_dir=$startdir/pkg/mpss-libscif/usr/lib
  _libscif_include_dir=$srcdir/mpss-libscif
  _miclib_lib_dir=$startdir/pkg/mpss-micmgmt-miclib/usr/lib
  _miclib_include_dir=$startdir/pkg/mpss-micmgmt-miclib/usr/include
  msg2 "Starting make in ${_pkgname}..."
  LIBPATH="-L$_libscif_lib_dir -L$_miclib_lib_dir" \
  LDFLAGS="-L$_libscif_lib_dir -L$_miclib_lib_dir" \
  CFLAGS="-I$_modules_include_dir -I$_libscif_include_dir -I$_miclib_include_dir" \
  CPPFLAGS="-I$_modules_include_dir -I$_libscif_include_dir -I$_miclib_include_dir" \
    make -C $_pkgname -j1 \
      --include-dir=$_metadata_include_dir \
      all
  CFLAGS="-I$_modules_include_dir -I$_libscif_include_dir -I$_miclib_include_dir" \
  CPPFLAGS="-I$_modules_include_dir -I$_libscif_include_dir -I$_miclib_include_dir" \
    make -C $_pkgname \
      --include-dir=$_metadata_include_dir \
      DESTDIR="$pkgdir" \
      prefix=/usr \
      install
  # already installed by mpss-micmgmt-miclib
  rm $pkgdir/usr/share/doc/micmgmt/libmicmgmt.7.html
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-micmgmt-python() {
  depends=(mpss-micmgmt-miclib python)
  pkgdesc="miclib python wrapper of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  arch=('any')
  _pkgname=${pkgname%-*}
#  _metadata_include_dir=$srcdir/mpss-metadata
#  _site_package_dir=$(python -c 'import site; print(site.getsitepackages()[0])')
#  msg2 "Starting make in ${_pkgname}..."
#  make -C $_pkgname \
#    --include-dir=$_metadata_include_dir \
#    DESTDIR="$pkgdir" \
#    prefix=/usr \
#    srcdir=$_site_package_dir \
#    install_pywrapper
  cd "$srcdir/$_pkgname/miclib_py"
  sed -e "s/@PKGVER@/${pkgver}/" \
      $srcdir/micmgmt.setup.py >setup.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 $srcdir/${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_mpss-daemon() {
  depends=(mpss-libscif mpss-gen-symver-map)
  pkgdesc="mpssd and micctrl of Intel® Manycore Platform Software Stack"
  groups=(mpss)
  _pkgname=${pkgname}
  _metadata_include_dir=$srcdir/mpss-metadata
  _modules_include_dir=$startdir/pkg/mpss-modules-dkms/usr/include
  _libscif_lib_dir=$startdir/pkg/mpss-libscif/usr/lib
  _libscif_include_dir=$srcdir/mpss-libscif
  msg2 "Starting make in ${_pkgname}..."
  LDFLAGS="-g -L$_libscif_lib_dir" \
  CFLAGS="-g -I$_modules_include_dir -I$_libscif_include_dir" \
    make -C $_pkgname \
      --include-dir=$_metadata_include_dir \
      all
  LDFLAGS="-g -L$_libscif_lib_dir" \
  CFLAGS="-g -I$_modules_include_dir -I$_libscif_include_dir" \
    make -C $_pkgname \
      --include-dir=$_metadata_include_dir \
      DESTDIR="$pkgdir" \
      prefix=/usr \
      sbindir=/usr/bin \
      libdir=/usr/lib \
      install
  install -D -m644 ${_pkgname}/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

