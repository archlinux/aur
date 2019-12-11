# Maintainer: Eugene Dvoretsky <radioxoma from gmail com>
# Contributors: dreieck, jacopo

pkgname="fiji-binary"
pkgver=20191119
pkgrel=1
pkgdesc="ImageJ distribution with a lot of plugins for scientific (especially biology related) image processing."
arch=('i686' 'x86_64')
url='http://fiji.sc/'
license=('GPL')
_licenses_plugins=('GPL' 'AL' 'SPL' 'LGPL' 'EPL' 'GPL2' 'PD' 'BIG' 'imagescience' 'BSD' 'AGPL' 'MPL1.1' 'CPL' 'PSF2' 'JSF2.1' 'JPSL' 'BSD-like' 'CPL1.0' 'BSDR' 'Citationware') ## Each component has it's individual license, but the AUR does not allow such a big license array ("Error - Package license cannot be greater than 40 characters"), so they are listed in this variable just for information purposes. (The PKGBUILD does not deal with that variable at all.)
depends=('java-runtime>=8')
optdepends=('java3d: For the 3D viewer plugin.')
install=fiji.install

## Life-line build (uncomment these lines when building the lifeline version)
# source=("https://downloads.imagej.net/fiji/Life-Line/fiji-nojre-${pkgver}.zip"
#         "fiji.desktop"
#         "fiji.install")
# sha256sums=('cf9fb45c48b22a7888b479968477f1f7a300a9c833e47244cbe0d1e93890bd20'
#             '788a32dd0b24f482e78d5ec3209e9d5b3493a59e1da6edf82b1373e87c0320bc'
#             '6dcc861af9328076282893ffcecc77a7fee448cec51fb7ccd51c5cece9740fa1')

# Latest build
 pkgver() {
   wget -q -O - https://downloads.imagej.net/fiji/latest/ | grep fiji-nojre.zip | sed -E 's/^.*([0-9]{4}-[0-9]{2}-[0-9]{2}).*$/\1/' | sed 's/-//g'
 }
 source=("https://downloads.imagej.net/fiji/latest/fiji-nojre.zip"
         "fiji.desktop"
         "fiji.install")
 sha256sums=('SKIP'
             '788a32dd0b24f482e78d5ec3209e9d5b3493a59e1da6edf82b1373e87c0320bc'
             '6dcc861af9328076282893ffcecc77a7fee448cec51fb7ccd51c5cece9740fa1')


_userexecutable="fiji" # That name to be presented to the user.

_executablebase="ImageJ-linux"
if test "$CARCH" == "x86_64"; then
  _executable="${_executablebase}64"
else
  _executable="${_executablebase}"
fi


build()
{
  _extractdir="${srcdir}/Fiji.app"

  cd "${_extractdir}" || exit 11
  # Remove:
  #   * executables not suiting our architecture
  #   * an ampty dir
  #   * useless updater
  _removefrompackage=('Contents' 'ImageJ-linux32' 'ImageJ-linux64'
                      'ImageJ-win32.exe' 'ImageJ-win64.exe'
                      'plugins/Fiji_Updater.jar'
                      )
  _executablebak="$(mktemp)" || exit 21 # Save the executable matching our architecture.

  # Dry run to update plugins status
  # This was a fix for 20140602, but brokes distribution in newer versions
  # "./${_executable}" --update list-local-only

  cp "${_executable}" "${_executablebak}" || exit 31
  rm -Rf "${_removefrompackage[@]}" || exit 41
  rm -f `find -name 'imagej-updater*.jar'` || exit 42
  mv "${_executablebak}" "${_executable}" || exit 51
  chmod a+x "${_executable}" || exit 56
  ln -sf "${_executable}" "${_userexecutable}" || exit 61

  # Associate fiji.desktop with appropriate binary
  sed -ie "s/Exec=.*$/Exec=${_executable} %F/g" "${srcdir}/fiji.desktop"
  # FIJI creates own invalid desktop entry by
  # plugins/Scripts/Plugins/Utilities/Create_Desktop_Icon.bsh
}

package()
{
  _extractdir="${srcdir}/Fiji.app"

  _targetdirinrootfs="/opt/fiji"
  _targetdir="${pkgdir}${_targetdirinrootfs}"
  _bindir="${pkgdir}/usr/bin"
  mkdir -p "${_targetdir}" || exit 111
  mkdir -p "${_bindir}" || exit 116
  mkdir -p --mode=777 "${_targetdir}/samples" # Folder for image samples cache
  cp -afv "${_extractdir}"/* "${_targetdir}" || exit 121
  chown -R root:root "${_targetdir}" || true
  cd "${_bindir}" || exit 125
  # We do NOT create a executable "fiji" in the PATH, since one may want to create a custum /usr/local/bin/fiji for setting JAVA_HOME to the SUN/Oracle java. Instead, we name the executable associated with the architecture, and have "fiji" in the /opt-dir.
  # ln -sf "${_targetdir}/${_userexecutable}" "${_bindir}/${_userexecutable}" || exit 131
  ln -sf "${_targetdirinrootfs}/${_executable}" "${_executable}" || exit 135
  install -Dm644 "${srcdir}/fiji.desktop" "${pkgdir}/usr/share/applications/fiji.desktop"
  install -Dm644 "${_extractdir}/images/icon.png" "${pkgdir}/usr/share/pixmaps/fiji.png"
}
