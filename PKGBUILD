# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)

pkgname=libsemanage
pkgver=2.4
pkgrel=2
pkgdesc="SELinux binary policy manipulation library"
arch=('i686' 'x86_64')
url='http://userspace.selinuxproject.org'
license=('GPL')
groups=('selinux')
makedepends=('flex' 'python2' 'python' 'swig')
depends=('ustr-selinux' 'libselinux>=2.4' 'audit')
optdepends=('python2: python2 bindings'
            'python: python bindings')
options=(!emptydirs)
install=libsemanage.install
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20150202/${pkgname}-${pkgver}.tar.gz"
        "semanage.conf"
        '0001-libsemanage-do-not-copy-contexts-in-semanage_migrate.patch'
        '0002-libsemanage-Add-policy-binary-and-file_contexts.loca.patch'
        '0003-libsemanage-Add-file_contexts-and-seusers-to-the-sto.patch'
        '0004-libsemanage-save-homedir_template-in-the-policy-stor.patch'
        '0005-libsemanage-store-users_extra-in-the-policy-store.patch'
        )
sha256sums=('1a4cace4ef16786531ec075c0e7b2f961e2fee5dc86c5f983a689058899a6484'
            '5b0e6929428e095b561701ccdfa9c8b0c3d70dad3fc46e667eb46a85b246a4a0'
            '61a768144b740104fb2c17b6c15f10a207c0fa42d5faa611237f1df6b0a9c835'
            '3ac9a961efde8cbc091688ca3e42058baf37919b572abd96d0a8f8167f4f283c'
            '0324cfc186b09b748c74a64c74f9990dc7ee5497b8d450d4146f8fc73d6a710c'
            'bb83007a0cee3e2f3193c4935b2956e9c1894d08146c36a72505248e22c158cf'
            '3497602b0b5095c08711fd922160b9bdefdb74dff39910b2cddf8480795580bb')

prepare() {
  cd "${pkgname}-${pkgver}"

  # Apply upstream patches backported by Gentoo developers
  # Gentoo package: https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/libsemanage/
  patch -Np2 -i ../0001-libsemanage-do-not-copy-contexts-in-semanage_migrate.patch
  patch -Np2 -i ../0002-libsemanage-Add-policy-binary-and-file_contexts.loca.patch
  patch -Np2 -i ../0003-libsemanage-Add-file_contexts-and-seusers-to-the-sto.patch
  patch -Np2 -i ../0004-libsemanage-save-homedir_template-in-the-policy-stor.patch
  patch -Np2 -i ../0005-libsemanage-store-users_extra-in-the-policy-store.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  make swigify
  make all
  make PYTHON=python2 pywrap
  make PYTHON=python3 pywrap
}

package(){
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" LIBEXECDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" install
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" LIBEXECDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python2 install-pywrap
  make DESTDIR="${pkgdir}" LIBDIR="${pkgdir}/usr/lib" LIBEXECDIR="${pkgdir}/usr/lib" SHLIBDIR="${pkgdir}/usr/lib" PYTHON=python3 install-pywrap

  install -D -m0644 "${srcdir}/semanage.conf" "${pkgdir}/etc/selinux/semanage.conf"

  # Create /var/lib/selinux for the policy store
  mkdir -p "${pkgdir}/var/lib/selinux"
}
