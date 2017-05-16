# Maintainer: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=docfetcher
_name=DocFetcher
pkgver=1.1.19
pkgrel=1
_gtkver=gtk3 # variable that controls whether GTK2 or 3(default) is to be used.
pkgdesc="A java open source desktop search application"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=('EPL')
depends=('java-runtime>=1.6')
makedepends=('unzip')
optdepends=('gtk2: GTK2-based interface' 'gtk3: GTK3-based interface')
source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/docfetcher-${pkgver}-portable.zip"
  'docfetcher'
  'swt.patch'
  'docfetcher.desktop')
sha256sums=('4471c48619ea319f45b431c98028b407e6e25de4040f84bd060fc9e6651076dc'
         'd49d1c1327b72345040c76ae510a3eaa520c82dd5c43f2a6e597f1c984b55c50'
         'edc2d63e3644eafe69229df44986c310a17eeecb06ce62818c24f55c9409ab54'
         '125dc909d4b59aaa7e044d7f544c8a38359d950fdb698095f70c32b099127731')

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
  
  # make start scripts executable
  chmod +x ${prefix}/DocFetcher-GTK*.sh
  
  # symlink one or other of the startup scripts for GTK2 or GTK3(default)
  if [ $_gtkver == 'gtk3' ]; then
    ln -s "${prefix}/DocFetcher-GTK3.sh" "${prefix}/DocFetcher.sh"
  elif [ $_gtkver == 'gtk2' ]; then
    ln -s "${prefix}/DocFetcher-GTK2.sh" "${prefix}/DocFetcher.sh"
  fi
}
