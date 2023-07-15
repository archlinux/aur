# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=vmware-ovftool
pkgver=4.6.0.21452615
pkgrel=1
pkgdesc="VMware Open Virtualization Format tool"
arch=('x86_64')
url="https://developer.vmware.com/web/tool/ovf-tool"
license=('custom:vmware')
makedepends=('xorg-server-xvfb' 'procps-ng')
depends=('c-ares' 'expat' 'zlib' 'libxcrypt-compat')
# VMware-ovftool must be provided by the user by putting it into the build directory
# You can get the file by yourself here:
# https://customerconnect.vmware.com/downloads/get-download?downloadGroup=OVFTOOL460
source=("file://VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.x86_64.bundle")
sha256sums=('6984085ea69c95f6e2aae0b3199641f0fcf42bf61feb3654d90018dceb6ac154')

prepare() {
  # The bundle file doesn't allow extraction using symlinks or relative paths, here's then copied
  _bundlepath=$(readlink "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-lin.x86_64.bundle")
  cp -f -L "${_bundlepath}" "${srcdir}/VMware-ovftool-${pkgver%.*}-${pkgver##*.}-${CARCH}_file.bundle"
}

build() {
  rm -rf "build"
  xvfb-run -a sh "VMware-ovftool-${pkgver%.*}-${pkgver##*.}-${CARCH}_file.bundle" -x "${srcdir}/build"
}

package() {
  cd "build/${pkgname}"
  # Install binaries files
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" \
    ovftool ovftool.bin \
    libcrypto.so.1.0.2 libcurl.so.4 libgoogleurl.so.59 \
    libicudata.so.60 libicuuc.so.60 \
    libssl.so.1.0.2 libssoclient.so libxerces-c-3.2.so \
    libvim-types.so libvmacore.so libvmomi.so
  # Install data files
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" icudt44l.dat
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
