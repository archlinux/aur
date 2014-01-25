# Maintainer: radioxoma
# Contributor: dreieck

pkgname="fiji-binary-latest"
pkgver=20131123
pkgrel="5"
pkgdesc="ImageJ distribution with a lot of plugins for scientific (especially biology related) image processing."
arch=('i686' 'x86_64')
url='http://fiji.sc/'
license=('GPL')
_licenses_plugins=('GPL' 'AL' 'SPL' 'LGPL' 'EPL' 'GPL2' 'PD' 'BIG' 'imagescience' 'BSD' 'AGPL' 'MPL1.1' 'CPL' 'PSF2' 'JSF2.1' 'JPSL' 'BSD-like' 'CPL1.0' 'BSDR' 'Citationware') ## Each component has it's individual license, but the AUR does not allow such a big license array ("Error - Package license cannot be greater than 40 characters"), so they are listed in this variable just for information purposes. (The PKGBUILD does not deal with that variable at all.)
depends=('java-runtime>=6')
optdepends=('java3d: For the 3D viewer plugin.')
provides=("fiji=${pkgver}" "fiji-binary=${pkgver}")
replaces=("fiji<=${pkgver}" "fiji-binary<=${pkgver}")
conflicts=("fiji-binary")
source=(
        # "http://fiji.sc/downloads/Life-Line/fiji-nojre-${pkgver}.zip"
        "http://jenkins.imagej.net/job/Stable-Fiji/lastSuccessfulBuild/artifact/fiji-nojre.zip" ## This one is the "continuous build".
        "fiji.desktop"
       )
md5sums=(
         'SKIP'
         '4c59f5f24368b179aab17eac1e1dfd2a'
        )

pkgver()
{
  echo "$(date +%Y%m%d)"
}

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
  _removefrompackage=('Contents' 'ImageJ-linux32' 'ImageJ-linux64' 'ImageJ-win32.exe' 'ImageJ-win64.exe') # Remove executables not suiting our architecture, and an ampty dir.
  _executablebak="$(mktemp)" || exit 21 # Save the executable matching our architecture.
  cp "${_executable}" "${_executablebak}" || exit 31
  rm -Rf "${_removefrompackage[@]}" || exit 41
  mv "${_executablebak}" "${_executable}" || exit 51
  chmod a+x "${_executable}" || exit 56
  ln -sf "${_executable}" "${_userexecutable}" || exit 61

  # Associate fiji.desktop with appropriate binary
  sed -ie "s/Exec=.*$/Exec=${_executable} %F/g" "${srcdir}/fiji.desktop"
}

package()
{
  _extractdir="${srcdir}/Fiji.app"

  _targetdirinrootfs="/opt/fiji"
  _targetdir="${pkgdir}/${_targetdirinrootfs}"
  _bindir="${pkgdir}/usr/bin"
  mkdir -p "${_targetdir}" || exit 111
  mkdir -p "${_bindir}" || exit 116
  cp -afv "${_extractdir}"/* "${_targetdir}" || exit 121
  chown -R root:root "${_targetdir}" || true
  cd "${_bindir}" || exit 125
  # ln -sf "${_targetdir}/${_userexecutable}" "${_bindir}/${_userexecutable}" || exit 131 # We do NOT create a executable "fiji" in the PATH, since one may want to create a custum /usr/local/bin/fiji for setting JAVA_HOME to the SUN/Oracle java. Instead, we name the executable associated with the architecture, and have "fiji" in the /opt-dir.
  ln -sf "${_targetdirinrootfs}/${_executable}" "${_executable}" || exit 135
  install -Dm644 "${srcdir}/fiji.desktop" "${pkgdir}/usr/share/applications/fiji.desktop"
}
