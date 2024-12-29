# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Pulphix <crimea.v@libero.it>

pkgbase="gamin"
pkgname=("${pkgbase}" "${pkgbase}-docs" "python2-${pkgbase}")
pkgver=0.1.10
pkgrel=11
pkgdesc="File and directory monitoring system defined to be a subset of the FAM (File Alteration Monitor)"
arch=('x86_64' 'i686')
url="https://gitlab.gnome.org/Archive/gamin"
license=('LGPL-2.0-only')
makedepends=('doxygen' 'glib2' 'gtk-doc' 'python2')
_pkgsrc="${pkgbase}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://download.gnome.org/sources/${pkgbase}/${pkgver%.*}/${_pkgsrc}.tar.gz"
        "${pkgbase}_linux-specific_armel-gnueabi.patch::${url}/-/commit/05dcfcd69848e119c6a30d363bc41e896029f8af.patch"
        "${pkgbase}_poll_files_on_nfs4.patch::${url}/-/commit/b92b17ecced6df463da73d6de566740cf5cd00d4.patch"
        "${pkgbase}_deprecated_g_const_return.patch::${url}/-/commit/77fe68f43ce75e920b0a94b0bc572cf3a21714f2.patch"
        "${pkgbase}_server_deadlock_ih_sub_cancel.patch::${url}/-/commit/f9c67a13af33f389429e4e760f2023a23a9ac19f.patch")
sha512sums=('21bfe6fcf8fb3117cd5a08c8ce3b8d0d1dd23e478e60a95b76c20d02cc29b050dde086578d81037990484ff891c3e104d2cbbf3d294b4a79346b14a0cae075bb'
            '915a8d9fc8254da0707e928c5c4578dada8d95e40893c1e0ccf275cd190016d3ccc223589c04d7da06999627b72722b2e9259e23f740091587afe4ecbc48b4a3'
            '59b78ca12c31661ea85a213cb7dc79c1bf35a53639f073fdc7618200e0d5c0c15c50b3670f1f31c156640a85a2bad8eba5e7622c7eab9dff5124a9c5c8d1775f'
            '4c339bb91ea8b930b95bbfb4cbb71bb1e1a9e7d41f22639e8eca3719089a9110d8538087751c16f8259f1834e84b07a968f95b1a79c06b6bb5516c5638722c18'
            '69e6a0cbaffacde809d7be6839269d61d29fa8fcec4b7fa8c4c69cf41eb612c5f03cba5cb3e6b58fc25b63158a3d71f8895be96213edbb5a9d9150057a6d58c2')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # https://bugzilla.gnome.org/show_bug.cgi?id=588338
  patch -Np1 -i "${srcdir}/${pkgbase}_linux-specific_armel-gnueabi.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=693006
  patch -Np1 -i "${srcdir}/${pkgbase}_poll_files_on_nfs4.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=658884
  patch -Np1 -i "${srcdir}/${pkgbase}_deprecated_g_const_return.patch"
  # https://bugzilla.gnome.org/show_bug.cgi?id=667230, https://bugs.archlinux.org/task/33642
  patch -Np1 -i "${srcdir}/${pkgbase}_server_deadlock_ih_sub_cancel.patch"

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
