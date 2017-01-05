# Maintainer: William Turner <willtur.will@gmail.com> 
pkgname=afdko
pkgver=2.5.b65322
pkgrel=2
pkgdesc='Tools used by Adobe font developers for wrapping up PostScript fonts as OpenType/CFF font files'
arch=('i686' 'x86_64')
url='http://www.adobe.com/devnet/opentype/afdko.html'
license=('custom')
depends=('python2'
	 'python2-fonttools'
	 'python2-booleanoperations'
	 'python2-defcon'
	 'python2-fontmath'
	 'python2-mutatormath'
	 'python2-robofab'
	 'python2-ufonormalizer')
source=("http://download.macromedia.com/pub/developer/opentype/FDK.${pkgver}/FDK-25-LINUX.${pkgver##*.}.zip"
        'use-system-python.patch'
	'profile.sh'
	'profile.csh'
        'EULA')
sha256sums=('37ca9490b2c273f621a14d76c3af12826a3d734d06cc75c18e8922ebf6104e8d'
            '37551bc17966f7e9a5d4f75eaa9d791343fc896e5fbdb0f22a98e92d762d00be'
            'af0a77eefbf707879d92fb3dfa1579d3e7002b80936633325b97b60d3833e4c2'
            'fdc7e7945896963c10d6439828a47ddc1896a8b2cd7eb98dffa409c1a630b200'
            '050181b88f4e1d455091762371d8a988982806be75b8954f55af6094d60905f4')

prepare() {
  cd "${srcdir}/FDK-25-LINUX.${pkgver##*.}"

  # remove things we won't need
  rm -r \
    FinishInstall{Linux,OSX,Windows.cmd} \
    Tools/{osx,win} \
    Tools/linux/{AFDKO,}Python

  # the bundled python install is a mess, use system
  patch -p1 -i "${srcdir}/use-system-python.patch"
}

package() {
  install -d "${pkgdir}/opt"
  cp -r "${srcdir}/FDK-25-LINUX.${pkgver##*.}" "${pkgdir}/opt/${pkgname}"
  chown -R root:root "${pkgdir}/opt/${pkgname}"

  # bash/csh profile for paths
  install -D -m755 "${srcdir}/profile.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -D -m755 "${srcdir}/profile.csh" "${pkgdir}/etc/profile.d/${pkgname}.csh"

  # license
  install -D -m644 "${srcdir}/EULA" "${pkgdir}/usr/share/licenses/${pkgname}/EULA"
}
