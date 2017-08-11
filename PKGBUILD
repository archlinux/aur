# Maintainer: Nicolas Iooss (nicolas <dot> iooss <at> m4x <dot> org)
# Contributor: Timothée Ravier <tim@siosm.fr>
# Contributor: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Sergej Pupykin (pupykin <dot> s+arch <at> gmail <dot> com)
# Contributor: Zezadas

pkgname=libselinux
pkgver=2.7
pkgrel=1
pkgdesc="SELinux library and simple utilities"
arch=('i686' 'x86_64' 'armv6h')
url='http://userspace.selinuxproject.org'
license=('custom')
groups=('selinux')
makedepends=('python2' 'python' 'ruby' 'xz' 'swig')
depends=('libsepol>=2.7' 'pcre')
optdepends=('python2: python2 bindings'
            'python: python bindings'
            'ruby: ruby bindings')
conflicts=("selinux-usr-${pkgname}")
provides=("selinux-usr-${pkgname}=${pkgver}-${pkgrel}")
source=("https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804/${pkgname}-${pkgver}.tar.gz"
        "libselinux.tmpfiles.d")
sha256sums=('d0fec0769b3ad60aa7baf9b9a4b7a056827769dc2dadda0dc0eb59b3d1c18c57'
            'afe23890fb2e12e6756e5d81bad3c3da33f38a95d072731c0422fbeb0b1fa1fc')

build() {
  cd "${pkgname}-${pkgver}"

  # Do not build deprecated rpm_execcon() interface. It is useless on Arch Linux anyway.
  export DISABLE_RPM=y

  make swigify
  make all
  make PYTHON=/usr/bin/python2 pywrap
  make PYTHON=/usr/bin/python3 pywrap
  make RUBY=/usr/bin/ruby rubywrap
}

package() {
  cd "${pkgname}-${pkgver}"

  export DISABLE_RPM=y

  make DESTDIR="${pkgdir}" \
    LIBSEPOLA=/usr/lib/libsepol.a \
    SBINDIR="${pkgdir}/usr/bin" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install
  make DESTDIR="${pkgdir}" PYTHON=/usr/bin/python2 \
    LIBSEPOLA=/usr/lib/libsepol.a \
    SBINDIR="${pkgdir}/usr/bin" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install-pywrap
  make DESTDIR="${pkgdir}" PYTHON=/usr/bin/python3 \
    LIBSEPOLA=/usr/lib/libsepol.a \
    SBINDIR="${pkgdir}/usr/bin" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install-pywrap
  make DESTDIR="${pkgdir}" RUBY=/usr/bin/ruby \
    LIBSEPOLA=/usr/lib/libsepol.a \
    SBINDIR="${pkgdir}/usr/bin" \
    SHLIBDIR="${pkgdir}/usr/lib" \
    install-rubywrap
  /usr/bin/python2 -m compileall "${pkgdir}/$(/usr/bin/python2 -c 'import site; print(site.getsitepackages()[0])')"
  /usr/bin/python3 -m compileall "${pkgdir}/$(/usr/bin/python3 -c 'import site; print(site.getsitepackages()[0])')"

  install -Dm 0644 "${srcdir}"/libselinux.tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/libselinux.conf

  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
