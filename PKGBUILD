# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=vmware-ovftool
pkgver=4.3.0.7948156
pkgrel=1
pkgdesc="VMware Open Virtualization Format tool"
arch=('x86_64')
url="https://www.vmware.com/support/developer/ovf/"
license=('custom:vmware')
makedepends=('xorg-server-xvfb')
depends=('curl' 'libxerces-c-3.1' 'icu58' 'icu60')
source=("http://url.muflone.com/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.x86_64.bundle")
sha256sums=('d327c8c7ebaac7432a589b1207410889d00c1ffd3fe18fa751b14459644de980')

prepare() {
  # The bundle file doesn't allow extraction using symlinks or relative paths, here's then copied
  _bundlepath=$(readlink "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.x86_64.bundle")
  cp -f -L "${_bundlepath}" "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-${CARCH}_file.bundle"
}

build() {
  rm -rf "build"
  xvfb-run -a sh "VMware-ovftool-${pkgver%.*}-${pkgver##*.}-${CARCH}_file.bundle" -x "${srcdir}/build"
  # Remove duplicated system libraries
  cd "build/${pkgname}"
  rm "libcares.so.2" "libcurl.so.4" "libexpat.so" "libgcc_s.so.1" "libstdc++.so.6" \
     "libxerces-c-3.1.so" "libz.so.1" \
     "icudt44l.dat" "libicudata.so.58" "libicuuc.so.58" 
}

package() {
  cd "build/${pkgname}"
  # Install binaries files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "ovftool" "ovftool.bin" lib*
  # Install data files
  for _subdir in "certs" "env" "env/en" "schemas/DMTF" "schemas/vmware"
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
    "vmware.eula" "vmware-eula.rtf" "open_source_licenses.txt"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.txt"
}

