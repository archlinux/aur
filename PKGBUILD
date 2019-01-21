# Maintainer: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Thanks: Grey Christoforo <first name at last name dot net>
# Thanks: Darcy Hu <hot123tea123@gmail.com>

# partial install
_partialinstall=true

_pkgname=matlab
pkgname=${_pkgname}-minimal
_instdir="opt/${_pkgname}"
pkgver=R2018b
pkgrel=1
pkgdesc='A high-level language for numerical computation and visualization (without Toolbox/Simscape/Simulink/etc)'
arch=('x86_64')
url='http://www.mathworks.com'
license=('custom')
provides=('matlab')
makedepends=('gendesk')
depends=('gconf'
         'glu'
         'gstreamer0.10-base'
         'gtk2'
         'libunwind'
         'libxp'
         'libxpm'
         'libxtst'
         'nss'
         'portaudio'
         'python2'
         'qt5-svg'
         'qt5-webkit'
         'qt5-websockets'
         'qt5-x11extras'
         'xerces-c')
optdepends=('gcc6: For MEX support')

source=("local:///matlab.tar"
  "local:///matlab.fik"
  "matlab.png::https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png")
md5sums=("SKIP" "SKIP" 'cf28632239db6e02bc09bcca6bf5360f')

PKGEXT='.pkg.tar'


prepare() {
  # using system's libstdc++
  # using system's libfreetype for CJK font
  msg2 'Creating desktop file'
  gendesk -f -n --pkgname "${_pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --categories "Development;Education;Science;Mathematics;IDE" \
          --exec 'env LD_PRELOAD=/usr/lib/libfreetype.so.6:/usr/lib/libstdc++.so.6 /opt/matlab/bin/matlab -desktop'

  msg2 'Extracting file installation key'
  _fik=$(grep -o [0-9-]* ${_pkgname}.fik)

  msg2 'Modifying the installer settings'
  sed -i "s,^# destinationFolder=,destinationFolder=${pkgdir}/${_instdir}," "${srcdir}/installer_input.txt"
  sed -i "s,^# agreeToLicense=,agreeToLicense=yes," "${srcdir}/installer_input.txt"
  sed -i "s,^# mode=,mode=silent," "${srcdir}/installer_input.txt"
  sed -i "s,^# fileInstallationKey=,fileInstallationKey=${_fik}," "${srcdir}/installer_input.txt"

	if ${_partialinstall} && [ -z ${_products+isSet} ]; then
	  _products=(
	    "MATLAB"
	    #"Curve_Fitting_Toolbox"
	    # fill in toolboxes/products here as needed for a partial install
	    # hint: look in your installer_input.txt file for names to use here
	    )
	fi

  if [ ! -z ${_products+isSet} ]; then
    msg2 'Building a package with a subset of the licensed products.'
    for _product in "${_products[@]}"; do
        sed -i "/^#product.${_product}$/ s/^#//" "${srcdir}/installer_input.txt"
    done
  fi
}

package() {
  msg2 'Starting MATLAB installer'
  "${srcdir}/install" -inputFile "${srcdir}/installer_input.txt"

  msg2 'Installing license'
  install -D -m644 "${srcdir}/license_agreement.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  msg2 'Installing desktop files'
  install -D -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

}
