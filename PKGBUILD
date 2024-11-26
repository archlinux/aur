# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Pulphix <crimea.v@libero.it>

pkgbase="gamin"
pkgname=("${pkgbase}" "${pkgbase}-docs" "python2-${pkgbase}")
pkgver=0.1.10
pkgrel=10
pkgdesc="File and directory monitoring system defined to be a subset of the FAM (File Alteration Monitor)"
arch=('x86_64' 'i686')
url="https://download.gnome.org/sources/${pkgbase}"
license=('LGPL-2.0-only')
makedepends=('doxygen' 'glib2' 'gtk-doc' 'python2')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://download.gnome.org/sources/${pkgbase}/${pkgver%.*}/${_pkgsrc}.tar.gz"
        "${pkgbase}_armel-gnueabi.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-6/debian/patches/16_armel-gnueabi.patch"
        "${pkgbase}_deprecated_const_return.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-6/debian/patches/17_deprecated_const_return.patch"
        "${pkgbase}_server_deadlock.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/${pkgver}-6/debian/patches/18_gam_server_deadlocks.patch"
        "${pkgbase}_poll_files_on_ntfs4.patch")
sha512sums=('21bfe6fcf8fb3117cd5a08c8ce3b8d0d1dd23e478e60a95b76c20d02cc29b050dde086578d81037990484ff891c3e104d2cbbf3d294b4a79346b14a0cae075bb'
            '759d58d4dba14efad1790701e0b4357994139ec5aa1b3425e2a36e2fdf9dff839d4232a57d1dfb7130b8a5ade40dcf37d8d57d21660d00a47504f09b402a718f'
            'c4c10bee70c7231db395cbfe5bdf513ade6be599a11a9d35888ddfaca42d619fe2b5e87c2b2bab469ea98ba718bc01711252313ba5f53c392379b669f5b2902b'
            'ae2d3f3cd16e2da05836cbb2f21527896db5d5067ef4b120e943693234a685527eff528955ed80120265ca70e04a88cc28413cc34311d6faa068c620339fad38'
            'dcb23fd68e106a1b578235ef0b01b49773908ca6ded706610103f880f77a2aa0b0403cb720b9c6b062bac71e9d66cd2288b489c558839fc23295b18635bf399f')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "../${pkgbase}_armel-gnueabi.patch"
  patch -Np1 -i "../${pkgbase}_deprecated_const_return.patch"
  patch -Np1 -i "../${pkgbase}_server_deadlock.patch" # https://bugs.archlinux.org/task/33642
  patch -Np1 -i "../${pkgbase}_poll_files_on_ntfs4.patch"

  cd "python"
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' "${pkgbase}.py"
}

build() {
  export CFLAGS="${CFLAGS} \
    -Wno-error=implicit-function-declaration \
    -Wno-error=return-mismatch"

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --libexecdir="/usr/lib/${pkgbase}" \
    --with-threads \
    --with-python='/usr/bin/python2' \
    --disable-static \
    --disable-debug \
    --disable-debug-api \
    --enable-docs
  make
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   make check
# }

package_gamin() {
  depends=('glib2' 'glibc')
  provides=('fam' 'libgamin-1.so' 'libfam.so')
  conflicts=('fam')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README"    "${pkgdir}/usr/share/doc/${pkgbase}/README"
  # install -vDm644 "NEWS"      "${pkgdir}/usr/share/doc/${pkgbase}/NEWS"
  install -vDm644 "ChangeLog" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG"
  install -vDm644 "AUTHORS"   "${pkgdir}/usr/share/doc/${pkgbase}/AUTHORS"
  install -vDm644 "COPYING"   "${pkgdir}/usr/share/licenses/${pkgbase}/COPYING"

  cd "${pkgdir}/usr/lib"
  rm -rf python*
}

package_gamin-docs() {
  arch=('any')
  pkgdesc+=" (documentation)"

  cd "${srcdir}/${_pkgsrc}/doc"
  find . -type f \( -name "*.html" -o -name "*.fig" -o -name "*.gif" \) -exec \
    install -vDm644 {} "${pkgdir}/usr/share/doc/${pkgbase}/html/$(basename {})" \;
}

package_python2-gamin() {
  pkgdesc+=" (python2 bindings)"
  depends=('gamin' 'glibc' 'python2')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf include

  cd "lib"
  rm -rf *gamin* *libfam* pkgconfig
}

# vim:set ts=2 sw=2 et:
