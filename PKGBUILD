# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: Darcy Hu <hot123tea123@gmail.com>

## This PKGBUILD creates an Arch Linux package for the proprietary MATLAB application.
## In order to build the package, the user must supply:
## 1) a plain text file installation key as file `matlab.fik`
## and
## 2) the software tarball as `matlab.tar` from MATLAB ISO image or as downloaded by the installer
## A typical matlab tarball structure looks like this:
#matlab.tar
#├── activate.ini*
#├── archives/
#│   ├── common/
#│   └── glnxa64/
#│       ├── matlab/
#│       ├── matlab_code_analyzer/
#│       ├── matlabconnector/
#│       ├── matlabdata/
#│       ├── matlab_desktop_glnxa64_1535004605.enc*
#│       ├── matlab_desktop_glnxa64_1535004605.xml*
#│       ├── ... other encrypted toolbox/related files & folders go here 
#├── bin/
#├── help/
#├── install*
#├── installer_input.txt*
#├── install_guide.pdf*
#├── java/
#├── license_agreement.txt*
#├── patents.txt*
#├── readme.txt*
#├── sys/
#├── trademarks.txt*
#├── ui/
#└── VersionInfo.xml*

## This PKGBUILD no longer attempts to activate the product.
## The user will be prompted to undertake their activation method of choice when the GUI is first run.
## Activation could be automated by running /opt/matlab/bin/activate_matlab.sh
## after this package is installed.
## That activation script could be called by matlab.install (a file that doesn't exist at this time)

# partial install
_partialinstall=false

pkgname=matlab
# install dir
_instdir="/opt/${pkgname}"
pkgver=9.5.0.944444
pkgrel=1
pkgdesc='A high-level language for numerical computation and visualization'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
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
#PKGEXT='.pkg.tar'

prepare() {
	# using system's libstdc++
	# using system's libfreetype for CJK font
	msg2 'Creating desktop file'
	gendesk -f -n --pkgname "${pkgname}" \
		--pkgdesc "${pkgdesc}" \
		--categories "Development;Education;Science;Mathematics;IDE" \
	        --exec 'env LD_PRELOAD=/usr/lib/libfreetype.so.6:/usr/lib/libstdc++.so.6 /opt/matlab/bin/matlab -desktop'

	msg2 'Extracting file installation key'
	_fik=$(grep -o [0-9-]* ${pkgname}.fik)

	msg2 'Modifying the installer settings'
	sed -i "s,^# destinationFolder=,destinationFolder=${pkgdir}/${_instdir}," "${srcdir}/installer_input.txt"
	sed -i "s,^# agreeToLicense=,agreeToLicense=yes," "${srcdir}/installer_input.txt"
	sed -i "s,^# mode=,mode=silent," "${srcdir}/installer_input.txt"
	sed -i "s,^# fileInstallationKey=,fileInstallationKey=${_fik}," "${srcdir}/installer_input.txt"

	# install all productcts by default
	sed -i "/^#product.${_product}$/ s/^#//" "${srcdir}/installer_input.txt"

	if [ ! -z ${_products+isSet} ]; then
    	msg2 'Building a package with a subset of the licensed products.'
	sed -i "s,^product,#product," "${srcdir}/installer_input.txt"
    	for _product in "${_products[@]}"; do
      		sed -i "/^#product.${_product}$/ s/^#//" "${srcdir}/installer_input.txt"
    	done
  	fi
}

package() {
	msg2 'Starting MATLAB installer'
	"${srcdir}/install" -inputFile "${srcdir}/installer_input.txt"

	msg2 'Installing license'
	install -D -m644 "${srcdir}/license_agreement.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	msg2 'Installing desktop files'
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

}

if ${_partialinstall} && [ -z ${_products+isSet} ]; then
	_products=(
		"MATLAB"
		#"Curve_Fitting_Toolbox"
		# fill in toolboxes/products here as needed for a partial install
		# hint: look in your installer_input.txt file for names to use here
		)
fi
