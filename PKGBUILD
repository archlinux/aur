# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=vmware-ovftool
pkgver=4.2.0.4586971
pkgrel=1
pkgdesc="VMware Open Virtualization Format tool"
arch=('i686' 'x86_64')
url="https://www.vmware.com/support/developer/ovf/"
license=('custom:vmware')
makedepends=('xorg-server-xvfb')
depends=('curl' 'expat' 'libgpg-error' 'libpng12' 'xerces-c' 'zlib')
source_i686=("http://url.muflone.com/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.i386.bundle")
source_x86_64=("http://url.muflone.com/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.x86_64.bundle")
sha256sums_i686=('53b894dfa977fbbdc7154b8e94e4746f7801e0a22b5881dd725b32638340bff6')
sha256sums_x86_64=('b1f84bfff40680c594da9840be0ffb4c36e377ae26abecddad12b4cadebfa8d8')

prepare() {
  # The bundle file doesn't allow extraction using symlinks or relative paths, here's then copied
  if [ "${CARCH}" = "x86_64" ]
  then
    _subarch="x86_64"
  else
    _subarch="i386"
  fi
  _bundlepath=$(readlink "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.${_subarch}.bundle")
  cp -f -L "${_bundlepath}" "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-${CARCH}_file.bundle"
}

build() {
  rm -rf "${srcdir}/build"
  xvfb-run -a sh "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-${CARCH}_file.bundle" -x "${srcdir}/build"
  # Remove duplicated system libraries
  cd "${srcdir}/build/${pkgname}"
  rm "libcurl.so.4" "libexpat.so" "libgcc_s.so.1" "libpng12.so.0" "libstdc++.so.6" \
     "libxerces-c-3.1.so" "libz.so.1"
}

package() {
  cd "${srcdir}/build/${pkgname}"
  # Install binaries files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" icudt44l.dat
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" ovftool ovftool.bin lib*
  # Install data files
  for _subdir in certs env env/en schemas/DMTF schemas/vmware
  do
    install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/${_subdir}"
    install -m 644 -t "${pkgdir}/usr/lib/${pkgname}/${_subdir}" "${_subdir}"/*.*
  done
  # Install main script symlink
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/ovftool" "${pkgdir}/usr/bin/ovftool"
  # Install license files
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    vmware.eula vmware-eula.rtf open_source_licenses.txt
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.txt
}

