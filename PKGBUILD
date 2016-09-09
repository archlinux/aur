# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=docfetcher
_name=DocFetcher
pkgver=1.1.18
pkgrel=1
pkgdesc="A java open source desktop search application"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=('EPL')
depends=('java-runtime>=1.6')
makedepends=('unzip')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/docfetcher-${pkgver}-portable.zip"
  'docfetcher'
  'swt.patch'
  'docfetcher.desktop')
md5sums=('b039751b4359b4159e7183e26930ffd7'
         '6a798b893868bf6b5e78093143654b39'
         '046e05ecfec4c0a2f6733c558317417f'
         '363fdc2fa2e4e8f090fdc16b86939cb3')

prepare() {
  cd "${srcdir}"

  # Patch to add where SWT libraries will be unpacked. See the following link:
  # http://docfetcher.sourceforge.net/wiki/doku.php?id=faq  
  cd "${srcdir}/${_name}-${pkgver}/"
  patch -Np0 -i ../swt.patch
}

package() {
  cd "${srcdir}/${_name}-${pkgver}/"

  # Executable
  install -Dm755 "../${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # .desktop file
  install -Dm755 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"  

  # Remove files from other platforms and other unnecessary ones
  # find . -name '*.app' -exec rm -r '{}' \;
  find . -name '*.exe' -exec rm -r '{}' \;
  find . -name '*.bat' -exec rm -r '{}' \;
  rm "Readme.txt"

  # Copy files to destination
  prefix="${pkgdir}/usr/share/${pkgname}"
  install -d "${prefix}"
  for file in *; do
    cp -a "${file}" "${prefix}/${file}"
  done
  find "${prefix}" -type d -exec chmod 0755 {} \;
  find "${prefix}" -type f -exec chmod 0644 {} \;
}
